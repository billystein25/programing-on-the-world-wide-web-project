<?php

    ob_start(); // buffer output or long pages with buttons like teacher_assign_student don't work

    $db_server = "localhost";
    $db_user = "root";
    $db_password = "";
    $db_name = "thesis_management"; // change this
    $conn;

    try{
        $conn = mysqli_connect($db_server, 
                               $db_user, 
                               $db_password, 
                               $db_name);

    }
    
    catch(mysqli_sql_exception){
        echo "Could not connect to the Database";
    }


    // returns true if the email is registered in the database
    function check_user_in_db($email, $conn){
        
        $sql = "SELECT * FROM user WHERE email = '$email'";
        // add_log($sql, $conn);
        $result = mysqli_query($conn, $sql);
        
        return mysqli_num_rows($result)>0;
    
    }

    // returns the type of user (Student, Teacher, Secretary)
    // user/email MUST be in database
    // use check_user_in_db first
    function check_user_type($email, $conn){
        
        $sql = "SELECT * FROM user WHERE email = '$email'";
        // add_log($sql, $conn);
        
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        //$test = $row["type"];
       // echo "{$test}";
        return $row["type"];
    }

    // register logic

    function register_user($name, $surname, $email, $password, $type, $conn){
        $hash = password_hash($password, PASSWORD_DEFAULT);

        // replace user if already exists
        if (mysqli_num_rows(get_rows_from_table_where("user", "email", $email, $conn)) > 0){
            // $sql = "DELETE from user WHERE email = '$email'";
            // add_log($sql, $conn);
            // mysqli_query($conn, $sql);
            return false;

        }
        $sql = "INSERT INTO user VALUES (DEFAULT, '$email', '$hash', '$name', '$surname', '$type', DEFAULT)";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
        return true;
    }
    
    function register_student($email, $am, $street, $number, $city, $postcode, $father_name, $cell, $phone, $conn){
        $sql = "INSERT INTO student VALUES('$email', '$am', '$street', '$number', '$city', '$postcode', '$father_name',  '$cell', '$phone')";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function register_teacher($email, $topic, $landline, $mobile, $department, $university, $conn){
        $sql = "INSERT INTO teacher VALUES('$email', '$topic', '$landline', '$mobile', '$department', '$university')";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function register_secretary($email, $conn){
        $sql = "INSERT INTO secretary VALUES('$email')";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    // login logic

    function jump_to_site($type){
        // fix with enums
        if ($type == "student"){
            header("Location: student.php");
        }
        elseif ($type == "teacher"){
            header("Location: teacher.php");
        }
        elseif ($type == "secretary"){
            header("Location: secretary.php");
        }
        else{
            // This should never occure
            echo "Unexpected User Type";
        }
    }

    // retrieve all rows from a table

    function get_rows_from_table($table, $conn){
        $sql = "SELECT * FROM $table";
        // add_log($sql, $conn);
        $result = mysqli_query($conn, $sql);
        return $result;
    }

    function get_rows_from_table_condition($table, $condition, $conn){
        $sql = "SELECT * FROM $table WHERE $condition";
        // add_log($sql, $conn);
        $result = mysqli_query($conn, $sql);
        return $result;
    }

    // get all rows from a table WHERE $wherewhat == $whereis
    // for example to get all thesis of teacher with key/email "teacher"
    // $wherewhat should be "email" and $whereis should be "teacher"

    function get_rows_from_table_where($table, $wherewhat, $whereis, $conn){
        $sql = "SELECT * FROM $table WHERE $wherewhat = '$whereis'";
        // add_log($sql, $conn);
        $result = mysqli_query($conn, $sql);
        return $result;
    }

    // update table named $table
    // set column $colname to value $colvalue
    // $wherewhat and $whereis work the same as in the above function

    function update_table_row($table, $colname, $colvalue, $wherewhat, $whereis, $conn){
        $sql = "UPDATE $table SET $colname = '$colvalue' WHERE $wherewhat = '$whereis'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function update_table_row_condition($table, $colname, $colvalue, $condition, $conn){
        $sql = "UPDATE $table SET $colname = '$colvalue' WHERE $condition";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function update_student_profile($new_email, $new_name, $new_surname, $new_street, $new_number, $new_city, $new_postcode, $new_father, $new_cell, $new_land, $old_email, $conn){
        $sql = "UPDATE user SET name = '$new_name', surname = '$new_surname' WHERE email = '$old_email'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
        $sql = "UPDATE student SET street = '$new_street', number = $new_number, city = '$new_city', postcode = '$new_postcode', father_name = '$new_father', cellphone = '$new_cell', phone = '$new_land' WHERE email = '$old_email'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);

        // update email last

        $sql = "UPDATE user SET email = '$new_email' WHERE email = '$old_email'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
        $sql = "UPDATE student SET email = '$new_email' WHERE email = '$old_email'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function delete_table_row($table, $wherewhat, $wherewho, $conn){
        $sql = "DELETE FROM $table WHERE $wherewhat = '$wherewho'";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    // thesis logic

    function create_thesis($teacher, $title, $description, $conn){
        $sql = "INSERT INTO thesis VALUES(DEFAULT, '$teacher', '$title', '$description')";
        add_log($sql, $conn);
        return mysqli_query($conn, $sql);
    }

    function add_to_student_thesis_relation($student_email, $thesis_id, $conn){
        $sql = "INSERT INTO student_thesis_relation VALUES(DEFAULT, '$student_email', '$thesis_id', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function acc_decl_request($id, $status, $conn){
        update_table_row_condition("request", "status", $status, "id = $id", $conn);
        update_table_row_condition("request", "reply_datetime", "CURRENT_TIMESTAMP()", "id = $id", $conn);
    }

    function request_examiner_for_thesis($request_id, $teacher_email, $conn){
        $sql = "INSERT INTO request VALUES(DEFAULT, $request_id, '$teacher_email', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function add_examiner_to_thesis($request_id, $teacher_email, $conn){
        
        // get the student thesis relation row and check for examiner availiability

        $sql = "SELECT * FROM student_thesis_relation WHERE id = $request_id";
        // add_log($sql, $conn);
        $thesis_relation_row = mysqli_fetch_assoc(mysqli_query($conn, $sql));

        if (!$thesis_relation_row["teach1_email"]){
            $sql = "UPDATE student_thesis_relation SET teach1_email = '".$teacher_email."' WHERE id = $request_id";
        }
        elseif (!$thesis_relation_row["teach2_email"]){
            $sql = "UPDATE student_thesis_relation SET teach2_email = '".$teacher_email."' WHERE id = $request_id";
        }
        else{
            return false;
        }
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
        return true;

    }

    function add_note($thesis_id, $note, $teacher_note_adder, $conn){
        $sql = "INSERT INTO thesis_notes VALUES (DEFAULT, $thesis_id, '$teacher_note_adder', '$note')";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);
    }

    function auto_cancel_requests($id, $conn) {

        $sql = "SELECT * FROM student_thesis_relation WHERE id = $id";
        // add_log($sql, $conn);
        $thesis_relation_row = mysqli_fetch_assoc(mysqli_query($conn, $sql));

        if ($thesis_relation_row["teach1_email"] && $thesis_relation_row["teach2_email"]){
            // update_table_row_condition("student_thesis_relation", "status", "active", "stu_email = '".$student_email."' AND thesis_id = '".$thesis_id."' AND status = 'pending_assignment'", $conn);
            $sql = "UPDATE student_thesis_relation SET status = 'active', activated_datetime = CURRENT_TIMESTAMP() WHERE id = $id";
            add_log($sql, $conn);
            mysqli_query($conn, $sql);
            
            // once the thesis is accepted auto decline all the other requests

            $sql = "UPDATE request SET status = 'slots_complete', reply_datetime = CURRENT_TIMESTAMP() WHERE relation_id = ".$id." AND status = 'pending'";
            add_log($sql, $conn);
            mysqli_query($conn, $sql);

        }
    }

    // $teacher_kind must be ENUM ['creator', 'exam1', 'exam2']

    function add_grade_to_thesis($relation_id, $grade, $teacher_kind, $conn){
        $sql = "UPDATE student_thesis_relation SET grade_".$teacher_kind." = $grade WHERE id = $relation_id";
        add_log($sql, $conn);
        mysqli_query($conn, $sql);

        // set thesis to finished if all grades have been assigned

        // $relation_row = mysqli_fetch_assoc(get_rows_from_table_where("student_thesis_relation", "id", $relation_id, $conn));

        // if (check_all_grades($relation_row, $conn)){
        //     update_table_row_condition("student_thesis_relation", "status", "finished", "id = ". $relation_row["id"], $conn);
        // }

    }

    function check_all_grades($relation_row, $conn){
        add_log("relation id: ". $relation_row["id"]." creator: ". $relation_row["grade_creator"]. " exam1: ". $relation_row["grade_exam1"]. " exam2: ". $relation_row["grade_exam2"], $conn);
        if ($relation_row["grade_creator"] && $relation_row["grade_exam1"] && $relation_row["grade_exam2"]){
            // add_log("got true", $conn);
            return true;
        }
        else{
            return false;
        }
    }

    function add_log($log, $conn){

        $log = str_replace('"', '\\"', $log);
        $log = str_replace("'", "\\'", $log);

        $sql = "INSERT INTO sql_logs VALUES (DEFAULT, '$log')";

        mysqli_query($conn, $sql);
    }

    function insert_file($user_id, $thesis_id, $filename, $filepath, $conn){
        $sql = "";
        if ($thesis_id){
            $sql = "INSERT INTO files VALUES (DEFAULT, $user_id, $thesis_id, '$filename', '$filepath')";

        }
        else{
            $sql = "INSERT INTO files VALUES (DEFAULT, $user_id, DEFAULT, '$filename', '$filepath')";
        }

        add_log($sql, $conn);

        mysqli_query($conn, $sql);
    }

    function delete_file_from_db($file_row, $conn){
        
        unlink($file_row["filepath"].$file_row["filename"]);
        $sql = "DELETE FROM files WHERE id = ". $file_row["id"];
        add_log($sql, $conn);

        mysqli_query($conn, $sql);
    }

    function get_latest_row_condition($table, $condition, $conn){
        $sql = "";
        if ($condition){
            $sql = "SELECT * FROM $table WHERE $condition ORDER BY id DESC LIMIT 1";
        }
        else{
            $sql = "SELECT * FROM $table ORDER BY DESC LIMIT 1";
        }
        // add_log($sql, $conn);
    
        $result = mysqli_query($conn, $sql);
        return $result;
    }


?>
