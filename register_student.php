<?php

    session_start();
    include("global_functions.php");
    include("header.html");
    include("database.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register as Student</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    <hr><h2>Register Student Page</h2><hr>
    <form action="register_student.php" method="post">
        <label>Name: </label><br>
        <input type="text" name="name" placeholder="John"required size="40"><br>
        <label>Surname: </label><br>
        <input type="text" name="surname" placeholder="Doe"required size="40"><br>
        <label>Email: </label><br>
        <input type="email" name="email" placeholder="up110XXXX@upnet.gr"required size="40"><br>
<!--
        <label>Password: </label><br>
        <input type="password" name="password1"required size="40"><br>
        <label>Confirm Password: </label><br>
        <input type="password" name="password2"required size="40"><br>
-->        
        <label>AM: </label><br>
        <input type="text" name="am" placeholder="110XXXX"required size="40"><br>
        <label>Street: </label><br>
        <input type="text" name="street" placeholder="Based Street"required size="40"><br>
        <label>Street Number: </label><br>
        <input type="number" name="snumber" placeholder="69"required size="40"><br>
        <label>City: </label><br>
        <input type="text" name="city" placeholder="Patras"required size="40"><br>
        <label>postcode: </label><br>
        <input type="number" name="postcode" placeholder="26XXX"required size="40"><br>
        <label>Father Name: </label><br>
        <input type="text" name="fname" placeholder="Joe"required size="40"><br>
        <label>Cellphone: </label><br>
        <input type="number" name="cell" placeholder="694XXXXXXX"required size="40"><br>
        <label>Localphone: </label><br>
        <input type="number" name="phone" placeholder="210XXXXXXX"required size="40"><br>
        <input type="submit" name="register" value="Register">
    </form>
</body>
</html>

<?php


    // $emails = array("1", "2", "3");

    if (isset($_POST["register"])){


        $email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
        $name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_SPECIAL_CHARS);
        $surname = filter_input(INPUT_POST, "surname", FILTER_SANITIZE_SPECIAL_CHARS);
        $type = "student";
        // $password1 = filter_input(INPUT_POST, "password1", FILTER_SANITIZE_SPECIAL_CHARS);
        // $password2 = filter_input(INPUT_POST, "password2", FILTER_SANITIZE_SPECIAL_CHARS);
        $am = filter_input(INPUT_POST, "am", FILTER_SANITIZE_SPECIAL_CHARS);
        $street = filter_input(INPUT_POST, "street", FILTER_SANITIZE_SPECIAL_CHARS);
        $snumber = filter_input(INPUT_POST, "snumber", FILTER_SANITIZE_SPECIAL_CHARS);
        $city = filter_input(INPUT_POST, "city", FILTER_SANITIZE_SPECIAL_CHARS);
        $postcode = filter_input(INPUT_POST, "postcode", FILTER_SANITIZE_SPECIAL_CHARS);
        $father_name = filter_input(INPUT_POST, "fname", FILTER_SANITIZE_SPECIAL_CHARS);
        $cell = filter_input(INPUT_POST, "cell", FILTER_SANITIZE_SPECIAL_CHARS);
        $phone = filter_input(INPUT_POST, "phone", FILTER_SANITIZE_SPECIAL_CHARS);

        /*
        $email = $_POST["email"];
        $name = $_POST["name"];
        $type = "student";
        $password1 = $_POST["password1"];
        $password2 = $_POST["password2"];
        $am = $_POST["am"];
        $street = $_POST["street"];
        $snumber = $_POST["snumber"];
        $city = $_POST["city"];
        $postcode = $_POST["am"];
        $father_name = $_POST["fname"];
        $cell = $_POST["cell"];
        $phone = $_POST["phone"];
        */
        $password1 = generateRandomString();

        if (empty($email)){
            echo "Please Enter Email";
        }
        // if (){

        // }
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
                try{
                    register_student($email, $am, $street, $snumber, $city, $postcode, $father_name, $cell, $phone, $conn);
                    echo "Email is: {$email} and your Password is: {$password1}<br>";
                }
                catch(mysqli_sql_exception){
                    echo "User with AM {$am} already exists";
                    delete_table_row("user", "email", $email, $conn);
                }

            }
            else{
                echo "User with email {$email} already exists";

            }
            // try{
                
            // }
            
            // catch(mysqli_sql_exception){
            // }

            /*
            register_user($name, $email, $password1, $type, $conn);
            register_student($email, $am, $street, $snumber, $city, $postcode, $father_name, $cell, $phone, $conn);
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