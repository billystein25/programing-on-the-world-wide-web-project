<?php
    
    session_start();
    include("database.php");
    // include("upload.php");
    include("header.html");
    include("global_functions.php");
    include("secretary_header.html");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert JSON</title>
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

    // echo "Secretary Page<br>";
    //echo $_POST["email"];

    $this_email;

    if(check_user_type($_SESSION['email'], $conn) == "secretary"){
        $this_email = $_SESSION['email'];
        
    }
    else{
        header("Location: index.php");
    }

    // echo $this_email;
    echo "<h1>Insert JSON</h1>";
    echo "<hr>";

?>

<!DOCTYPE html>
<html>
    <body>
    <form action="secretary_insert_json.php" method="post" enctype="multipart/form-data">
        Upload JSON
        <input type="file" name="fileToUpload" id="fileToUpload" required><br>
        <input type="submit" value="Upload" name="fileUpload">
    </form>

    </body>
</html>
                

<?php

    if (isset($_SESSION["Upload Message"])){
        echo "<hr>";
        echo $_SESSION["Upload Message"];
        // unset($_SESSION["Upload Message"]);
    }

    // $path = 0;

    if (isset($_POST["fileUpload"])){
        upload_file($conn, array("json"));
        // if (){
        // // delete_file_from_db($file_row, $conn);
        
        // }
        header("Location: secretary_insert_json.php");

    }

    if (isset($_SESSION["JSONimport"])){
        $path = $_SESSION["JSONimport"];
        unset($_SESSION["JSONimport"]);
        
        if ($path){
            $jsonString = file_get_contents($path);
            $jsonData = json_decode($jsonString, true);
    
            foreach ($jsonData["students"] as $student){
                register_user($student["name"], $student["surname"], $student["email"], "0", "student", $conn);
                register_student($student["email"], $student["student_number"], $student["street"], $student["number"], $student["city"], $student["postcode"], $student["father_name"], $student["mobile_telephone"], $student["landline_telephone"], $conn);
            }
            foreach ($jsonData["professors"] as $teacher){
                register_user($teacher["name"], $teacher["surname"], $teacher["email"], "0", "teacher", $conn);
                register_teacher($teacher["email"], $teacher["topic"], $teacher["landline"], $teacher["mobile"], $teacher["department"], $teacher["univercity"], $conn);
            }
    
            unlink($path);
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