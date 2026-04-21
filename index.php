<?php

    session_start();
    include("header.html");
    include("database.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    <hr><h2>Login Page</h2><hr>
    <form action="index.php" method="post">
        <label>Email: </label><br>
        <input type="email" name="email" placeholder="Email" size="40"><br>
        <label>Password: </label><br>
        <input type="password" name="password" size="40"><br>
        <input type="submit" name="login" value="Log in">
    </form>
</body>
</html>

<?php
    
    unset($_SESSION['email']);
    unset($_SESSION["JSONimport"]);
    $emails = array("1", "2", "3");

    if (isset($_POST["login"])){
        $email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
        $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_SPECIAL_CHARS);
        // $_POST["email"];
        // $password = $_POST["password"];

        if (empty($email)){
            echo "Please Enter Email";
        }
        elseif (empty($password)){
            echo "Please Enter Password";
        }
        else{

            // FOR TESTING ONLY DELETE LATER
            // echo "Email is: {$email} and your Password is: {$password}<br>";

            if (check_user_in_db($email, $conn)){
                
                $type = check_user_type($email, $conn);
                $_SESSION["email"] = $email;

                if (password_verify($password, mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $email, $conn))["pass"])){
                // if ($password == mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $email, $conn))["pass"]){
                    jump_to_site($type);

                }
                else{
                    echo "Incorrect Password.";
                }
                /*
                $user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $email, $conn));
                $hash = password_hash($password, PASSWORD_DEFAULT);
                echo $hash;
                if ($hash == $user_row["pass"]){
                    jump_to_site($type);

                }
                else{
                    echo "Wrong Password";
                }
                */

               // echo"$type";
                
                
            }
            else{
                echo "User '$email' is not in the Database<br>";
                echo "Would you like to ";
                echo "<a href='register_student.php' title='Register Student'>register as a student</a>?";
            }
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