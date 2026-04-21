<!-- In this page the student can edit their profile -->

<?php

    session_start();
    include("header.html");
    include("student_header.html");
    include("database.php");
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body>
    
</body>
</html>


<?php

    $this_email;

    if (isset($_SESSION["email"])){
        $this_email = $_SESSION["email"];
    }
    else{
        header("Location: index.php");
    }

    //echo $this_email."<br>";

    $current_email = $this_email;

    if (isset($_POST["login"])){


        $new_email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
        $new_name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_surname = filter_input(INPUT_POST, "surname", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_street = filter_input(INPUT_POST, "street", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_snumber = filter_input(INPUT_POST, "snumber", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_city = filter_input(INPUT_POST, "city", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_postcode = filter_input(INPUT_POST, "postcode", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_father_name = filter_input(INPUT_POST, "fname", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_cell = filter_input(INPUT_POST, "cell", FILTER_SANITIZE_SPECIAL_CHARS);
        $new_phone = filter_input(INPUT_POST, "phone", FILTER_SANITIZE_SPECIAL_CHARS);


        if (empty($new_email)){
            echo "Please Enter Email";
        }

        else{
            // FOR TESTING PURPOSES ONLY DELETE LATER
            //echo "Email is: {$new_email}<br>";
            
            //$_SESSION["email"] = $email;



            update_student_profile($new_email, $new_name, $new_surname, $new_street, $new_snumber, $new_city, $new_postcode, $new_father_name, $new_cell, $new_phone, $current_email, $conn);
            $this_email = $new_email;
            //echo $this_email;
            $_SESSION["email"] = $this_email;
            sleep(0.2);
            header("student_edit_profile.php");
            


            /*
            register_user($name, $email, $password1, $type, $conn);
            register_student($email, $am, $street, $snumber, $city, $postcode, $father_name, $cell, $phone, $conn);
            */

            //jump_to_site($type);

        }    
    }




    $this_row = mysqli_fetch_assoc(get_rows_from_table_where("student", "email", $this_email, $conn));
    $this_user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $this_email, $conn));

    // store current values

    
    $current_name = $this_user_row["name"];
    $current_surname = $this_user_row["surname"];
    $current_street = $this_row["street"];
    $current_number = $this_row["number"];
    $current_city = $this_row["city"];
    $current_postcode = $this_row["postcode"];
    $current_father = $this_row["father_name"];
    $current_cellphone = $this_row["cellphone"];
    $current_landline = $this_row["phone"];
    //echo $current_number;

?>

<!-- New input to change info -->

<h1>Edit your Profile</h1><hr>
<body>
    <form action="student_edit_profile.php" method="post">
        <label>Name: </label><br>
        <input type="text" name="name" value=<?php echo $current_name ?> placeholder="John"required><br>
        <label>Surname: </label><br>
        <input type="text" name="surname" value=<?php echo $current_surname ?> placeholder="Doe"required><br>
        <label>Email: </label><br>
        <input type="email" name="email" value=<?php echo $this_email ?> placeholder="up110XXXX@upnet.gr"required><br>
        <label>Street: </label><br>
        <input type="text" name="street" value=<?php echo $current_street ?> placeholder="Based Street"required><br>
        <label>Street Number: </label><br>
        <input type="text" name="snumber" value=<?php echo $current_number ?> placeholder="69"required><br>
        <label>City: </label><br>
        <input type="text" name="city" value=<?php echo $current_city ?> placeholder="Patras"required><br>
        <label>postcode: </label><br>
        <input type="text" name="postcode" value=<?php echo $current_postcode ?> placeholder="26XXX"required><br>
        <label>Father Name: </label><br>
        <input type="text" name="fname" value=<?php echo $current_father ?> placeholder="Joe Doe"required><br>
        <label>Cellphone: </label><br>
        <input type="text" name="cell" value=<?php echo $current_cellphone ?> placeholder="694XXXXXXX"required><br>
        <label>Localphone: </label><br>
        <input type="text" name="phone" value=<?php echo $current_landline ?> placeholder="210XXXXXXX"required><br>
        <input type="submit" name="login" value="Update Info">
    </form>
</body>
</html>

<?php

    

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