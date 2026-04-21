<?php

    session_start();
    include("header.html");
    include("database.php");
    include("global_functions.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register as Secretary</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    <hr><h2>Register Secretary Page</h2><hr>
    <form action="register_secretary.php" method="post">
        <label>Name: </label><br>
        <input type="text" name="name" placeholder="John" required size="40"><br>
        <label>Surame: </label><br>
        <input type="text" name="surname" placeholder="Doe" required size="40"><br>
        <label>Email: </label><br>
        <input type="email" name="email" placeholder="Secretary@upnet.gr" required size="40"><br>
<!--        
        <label>Password: </label><br>
        <input type="password" name="password1" required size="40"><br>
        <label>Confirm Password: </label><br>
        <input type="password" name="password2" required size="40"><br>
-->
        <input type="submit" name="login" value="Register">
    </form>
</body>
</html>

<?php


    //$emails = array("1", "2", "3");

    if (isset($_POST["login"])){

        $email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
        $name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_SPECIAL_CHARS);
        $surname = filter_input(INPUT_POST, "surname", FILTER_SANITIZE_SPECIAL_CHARS);
        $type = "secretary";
        // $password1 = filter_input(INPUT_POST, "password1", FILTER_SANITIZE_SPECIAL_CHARS);
        // $password2 = filter_input(INPUT_POST, "password2", FILTER_SANITIZE_SPECIAL_CHARS);

        /*
        $email = $_POST["email"];
        $name = $_POST["name"];
        $type = "secretary";
        $password1 = $_POST["password1"];
        $password2 = $_POST["password2"];
        */

        $password1 = generateRandomString();

        if (empty($email)){
            echo "Please Enter Email";
        }
        // elseif (empty($password1)){
        //     echo "Please enter your password";
        // }
        // elseif (empty($password2)){
        //     echo "Please enter your password again";
        // }
        // elseif ($password1 != $password2){
        //     echo "Passwords don't match";
        // }

        else{
            // FOR TESTING PURPOSES ONLY DELETE LATER
            
            //$_SESSION["email"] = $email;
            
            if (register_user($name, $surname, $email, $password1, $type, $conn)){
                register_secretary($email, $conn);
                echo "Email is: {$email} and your Password is: {$password1}<br>";

            }
            else{
                echo "User with email {$email} Already Exists";

            }

            // try{
                
            // }
            
            // catch(mysqli_sql_exception){
            // }

            /*
            register_user($name, $email, $password1, $type, $conn);
            register_secretary($email, $conn);
            */
            //jump_to_site($type);

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