<!-- In this page the student can request teachers to be assigned to their thesis -->

<?php
    session_start();
    include("header.html");
    include("database.php");
    include("global_functions.php");
    include("student_header.html");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request a Teacher</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
</body>
</html>
<body>
    <h1>Request Teacher</h1><hr>
    Search By Teacher Surname:
    <form method="post">
        <input type="search" name="input" placeholder="Leave Empty to show all Teachers" style="width: 300px;"><br>
        <input type="submit" name="submit" value="Search">
    </form>
</body>
</html>

<?php

    // if the logged in user isn't a student log them out by returning them to index.php

    $this_email;

    if(check_user_type($_SESSION['email'], $conn) == "student"){
        // echo "Email is: ";
        // echo $_SESSION['email']; // display the message
        $this_email = $_SESSION['email'];
    }
    else{
        header("Location: index.php");
    }

    $search_surname = "";
    if (isset($_POST["submit"])){
        if (isset($_POST["input"])){
            $search_surname = $_POST["input"];
        }
    }

    // show currently active thesis and information
    // show all availiable teachers 
    // exclude teachers who are already part of the currently active thesis
    // add teachers by making a request in the request table

    $student_thesis_relation_rows = get_rows_from_table_condition("student_thesis_relation", "stu_email = '".$this_email."' AND NOT status = 'canceled'", $conn); 

    if (0 < mysqli_num_rows($student_thesis_relation_rows)){
        $student_thesis_relation_row = mysqli_fetch_assoc($student_thesis_relation_rows);

        echo "<hr><h2>My Active Thesis:</h2><hr>";
        echo "<div>";
        show_relation($student_thesis_relation_row, true, $conn, false);
        echo "</div>";
        // if thesis already has 2 examiners don't show teachers

        if ($student_thesis_relation_row["status"] == "pending_assignment"){
            
            // show availiable teachers to request for thesis
    
            echo "<hr><h2>Availiable Teachers</h2><hr>";
            
            $teacher_users = get_rows_from_table_where("user", "type", "teacher", $conn);
            if ($search_surname != ""){
                $teacher_users = get_rows_from_table_condition("user", "type = 'teacher' AND surname LIKE '%".$search_surname."%'", $conn);
            }
            
            // $row_num = 0;
    
            // iterate through all teachers
    
            while ($teacher_user = mysqli_fetch_assoc($teacher_users)){
                
                $curr_teacher_email = $teacher_user["email"];
                $teacher = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $curr_teacher_email, $conn));
                // echo $curr_teacher_email."<br>";
                // $row_num++;
            
                // only show teachers not already associated with thesis
    
                if (!is_teacher_related($student_thesis_relation_row, $teacher["email"], $conn)){
    
                    // check if button has been pressed
    
                    if (isset($_POST['acceptbutton'.(string)$teacher_user["id"]])){
    
                        request_examiner_for_thesis($student_thesis_relation_row["id"], $curr_teacher_email, $conn);
                        header("Location: student_request_teacher.php");
                    }
    
                    // show teacher info
    
                    $teacher_row = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $teacher["email"], $conn));
                    echo "<div>";
                    show_teacher($teacher_row, $conn);
    
                    // show button to request to add to thesis
                    // only if there is no request for this teacher already
    
                    if (mysqli_num_rows(get_rows_from_table_condition("request", "relation_id = ".$student_thesis_relation_row["id"]." AND teach_email = '$curr_teacher_email'", $conn)) == 0){
                        echo
                        '<form action="student_request_teacher.php" method="post">
                        <input type="submit" name="acceptbutton'.$teacher_user["id"].'" value="Request this examiner to join the Thesis">
                        </form>';
    
                    }
                    else{
                        echo "<br>You have already requested this teacher to be a part of your thesis.<br>";
                        $request_reply = mysqli_fetch_assoc(
                                             get_rows_from_table_condition(
                                                "request", "relation_id = ".$student_thesis_relation_row["id"]." AND teach_email = '$curr_teacher_email'", $conn
                                             )
                                         )["status"];
                        echo "Reply: $request_reply <br>";
                    }

                    echo "</div>";
    
    
                    echo "<hr>";
                }
                // else{
                //     echo "teacher skipped<br>";
                // }
            }
        }
        else{
            echo '
            <p style="color:red;">This Thesis is active. Teacher assignment period is over.</p>
            ';
        }
        
    }
    else{
        echo "You do not have an active thesis currently.<br>";
    }
    
    // returns true if the teacher is associated with this thesis in any way

    function is_teacher_related($this_relation, $teacher_email, $conn){

        $this_thesis = mysqli_fetch_assoc(get_rows_from_table_where("thesis", "id", $this_relation["thesis_id"], $conn));

        if (mysqli_num_rows(get_rows_from_table_condition("thesis", "id = '".$this_thesis["id"]."' AND teacher = '".$teacher_email."'", $conn)) > 0){
            return true;
        }
        if (mysqli_num_rows(get_rows_from_table_condition("student_thesis_relation", "id = '".$this_relation["id"]."' AND teach1_email = '".$teacher_email."' AND NOT status = 'canceled'", $conn)) > 0){
            return true;
        }
        if (mysqli_num_rows(get_rows_from_table_condition("student_thesis_relation", "id = '".$this_relation["id"]."' AND teach1_email = '".$teacher_email."' AND NOT status = 'canceled'", $conn)) > 0){
            return true;
        }
        return false;
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