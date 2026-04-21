<!-- Choose a student to assign a thesis to them -->

<?php

    session_start();
    include("header.html");
    include("database.php");
    include("global_functions.php");
    include("teacher_header.html");
    if (isset($_SESSION["thesisid"])){
        unset($_SESSION["thesisid"]);
    }
    if (isset($_SESSION["studentemail"])){
        unset($_SESSION["studentemail"]);
    }
?>

<!-- check if user is a teacher -->

<?php
    //session_start();

    //echo "<br><br>Teacher Page<br>";
    //echo $_POST["email"];
    
    /*
    if (isset($_POST["logout"])){
        session_destroy();
        header("Location: index.php");
    }
    */

    if(check_user_type($_SESSION['email'], $conn) == "teacher"){
        //echo "Email is: ";
        //echo $_SESSION['email']; // display the message

    }
    else{
        header("Location: index.php");
    }

    echo "<h1>Choose a Student to Assign Thesis</h1><hr>";

    $email = $_SESSION["email"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Thesis to Student</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    Search By
    <form method="post">
        <select name="type" id="type" size="1">
            <option>Student Surname</option>
            <option>Student AM</option>
        </select>
        <label>Input: </label><br>
        <input type="search" name="input" placeholder="Leave Empty to Show All Students" style="width: 300px;"><br><br>
        <input type="submit" name="submit" value="Search">
    </form>
</body>
</html>


<?php

    $student_rows;
    $input;

    if (isset($_POST["submit"])){
        //echo $_POST["type"];

        $input = filter_input(INPUT_POST, "input", FILTER_SANITIZE_SPECIAL_CHARS);
    }
    
    if (isset($_POST["submit"])){
        if ($_POST["input"] == ""){
            $student_rows = get_rows_from_table("student", $conn);
            
        }
        elseif ($_POST["type"] == "Student Surname"){
            $sname = filter_input(INPUT_POST, "input", FILTER_SANITIZE_SPECIAL_CHARS);
            $sql = "SELECT * FROM student WHERE email in (SELECT email FROM user WHERE surname LIKE '%".$sname."%')";
            $student_rows = mysqli_query($conn, $sql);
        }
        elseif ($_POST["type"] == "Student AM"){
            $sam = filter_input(INPUT_POST, "input", FILTER_SANITIZE_SPECIAL_CHARS);
            $student_rows = get_rows_from_table_where("student", "am", $sam, $conn);
            } 
    }
    else{
        $student_rows = get_rows_from_table("student", $conn);
    }
                
    // $row_num = 0;

    // show all students

    if ($student_rows){
        // $row_assoc = array();
        while ($row = mysqli_fetch_assoc($student_rows)){

            

            // $row_assoc[(string)$row_num] = $row["email"];

            $user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $row["email"], $conn));

            if (isset($_POST['assignbutton'.(string)$user_row["id"]])){
                unset($_SESSION["studentemail"]);
                $_SESSION["studentemail"] = $row["email"];

                add_log("heading to assign student page with student email: ". $_SESSION["studentemail"], $conn);
                
                header("Location: teacher_assign_student.php");
                break;
            }            

            // check if a thesis can be assigned to the student
            // if not don't show the student

            // row from thesis relation where student has an active thesis
            // otherwise null

            $students_active_thesis = get_rows_from_table_condition("student_thesis_relation", "stu_email = '".$row["email"]."' AND NOT status = 'canceled'", $conn);
            
            
            // show student with no assigned thesis or canceled thesis
            // therefore this student can be assigned a thesis
            echo "<div>";
            show_student($row, $conn);

            // echo "<hr>";
            // echo "Student Name:" . mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $row["email"], $conn))["name"] . "<br>";
            // echo "Student Email: " . $row["email"] . "<br>";
            // echo "Student AM: " . $row["am"] . "<br>";
            // echo "Student Street: " . $row["street"] . "<br>";
            // echo "Student Street Number: " . $row["number"] . "<br>";
            // echo "Student City: " . $row["city"] . "<br>";
            // echo "Student Postcode: " . $row["postcode"] . "<br>";
            // echo "Student' Father Name: " . $row["father_name"] . "<br>";
            // echo "Student Mobile Phone: " . $row["cellphone"] . "<br>";
            // echo "Student Landline: " . $row["phone"] . "<br>";

            // if thesis can be assigned to this student create button

            if (!(mysqli_num_rows($students_active_thesis) > 0)){
                echo 
                '<form action="teacher_assign_student_list.php" method="post">
                <input type="submit" name="assignbutton'.(string)$user_row["id"].'" value="Assign a Thesis to this Student">
                </form>';    
            }
            else{
                echo "<br>You cannot assign a thesis to this student because they are already assigned to a thesis<br>";
            }

            
            echo "</div><hr>";
        // $row_num ++;
        }
    }
    else{
        echo "<br>No students found with your current search";
    }

?>



<?php
    //mysqli_close($conn);
    
    try{
        mysqli_close($conn);
    }
    catch(TypeError){
        echo "";
    }
    
?>