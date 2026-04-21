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

    $email = $_SESSION["email"];
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Manager</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    
</body>
</html>

<?php
    echo "<h1>My Requests</h1>";
    echo "<hr>";
    // echo "Email: {$_SESSION['email']}<hr>";

    // get and show all requests associated with the logged in teacher

    $request = get_rows_from_table_where("request", "teach_email", $email, $conn);

    if (mysqli_num_rows($request) > 0){

        // $row_num = 0;

        while ($request_row = mysqli_fetch_assoc($request)){

            // get info on student, thesis, and teacher to display

            $relation_row = mysqli_fetch_assoc(get_rows_from_table_where("student_thesis_relation", "id", $request_row["relation_id"], $conn));
            $student_email = $relation_row["stu_email"];
            $student_row = mysqli_fetch_assoc(get_rows_from_table_where("student", "email", $student_email, $conn));
            echo "<div>";
            echo "A student has requested you as an examiner for their thesis.<br>Student info:<br>";
            show_student($student_row, $conn);
            echo "<br>Thesis info:<br>";
            show_relation($relation_row, false, $conn, false);
            
            if (isset($_POST['acceptbutton'.(string)$request_row["id"]])){
                
                acc_decl_request($request_row["id"], "accepted", $conn);
                add_examiner_to_thesis($request_row["relation_id"], $email, $conn);
                sleep(0.2);
                auto_cancel_requests($request_row["relation_id"], $conn);
                
                header("Location: teacher_thesis_request.php");
                break;
            }
            elseif (isset($_POST['declinebutton'.(string)$request_row["id"]])){
                
                acc_decl_request($request_row["id"], "declined", $conn);
                
                header("Location: teacher_thesis_request.php");
                break;
            }
            
            echo "<br>Request Status: ".$request_row["status"]."<br>";
            
            // show button only if the status is pending
            
            if ($request_row["status"] == "pending"){
                
                echo
                '<form action="teacher_thesis_request.php" method="post">
                <input type="submit" name="acceptbutton'.$request_row["id"].'" value="Accept request as an Examiner">
                <input type="submit" name="declinebutton'.$request_row["id"].'" value="Decline request as an Examiner">
                </form>';  
            }
            else{
                if ($request_row["status"] == "declined"){
                    echo '
                    <p style="color:red;">You have already declined this request.</p>
                    ';
                }
                else{
                    echo '
                    <p style="color:red;">This thesis already has 3 examiners or you are already an examiner.</p>
                    ';

                }
            }
            echo "</div>";
            echo "<hr>";
            // $row_num++;
            
            
        }
    }
    else{
        echo '
        <p style="color:#AA0000;">
        You do not have any active requests at this moment.
        </p> 
        ';
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