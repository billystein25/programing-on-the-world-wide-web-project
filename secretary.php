<?php
    
    session_start();
    include("header.html");
    include("database.php");
    include("global_functions.php");
    include("secretary_header.html");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secretary</title>
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
    echo "<h1>Secretary Home Page</h1>";
    echo "<hr>";

?>

<?php

    // echo "<hr>";

    $thesis_relation_rows = get_rows_from_table_condition("student_thesis_relation", "status = 'being_examined' OR status = 'active'", $conn);

    echo "<h2>Active or Under Examination Thesis:</h2><hr>";

    if (mysqli_num_rows($thesis_relation_rows) > 0){
        while ($thesis_relation_row = mysqli_fetch_assoc($thesis_relation_rows)){
            
            if (isset($_POST['cancelbutton'.(string)$thesis_relation_row["id"]])){
                unset($_SESSION["studentemail"]);
                update_table_row_condition("student_thesis_relation", "status", "canceled", "id = ".$thesis_relation_row['id'], $conn);
                header("Location: secretary.php");

            }
            
            if (isset($_POST['finishbutton'.(string)$thesis_relation_row["id"]])){
                unset($_SESSION["studentemail"]);
                // update_table_row_condition("student_thesis_relation", "status", "canceled", "id = ".$thesis_relation_row['id'], $conn);
                update_table_row_condition("student_thesis_relation", "status", "finished", "id = ". $thesis_relation_row["id"], $conn);
                header("Location: secretary.php");

            }

            echo "<div>";
            show_relation($thesis_relation_row, true, $conn);

            // if (check_all_grades($thesis_relation_row, $conn) && $thesis_relation_row["nemetreslink"]){
            //     update_table_row_condition("student_thesis_relation", "status", "finished", "id = ". $relation_row["id"], $conn);
            // }

            // cancel thesis button

            echo 
            '<form action="secretary.php" method="post">
            <input type="submit" name="cancelbutton'.$thesis_relation_row["id"].'" value="Cancel this Thesis"<br><br>
            </form>';
            
            // finish thesis button

            if (check_all_grades($thesis_relation_row, $conn) && $thesis_relation_row["nemetreslink"]){
                echo 
                '<form action="secretary.php" method="post">
                <input type="submit" name="finishbutton'.$thesis_relation_row["id"].'" value="Set this Thesis to Finished"<br><br>
                </form>';
            }
            echo "</div>";
            echo "<hr>";
        }
    }
    else{
        echo '
        <p style="color:#AA0000;">
        There are no thesis that are active or under examination.
        </p>
        ';
    }

    // function check_all_grades($relation_row, $conn){
    //     add_log("creator: ". $relation_row["grade_creator"]. " exam1: ". $relation_row["grade_exam1"]. " exam2: ". $relation_row["grade_exam2"], $conn);
    //     if ($relation_row["grade_creator"] && $relation_row["grade_exam1"] && $relation_row["grade_exam2"]){
    //         // add_log("got true", $conn);
    //         return true;
    //     }
    //     else{
    //         return false;
    //     }
    // }


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