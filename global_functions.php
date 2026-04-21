<!DOCTYPE html>
<html lang="en">
<head>
    <!-- <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher</title> -->
    <link rel="stylesheet" href="style.css">
</head>

<?php

    function show_thesis($thesis_row, $conn, $show_teacher = true){

        // echo "<body><div><p>";
        // echo "Thesis ID: " .$thesis_row["id"]. "<br>";
        echo "Thesis Title:<br>". $thesis_row["title"] ."<br>";
        echo "Thesis Description:<br>". $thesis_row["description"] ."<br><br>";
        
        $file_rows = get_rows_from_table_where("files", "thesis_id", $thesis_row["id"], $conn);
        if (mysqli_num_rows($file_rows) > 0){
            $file_row = mysqli_fetch_assoc($file_rows);
            echo '
            Thesis File: 
            <a href="'.$file_row["filepath"].$file_row["filename"].'" download>'. $file_row["filename"].'</a><br>
            ';
            
        }

        if ($show_teacher){
            echo "Thesis Creator:<br>";
            $teacher = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $thesis_row["teacher"], $conn));
            show_teacher($teacher, $conn);

        }
        // echo "</p></div></body>";
    }

    function show_relation($relation_row, $show_downloadable_files = true, $conn, $show_student = true, $show_creator = true){

        // echo "<p>";
        $thesis_row = mysqli_fetch_assoc(get_rows_from_table_where("thesis", "id", $relation_row["thesis_id"], $conn));
        
        // show assigned thesis info
        
        // echo "Thesis ID: " .$thesis_row["id"]. "<br>";
        echo "Thesis Title: {$thesis_row["title"]}" . "<br>";
        echo "Thesis Description: <br> {$thesis_row["description"]}" . "<br><br>";
        echo "Thesis Status: ". $relation_row["status"]."<br>";
        echo "Student Assigned Date: ". $relation_row["pending_assignment_datetime"] ."<br>";
        echo "Set as Active Date: ". $relation_row["activated_datetime"] ."<br><br>";

        $file_rows = get_rows_from_table_where("files", "thesis_id", $thesis_row["id"], $conn);
        if (mysqli_num_rows($file_rows) > 0){
            $file_row = mysqli_fetch_assoc($file_rows);
            echo '
            Thesis File: 
            <a href="'.$file_row["filepath"].$file_row["filename"].'" download>'. $file_row["filename"].'</a><br>
            ';
            
        }

        // show student info
        
        if ($show_student){
            echo "<br>Assigned Student:<br>";
            show_student(mysqli_fetch_assoc(get_rows_from_table_where("student", "email", $relation_row["stu_email"], $conn)), $conn);

        }

        // show teachers infos

        if ($show_creator){
            echo "<br>Thesis Creator:<br>";
            $teacher = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $thesis_row["teacher"], $conn));
            show_teacher($teacher, $conn);

        }

        echo "<br>Examiner 1:<br>";
        if ($relation_row["teach1_email"]){
            $teacher = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $relation_row["teach1_email"], $conn));
            show_teacher($teacher, $conn);  
        }
        else{
            echo "There is no teacher assigned to the first slot.<br>";
        }   

        echo "<br>Examiner 2:<br>";
        if ($relation_row["teach2_email"]){
            $teacher = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $relation_row["teach2_email"], $conn));
            show_teacher($teacher, $conn);  
        }
        else{
            echo "There is no teacher assigned to the second slot.<br>";
        }

        // show thesis content

        if ($show_downloadable_files){
            echo "<br>Thesis Content:<br>";

            $this_id = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $relation_row["stu_email"], $conn))["id"];
            $files_path = "uploads/". (string)$this_id."/";

            echo '
            Drive Link: 
            <a href="'. $relation_row["drivelink"].'">'. $relation_row["drivelink"].'</a><br>
            ';
            echo '
            Nemetres Link: 
            <a href="'. $relation_row["nemetreslink"].'">'. $relation_row["nemetreslink"].'</a><br>
            ';

            echo "<br>Student files:<br>";

            if (is_dir($files_path)){
                // $all_thesis_files = scandir($files_path);
                $all_thesis_files = array_diff(scandir($files_path), array('.', '..'));
                foreach ($all_thesis_files as $file){
                    echo '
                    <a href="'.$files_path.$file.'" download>'. $file.'</a><br>
                    ';
                }
            
            }
            else{
                echo "There are no uploaded files for this Thesis.<br>";
            }
        }

        // show thesis grades
        
        if ($relation_row["status"] == "being_examined" || $relation_row["status"] == "finished"){
            echo "<br>Thesis Creator Grade: ".$relation_row["grade_creator"]. "<br>";
            echo "Thesis Creator Examiner 1: ".$relation_row["grade_exam1"]. "<br>";
            echo "Thesis Creator Examiner 2: ".$relation_row["grade_exam2"]. "<br>";
            
            $grade_avrg = "N/A";
            if ($relation_row["grade_creator"] && $relation_row["grade_exam1"] && $relation_row["grade_exam2"]){
                $grade_avrg = (($relation_row["grade_creator"] + $relation_row["grade_exam1"] + $relation_row["grade_exam2"]) / 3);
                $grade_avrg = round($grade_avrg, 2);
            }
            echo "Grade Average: ". $grade_avrg;

        }
        echo "<br>";
        // echo "</p>";


    }

    function show_teacher($teacher_row, $conn){
        // echo "<p>";
        $user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $teacher_row["email"], $conn));
        echo "Teacher Name: ". $user_row["name"] ."<br>";
        echo "Teacher Surname: ". $user_row["surname"] ."<br>";
        echo "Teacher Email: ". $user_row["email"] ."<br>";
        echo "Topic: ". $teacher_row["topic"] ."<br>";
        echo "Landline: ". $teacher_row["landline"] ."<br>";
        echo "Mobile: ". $teacher_row["mobile"] ."<br>";
        echo "Department: ". $teacher_row["department"] ."<br>";
        echo "University: ". $teacher_row["university"] ."<br>";
        // echo "</p>";

    }

    function show_student($student_row, $conn){

        // echo "<p>";
        $user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $student_row["email"], $conn));

        // echo "A student named ".$user_row["name"]." has requested you as an examiner on their thesis.<br>";
        echo "Student Name: ". $user_row["name"]."<br>";
        echo "Student Surname: ". $user_row["surname"]."<br>";
        echo "Student Email: ".$student_row["email"]."<br>";
        echo "Student AM: ".$student_row["am"]."<br>";
        echo "Student Street: " . $student_row["street"] . "<br>";
        echo "Student Street Number: " . $student_row["number"] . "<br>";
        echo "Student City: " . $student_row["city"] . "<br>";
        echo "Student Postcode: " . $student_row["postcode"] . "<br>";
        echo "Student' Father Name: " . $student_row["father_name"] . "<br>";
        echo "Student Mobile Phone: " . $student_row["cellphone"] . "<br>";
        echo "Student Landline: " . $student_row["phone"] . "<br>";

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
        // echo "</p>";
    }

    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';

        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[random_int(0, $charactersLength - 1)];
        }

        return $randomString;
    }

