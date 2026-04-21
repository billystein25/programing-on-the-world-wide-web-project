<?php

    // this page is used by the teacher to edit the respective thesis

    session_start();
    include("database.php");
    // include("upload.php");
    include("header.html");
    include("teacher_header.html");
    include("global_functions.php")
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thesis Edit</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    
</body>
</html>


<?php

    $email;
    $thesisid;

    if (isset($_SESSION["email"])){
        $email = $_SESSION["email"];
        if (isset($_SESSION["thesisid"])){
            $thesisid = $_SESSION["thesisid"];
            //echo"here";
        }
        else{
            header("Location: teacher.php");    
        }
    }
    else{
        header("Location: index.php");
    }

    echo "<h1>Edit this Thesis</h1>";
    echo "<hr>";
    // echo "Email is: {$email} and thesisid is: {$thesisid}<hr>";

    if (isset($_SESSION["Upload Message"])){
        echo $_SESSION["Upload Message"];
        // unset($_SESSION["Upload Message"]);
        echo "<hr>";
    }

    $current_thesis_rows = get_rows_from_table_where("thesis", "id", $thesisid, $conn);
    $current_thesis_title;
    $current_thesis_desc;
    $current_thesis_row;
    
    if (mysqli_num_rows($current_thesis_rows) > 0){
        while ($current_thesis_row = mysqli_fetch_assoc($current_thesis_rows)){
            
            
            // button handler
            if (isset($_POST["enter"])){
                
                $title_check = isset($_POST["title"]);
                $desc_check = isset($_POST["desc"]);
                
                if ($title_check && $desc_check){
                    
                    $title = filter_input(INPUT_POST, "title", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                    $desc = filter_input(INPUT_POST, "desc", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                    //$title = $_POST["title"];
                    //$desc = $_POST["desc"];
                    
                    update_table_row("thesis", "title", $title, "id", $thesisid, $conn);
                    update_table_row("thesis", "description", $desc, "id", $thesisid, $conn);
                }
                else{
                    echo "Please enter all fields.";
                }
                
                // clear post after entering thesis or it gets readed on every refresh
                
                //unset($_POST["enter"]);
                
                header("Location: edit_thesis.php");
                
            }
            
            $file_rows = get_rows_from_table_where("files", "thesis_id", $current_thesis_row["id"], $conn);
            
            // echo "Current Thesis Title:<br>";
            // echo $current_thesis_row["title"] . "<br>";
            
            
            // echo "Current Thesis Description: <br>";
            // echo $current_thesis_row["description"];
            
            echo "<h2>Current Thesis Contents</h2>";
            
            echo "<hr><div>";
            show_thesis($current_thesis_row, $conn, false);

            $current_thesis_title = $current_thesis_row["title"];
            $current_thesis_desc = $current_thesis_row["description"];

            echo "</div>";

            echo
            '
            <hr>
            <h2>Edit Thesis</h2><hr>
            <div>
            <form action="edit_thesis.php" method="post">
                <label>Thesis Title: </label><br>
                <input type="text" name="title" value="'.$current_thesis_title.'" placeholder="title" required><br>
                <label>Thesis Description: </label><br>
                <textarea type="text" name="desc" cols="40" rows="5" placeholder="description"maxlength="254" required>'.$current_thesis_desc.'</textarea><br>
                <input type="submit" name="enter" value="Enter">
            </form>
            ';
        
            
            if (mysqli_num_rows($file_rows) > 0){
                $file_row = mysqli_fetch_assoc($file_rows);
                
                if (isset($_POST['filedelete'.(string)$file_row["id"]])){
                    echo "tried to delete file";
                    delete_file_from_db($file_row, $conn);
                    // unlink($files_path.$file);
    
                    header("Location: edit_thesis.php");
                }

                // add_log(basename("from edit_thesis before button and check: ".$_FILES["fileToUpload"]["name"]), $conn);
                echo '
                Thesis File: 
                <form action="edit_thesis.php" method="post">
                <a href="'.$file_row["filepath"].$file_row["filename"].'" download>'. $file_row["filename"].'</a>
                <input type="submit" value="Delete This file" name="filedelete'.$file_row["id"].'"><br>
                </form>
                ';
                
            }
            
            if (isset($_POST["fileUpload"])){
                if (upload_file($conn, array("pdf"), $current_thesis_row["id"], true) && (mysqli_num_rows($file_rows) > 0)){
                    try {
                        delete_file_from_db($file_row, $conn);
                    }
                    catch(TypeError){
                        echo "";
                    }
                    
                    // if (!(basename($_FILES["fileToUpload"]["name"]) == $file_row["filename"])){

                    // }
                    
                }
                header("Location: edit_thesis.php");

            }
            echo '
            <form action="edit_thesis.php" method="post" enctype="multipart/form-data">
                <label>Change Thesis File:</label>
                <input type="file" name="fileToUpload" id="fileToUpload" required><br>
                <input type="submit" name="fileUpload" value="Enter">
            </form>';
        
            echo "</div>";

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