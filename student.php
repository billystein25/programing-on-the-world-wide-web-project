<?php
    
    session_start();
    include("database.php");
    // include("upload.php");
    include("header.html");
    include("student_header.html");
    include("global_functions.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
</body>
</html>

<?php
    //session_start();

    /*
    if (isset($_POST["logout"])){
        session_destroy();
        header("Location: index.php");
    }
    */

    echo "<h1>Student Home Page</h1>";
    $this_email;
    //echo $_POST["email"];

    if(check_user_type($_SESSION['email'], $conn) == "student"){
        // echo "Email is: ";
        // echo $_SESSION['email']; // display the message
        $this_email = $_SESSION['email'];
    }
    else{
        header("Location: index.php");
    }

    // echo "<hr>". $_SESSION["Upload Message"]."<hr>";

    if (isset($_SESSION["Upload Message"])){
        echo "<hr>";
        echo $_SESSION["Upload Message"];
        // unset($_SESSION["Upload Message"]);
    }

    // store rows to display information later
    // user row
    $this_user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $this_email, $conn));
    // student row
    $this_student_row = mysqli_fetch_assoc(get_rows_from_table_where("student", "email", $this_email, $conn));

    // show the thesis this student is currently part of
    echo "<hr>";

    $student_thesis_relation_rows = get_rows_from_table_condition("student_thesis_relation", "stu_email = '". $this_email."' AND status != 'canceled'", $conn);
    if (mysqli_num_rows($student_thesis_relation_rows) > 0){

        while ($student_thesis_relation_row = mysqli_fetch_assoc($student_thesis_relation_rows)){

            echo "<div>";

            if ($student_thesis_relation_row["grade_creator"]
             && $student_thesis_relation_row["grade_exam1"]
             && $student_thesis_relation_row["grade_exam2"]){
                
                echo'
                <a href="report_template.pdf" download>Πρακτικό Εξέτασης</a><br><br>
                ';
            }

            if (isset($_POST["setdrive"])){

                update_table_row("student_thesis_relation", "drivelink", $_POST["drivelink"], "id", $student_thesis_relation_row["id"], $conn);
                header("Location: student.php");
            }

            if (isset($_POST["setnemetres"])){

                update_table_row("student_thesis_relation", "nemetreslink", $_POST["nemetreslink"], "id", $student_thesis_relation_row["id"], $conn);
                header("Location: student.php");
            }
            
            // echo "<div>";
            show_relation($student_thesis_relation_row, false, $conn, false);

            // downloadable files 
            // are seperate from global_functions.php to also be deleteable

            echo "<br>Thesis Content:<br>";

            $this_id = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $this_email, $conn))["id"];
            // $files_path = "uploads/". (string)$this_id."/";

            $file_rows = get_rows_from_table_where("files", "user_id", $this_id, $conn);

            if ($student_thesis_relation_row["status"] == "active" ||
                $student_thesis_relation_row["status"] == "being_examined"){
                echo'
                <form action="student.php" method="post">
                Drive Link:
                <input size="30" type="text" name="drivelink" value="'.$student_thesis_relation_row["drivelink"].'" placeholder="https://drive.google.com" required><br>
                <input type="submit" value="Set Link" name="setdrive">
                </form>
                ';
    
                echo'
                <form action="student.php" method="post">
                Nemetres Link: 
                <input size="30" type="text" name="nemetreslink" value="'.$student_thesis_relation_row["nemetreslink"].'" placeholder="https://nemertes.library.upatras.gr/" required><br>
                <input type="submit" value="Set Link" name="setnemetres">
                </form>
                ';

                }
            else{
                // echo'
                // Drive Link: '. $student_thesis_relation_row["drivelink"].'<br>
                // Nemetres Link: '. $student_thesis_relation_row["nemetreslink"].'<br>';

                echo '
                Drive Link: 
                <a href="'. $student_thesis_relation_row["drivelink"].'">'. $student_thesis_relation_row["drivelink"].'</a><br>
                ';
                echo '
                Nemetres Link: 
                <a href="'. $student_thesis_relation_row["nemetreslink"].'">'. $student_thesis_relation_row["nemetreslink"].'</a><br>
                ';

            }

            // show files

            echo "Files:<br>";
            
            if (mysqli_num_rows($file_rows) > 0){
                while ($file_row = mysqli_fetch_assoc($file_rows)){
                    
                    if (isset($_POST['filedelete'.(string)$file_row["id"]])){
                        echo "tried to delete file";
                        delete_file_from_db($file_row, $conn);
                        // unlink($files_path.$file);
        
                        header("Location: student.php");
                    }
                    
                    if ($student_thesis_relation_row["status"] == "active" ||
                        $student_thesis_relation_row["status"] == "being_examined"){
                        echo '
                        <form action="student.php" method="post" style="border-left-style: none; padding: 5px;">
                        <a href="'.$file_row["filepath"]. $file_row["filename"].'" download>'. $file_row["filename"].'</a>
                        <input type="submit" value="Delete This file" name="filedelete'.$file_row["id"].'">
                        </form>
                        ';
                    }
                    else{
                        echo '
                        <a href="'.$file_row["filepath"]. $file_row["filename"].'" download>'. $file_row["filename"].'</a>
                        <br>';
                    }
                }
            }
            else{
                echo "There are no uploaded files for this Thesis.<br>";
            }



            //  allow content update

            if ($student_thesis_relation_row["status"] == "under_examination" ||
                $student_thesis_relation_row["status"] == "active"){

                if (isset($_POST["fileUpload"])){
                    upload_file($conn, array("txt", "json", "docx", "doc", "pdf", "jpeg", "png"), $student_thesis_relation_row["thesis_id"], true);
                    header("Location: student.php");

                }

                echo '
                <br>              
                <!DOCTYPE html>
                <html>
                <body>
                <form action="student.php" method="post" enctype="multipart/form-data">
                Upload thesis File:
                <input type="file" name="fileToUpload" id="fileToUpload" required><br>
                <input type="submit" value="Upload" name="fileUpload">
                </form>

                </body>
                </html>
                ';
            }
            else{
                echo "<br>You are not allowed to upload files to this thesis.<br>";
            }

            echo "</div><hr>";

        }
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