?>


<!-- Upload file logic -->
<!-- source: https://www.w3schools.com/php/php_file_upload.asp -->
<?php

// session_start();
// include("database.php");

function upload_file($conn, $allowed_formats = array("txt", "json", "docx", "doc", "pdf", "jpeg", "png"), $thesis_id = -1, $insert_to_db = false){

    $_SESSION["Upload Message"] = "default message<br>";
    // user email
    $this_email = $_SESSION['email'];
    // user id
    $this_id = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $this_email, $conn))["id"];
    $user_type = check_user_type($this_email, $conn);
    
    $target_dir = "uploads/";
    if (!is_dir($target_dir)){
        mkdir($target_dir);
    }
    if (!is_dir($target_dir. $this_id."/")){
        mkdir($target_dir. $this_id."/");
        $target_dir = $target_dir. $this_id."/";
    }
    else{
        $target_dir = $target_dir. $this_id."/";
    }
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    
    // // Check if image file is a actual image or fake image
    // if(isset($_POST["submit"])) {
    //   $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    //   if($check !== false) {
    //     echo "File is an image - " . $check["mime"] . ".";
    //     $uploadOk = 1;
    //   } else {
    //     echo "File is not an image.";
    //     $uploadOk = 0;
    //   }
    // }
    
    // add_log($target_file, $conn);
    add_log("file name: ". basename($_FILES["fileToUpload"]["name"]), $conn);
    // Check if file already exists
    if (file_exists($target_file)) {
        $_SESSION["Upload Message"] = "Sorry, file already exists.<br>";
      echo "Sorry, file already exists.";
      $uploadOk = 0;
      return false;
    }
    
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 10000000) {
        $_SESSION["Upload Message"] = "Sorry, your file is too large.<br>";
      echo "Sorry, your file is too large.";
      $uploadOk = 0;
      return false;
    }
    
    // // Allow certain file formats
    // if ($user_type){
    //     $allowed_formats = array("json");
    // }
    
    foreach ($allowed_formats as $format){
        // add_log("format check: type: $imageFileType check format: $format", $conn);
        if ($imageFileType == $format){
            $uploadOk = 1;        
            break;
        }
        else{
            // echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
            $_SESSION["Upload Message"] = "Error uploading file: Format not supported.<br>";
            
        }
    }
    
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
      echo "Sorry, your file was not uploaded.";
      return false;
    // if everything is ok, try to upload file
    }
    else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
            $_SESSION["Upload Message"] = "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.<br>";
            $_SESSION["JSONimport"] = $target_file;
            if ($insert_to_db){
                insert_file($this_id, $thesis_id, basename($_FILES["fileToUpload"]["name"]), $target_dir, $conn);

            }
            return true;
            
            // if (isset($_POST["Uploadnew"])){
            //     echo "<hr>tried inserting file<br>";
            //     echo $_FILES["fileToUploadnew"];
            //     echo "<hr>";
            //     insert_file($this_user_row["id"], $_FILES["fileToUploadnew"], $conn);
            // }
        } 
        else {
            echo "Sorry, there was an error uploading your file.";
            $_SESSION["Upload Message"] = "There was an unexpected error uploading your file.<br>";
            return false;
        }
    }
    
    // if ($user_type == "student"){
    //     header("Location: student.php");
    // }
    // elseif ($user_type == "secretary"){
    //     header("Location: secretary_insert_json.php");
        
    // }
}

?>
