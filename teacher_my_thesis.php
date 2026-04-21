<!-- Check my Thesis -->

<?php

    session_start();
    include("header.html");
    include("database.php");
    include("global_functions.php");
    include("teacher_header.html");
    if (isset($_SESSION["thesisid"])){
        unset($_SESSION["thesisid"]);
    }
    if (isset($_SESSION["studentemail"])){
        unset($_SESSION["studentemail"]);
    }
?>

<!-- check if user is a teacher -->

<?php

    $this_email;

    if(check_user_type($_SESSION['email'], $conn) == "teacher"){
        $this_email = $_SESSION['email'];

    }
    else{
        header("Location: index.php");
    }

    $email = $_SESSION["email"];

    echo "<h1>My Thesis</h1>";
    // echo $this_email;
    echo "<hr>";

    if (isset($_POST["failed_to_add_grade"])){
        unset($_POST["failed_to_add_grade"]);
        echo "Failed to add grade. No grade provided.<hr>";
    }

    // show statistics
    
    echo "<h2>Statistics:</h2><hr>";
    echo "<div>";

    // avrg thesis time

    // avrg thesis grade

    // my thesis
    $my_thesis_rows = get_rows_from_table_where("thesis", "teacher", $this_email, $conn);
    $num_thesis = mysqli_num_rows($my_thesis_rows);
    $total_score = 0;
    // $num_thesis = 0;
    $num_relations = 0;
    while ($my_thesis_row = mysqli_fetch_assoc($my_thesis_rows)){
        // $num_thesis++;
        $this_thesis_avrg = 0;
        $my_thesis_relation_rows = get_rows_from_table_condition("student_thesis_relation", "thesis_id = ". $my_thesis_row["id"]. " AND status = 'finished'", $conn);
        if (mysqli_num_rows($my_thesis_relation_rows) > 0){
            $my_thesis_relation_row = mysqli_fetch_assoc($my_thesis_relation_rows);
            $num_relations++;
            $this_thesis_avrg = $my_thesis_relation_row["grade_creator"] + $my_thesis_relation_row["grade_exam1"] + $my_thesis_relation_row["grade_exam2"];
            $this_thesis_avrg = $this_thesis_avrg/3;
            $total_score += $this_thesis_avrg;
        }
    }
    if ($num_relations > 0){
        $total_score = $total_score/$num_relations;
        $total_score = round($total_score, 2);
        echo "Average grade of my thesis (finished thesis only): ". $total_score;
    }
    else{
        echo "Average grade of my thesis (finished thesis only): N/A";
    }
    // total amount of thesis I am part of
    echo "<br><br>Total number of my thesis: ". $num_thesis;
    echo "<br>Finished thesis out of my thesis: ". $num_relations. "/". $num_thesis;
    echo "<br><br>";

    // related to me thesis
    // exam 1
    $my_thesis_rows = get_rows_from_table_where("student_thesis_relation", "teach1_email", $this_email, $conn);
    $num_thesis = mysqli_num_rows($my_thesis_rows);
    $total_score = 0;
    $num_relations = 0;
    $my_finished_thesis_rows = get_rows_from_table_condition("student_thesis_relation", "teach1_email = '". $this_email."' AND status = 'finished'", $conn);
    $num_relations = mysqli_num_rows($my_finished_thesis_rows);
    if (mysqli_num_rows($my_finished_thesis_rows) > 0){
        while ($my_finished_thesis_row = mysqli_fetch_assoc($my_finished_thesis_rows)){
            $this_thesis_avrg = 0;
            $this_thesis_avrg = $my_finished_thesis_row["grade_creator"] + $my_finished_thesis_row["grade_exam1"] + $my_finished_thesis_row["grade_exam2"];
            $this_thesis_avrg = $this_thesis_avrg/3;
            $total_score += $this_thesis_avrg;
        }
    }
    // exam 2
    $my_thesis_rows = get_rows_from_table_where("student_thesis_relation", "teach2_email", $this_email, $conn);
    $num_thesis = $num_thesis + mysqli_num_rows($my_thesis_rows);
    $my_finished_thesis_rows = get_rows_from_table_condition("student_thesis_relation", "teach2_email = '". $this_email."' AND status = 'finished'", $conn);
    $num_relations += mysqli_num_rows($my_finished_thesis_rows);
    if (mysqli_num_rows($my_finished_thesis_rows) > 0){
        while ($my_finished_thesis_row = mysqli_fetch_assoc($my_finished_thesis_rows)){
            $this_thesis_avrg = 0;
            $this_thesis_avrg = $my_finished_thesis_row["grade_creator"] + $my_finished_thesis_row["grade_exam1"] + $my_finished_thesis_row["grade_exam2"];
            $this_thesis_avrg = $this_thesis_avrg/3;
            $total_score += $this_thesis_avrg;
        }
    }
    if ($num_relations > 0){
        $total_score = $total_score/$num_relations;
        $total_score = round($total_score, 2);
        echo "Average grade of my associated thesis (finished thesis only): ". $total_score;
    }
    else{
        echo "Average grade of my associated thesis (finished thesis only): N/A";
    }
    // total amount of thesis I am part of
    echo "<br><br>Total number of my associated thesis: ". $num_thesis;
    echo "<br>Finished thesis out of my associated thesis: ". $num_relations. "/". $num_thesis;

    echo "</div>";

    // export thesis button

    echo '<hr>
    <form action="teacher_my_thesis.php" method="post">
    <input type="submit" name="exportthesis" value="Export Thesis to Json">
    </form>
    ';

    $thesis_status = "all";
    $teacher_role = "all";
    
    if (isset($_POST["submit"])){        

        if ($_POST["thesis_status"] == "All"){
            $thesis_status = "all";
        }
        elseif ($_POST["thesis_status"] == "Pending Assignment"){
            $thesis_status = "pending_assignment";
        }
        elseif ($_POST["thesis_status"] == "Active"){
            $thesis_status = "active";
        }
        elseif ($_POST["thesis_status"] == "Under Examination"){
            $thesis_status = "being_examined";
        }
        elseif ($_POST["thesis_status"] == "Finished"){
            $thesis_status = "finished";
        }
        elseif ($_POST["thesis_status"] == "Canceled"){
            $thesis_status = "canceled";
        } 
        
        if ($_POST["teacher_role"] == "All"){
            $teacher_role = "all";
        }
        elseif ($_POST["teacher_role"] == "Creator"){
            $teacher_role = "creator";
        }
        elseif ($_POST["teacher_role"] == "Examiner"){
            $teacher_role = "examiner";
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Thesis to Student</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>
<body><hr>
    <form method="post">
        <label>Search By</label>
        <label>Thesis Status</label>
        <select name="thesis_status" id="thesis_status" size="1">
            <option <?php if ($thesis_status == "all") echo "selected"?> >All</option>
            <option <?php if ($thesis_status == "pending_assignment") echo "selected"?> >Pending Assignment</option>
            <option <?php if ($thesis_status == "active") echo "selected"?> >Active</option>
            <option <?php if ($thesis_status == "being_examined") echo "selected"?> >Under Examination</option>
            <option <?php if ($thesis_status == "finished") echo "selected"?> >Finished</option>
            <option <?php if ($thesis_status == "canceled") echo "selected"?> >Canceled</option>
        </select>
        <label>My Role in Thesis</label>
        <select name="teacher_role" id="teacher_role" size="1">
            <option <?php if ($teacher_role == "all") echo "selected"?> >All</option>
            <option <?php if ($teacher_role == "creator") echo "selected"?> >Creator</option>
            <option <?php if ($teacher_role == "examiner") echo "selected"?> >Examiner</option>
        </select>
        <input type="submit" name="submit" value="Search">
    </form>
</body>
</html>


<?php

    // show all my thesis
    // show thesis I am associated with as examiner 1 or 2

    // show all my thesis if teacher_role is all or creator

    
    $merged_rows = [];
    
    if ($teacher_role != "examiner")
    {
        echo "<hr><h2>My Thesis:</h2><hr>";

        $my_thesis_rows = get_rows_from_table_where("thesis", "teacher", $this_email, $conn);

        if (mysqli_num_rows($my_thesis_rows) > 0){

            while ($my_thesis_row = mysqli_fetch_assoc($my_thesis_rows)){

                // if this thesis is assigned to a student show the full info, otherwise show only the thesis info by itself
                
                $my_thesis_relation_rows = get_rows_from_table_where("student_thesis_relation", "thesis_id", $my_thesis_row["id"], $conn);

                if (mysqli_num_rows($my_thesis_relation_rows) > 0){
                    
                    while ($my_thesis_relation_row = mysqli_fetch_assoc($my_thesis_relation_rows)){

                        // $merged_rows[] = $my_thesis_relation_row;
                        array_push($merged_rows, $my_thesis_relation_row);

                        // handle button input

                        if (button_handler($this_email, $my_thesis_relation_row, "creator", $conn)){
                            break;
                        }

                        if (can_show_thesis($thesis_status, $my_thesis_relation_row["status"])){
                            echo "<div>";
                            show_relation($my_thesis_relation_row, true, $conn, true, false);
                            show_buttons($my_thesis_relation_row, "creator", $conn);

                            $thesis_note_rows = get_rows_from_table_where("thesis_notes", "thesis_id", $my_thesis_relation_row["thesis_id"], $conn);
                            echo "Thesis notes:<br>";
                            while ($thesis_note_row = mysqli_fetch_assoc($thesis_note_rows)){
                                echo "<p class=\"thesisNote\">";
                                echo "Note creator: ". $thesis_note_row["teacher"];
                                echo "<br>Note: <br>". $thesis_note_row["note_text"];
                                echo "</p>";
                                // echo "<br>";
                            }
                            echo "</div>";
                            echo "<hr>";
                        }
                    }
                }
                else{

                    array_push($merged_rows, $my_thesis_row);

                    if ($thesis_status == "all"){
                        echo "<div>";
                        show_thesis($my_thesis_row, $conn, false);
                        echo "<br>This thesis has not yet been assigned to a student.<br>";
                        echo "</div>";
                        echo "<hr>";
                        // echo "Thesis Title:<br>".$my_thesis_row["title"]."<br>";
                        // echo "Thesis Description:<br>". $my_thesis_row["description"]."<br><br>";
                        // echo "This Thesis has not been assigned to a student.<br>";
                    }
                }
                

            }
        }
        else{
            echo "You have not created any Thesis<hr>";
        }
    
    }

    // show thesis where I am examiner only if teacher_role is all or examiner

    if ($teacher_role != "creator")
    {

        // show thesis where I am examiner 1

        $is_examiner_thesis_rows = get_rows_from_table_where("student_thesis_relation", "teach1_email", $this_email, $conn);

        echo "<h2>Thesis I am a part of:</h2><hr>";

        while ($is_examiner_thesis_row = mysqli_fetch_assoc($is_examiner_thesis_rows)){

            // $merged_rows[] = $is_examiner_thesis_row;
            array_push($merged_rows, $is_examiner_thesis_row);
            
            // handle button input
            
            if (button_handler($this_email, $is_examiner_thesis_row, "exam1", $conn)){
                break;
                
            }
            
            if (can_show_thesis($thesis_status, $is_examiner_thesis_row["status"])){
                echo "<div>";
                show_relation($is_examiner_thesis_row, true, $conn);
                show_buttons($is_examiner_thesis_row, "exam1", $conn);
                echo "</div>";

            }


        }

        // show thesis where I am examiner 2

        $is_examiner_thesis_rows = get_rows_from_table_where("student_thesis_relation", "teach2_email", $this_email, $conn);

        while ($is_examiner_thesis_row = mysqli_fetch_assoc($is_examiner_thesis_rows)){

            // $merged_rows[] = $is_examiner_thesis_row;
            array_push($merged_rows, $is_examiner_thesis_row);

            // handle button input

            if (button_handler($this_email, $is_examiner_thesis_row, "exam2", $conn)){
                break;

            }

            if (can_show_thesis($thesis_status, $is_examiner_thesis_row["status"])){
                echo "<div>";
                show_relation($is_examiner_thesis_row, true, $conn);
                show_buttons($is_examiner_thesis_row, "exam2", $conn);
                echo "</div>";
            }

        }

    }

    if (isset($_POST["exportthesis"])){
        // echo json_encode($merged_rows);
        // if (file_exists("thesisexport.json")) {
        //     unlink("thesisexport.json");
        // }
        file_put_contents('thesisexport.json', json_encode($merged_rows));
        header("Location: thesisexport.json");
    }

    // if(file_put_contents( $file_name, 
    //     file_get_contents($url))) { 
    //     echo "File downloaded successfully"; 
    // } 
    // else { 
    //     echo "File downloading failed."; 
    // }

    function button_handler($this_email, $relation_row, $teacher_type, $conn){

        // cancel thesis logic

        if (isset($_POST['cancelbutton'.(string)$relation_row["id"]])){
            unset($_SESSION["studentemail"]);
            update_table_row_condition("student_thesis_relation", "status", "canceled", "id = ".$relation_row['id'], $conn);
            header("Location: teacher_my_thesis.php");

        }

        // activate thesis logic (set thesis as being examined)

        elseif (isset($_POST['activatebutton'.(string)$relation_row["id"]])){
            //unset($_SESSION["studentemail"]);
            update_table_row_condition("student_thesis_relation", "status", "being_examined", "id = ".$relation_row['id'], $conn);
            header("Location: teacher_my_thesis.php");

        }

        // add note logic

        elseif (isset($_POST['addnote'.(string)$relation_row["id"]])){
            // TODO make add note page
            if (isset($_POST['note'.(string)$relation_row["id"]])){
                $note = filter_input(INPUT_POST, "note".(string)$relation_row["id"], FILTER_SANITIZE_SPECIAL_CHARS);
                add_note($relation_row["thesis_id"], $note, $this_email, $conn);
            }
            unset($_POST['addnote'.(string)$relation_row["id"]]);
            unset($_POST['note'.(string)$relation_row["id"]]);
            header("Location: teacher_my_thesis.php");

        }

        // add grade logic

        elseif (isset($_POST['addgrade'.(string)$relation_row["id"]])){
            // $grade = filter_input(INPUT_POST, "grade".(string)$relation_row["id"], FILTER_SANITIZE_SPECIAL_CHARS);
            // add_log("addgrade ".(string)$relation_row["id"]." called with grade: ".$grade, $conn);

            if (isset($_POST['grade'.(string)$relation_row["id"]])){
                $grade = filter_input(INPUT_POST, "grade".(string)$relation_row["id"], FILTER_SANITIZE_SPECIAL_CHARS);
                add_grade_to_thesis($relation_row["id"], $grade, $teacher_type, $conn);

                // refresh relation_row with new info
                $relation_row = mysqli_fetch_assoc(get_rows_from_table_where("student_thesis_relation", "id", (string)$relation_row["id"], $conn));
                // if (check_all_grades($relation_row, $conn)){
                //     update_table_row_condition("student_thesis_relation", "status", "finished", "id = ". $relation_row["id"], $conn);
                // }
            }
            else{
                $_POST["failed_to_add_grade"] = true;
            }
            header("Location: teacher_my_thesis.php");

        }

    }

    function show_buttons($thesis_relation_row, $teacher_type, $conn){

        $thesis_row = mysqli_fetch_assoc(get_rows_from_table_where("thesis", "id", $thesis_relation_row["thesis_id"], $conn));

        // always can add note
        // echo 
        // '<form action="teacher_my_thesis.php" method="post">
        // <input type="submit" name="addnote'.$thesis_relation_row["id"].'" value="Add a note to this Thesis"<br><br>
        // </form>';

        if ($thesis_relation_row["status"] != "canceled" && $thesis_relation_row["status"] != "finished"){
            echo 
            '
            <form action="teacher_my_thesis.php" method="post">
                <label>Add a note to this thesis:</label><br>
                <textarea type="text" name="note'.$thesis_relation_row["id"].'" cols="40" rows="5"placeholder="note"maxlength="300" required></textarea><br>
                <input type="submit" name="addnote'.$thesis_relation_row["id"].'" value="Add note to this Thesis">
            </form>
            ';

        }
        
        // show buttons

        // if the teacher is the creator then he can cancel the thesis at any time
        // otherwise he can cancel it only when it isn't pending_assignment
        
        // if not canceled can interact with thesis (like set it to under examination or cancel it)
        if ($thesis_relation_row["status"] != "canceled"){
            // if active anyone can set as under examination
            if ($thesis_relation_row["status"] == "active"){
                echo 
                '<form action="teacher_my_thesis.php" method="post">
                <input type="submit" name="activatebutton'.$thesis_relation_row["id"].'" value="Set this Thesis as Under Examination"<br><br>
                </form>';
            }
            // if teacher == creator can cancel any time
            if ($thesis_row["teacher"] == $_SESSION["email"] || $thesis_relation_row["status"] == "active"){
                echo 
                '<form action="teacher_my_thesis.php" method="post">
                <input type="submit" name="cancelbutton'.$thesis_relation_row["id"].'" value="Cancel This Thesis"<br><br>
                </form>';
            }
            // if teacher != creator can cancel only if active
            // elseif ($thesis_relation_row["status"] == "active"){
            //     echo 
            //     '<form action="teacher_my_thesis.php" method="post">
            //     <input type="submit" name="cancelbutton'.$thesis_relation_row["id"].'" value="Cancel This Thesis"<br><br>
            //     </form>';
            // }
            if ($thesis_relation_row["status"] == "being_examined"){

                if (!teacher_has_submitted_grade($thesis_relation_row, $teacher_type)){
                    echo 
                    '<form action="teacher_my_thesis.php" method="post">
                    <input type="number" name="grade'.$thesis_relation_row["id"].'" placeholder="20" required><br>
                    <input type="submit" name="addgrade'.$thesis_relation_row["id"].'" value="Add Grade to This Thesis"<br><br>
                    </form>';

                }
                else{
                    echo "You have already graded this thesis.<br><br>";
                }
            }
            elseif ($thesis_relation_row["status"] == "finished"){
                echo "The grading period of this thesis is over.<br><br>";
            }
        }

    }

    function teacher_has_submitted_grade($relation_row , $teacher_type){
        if ($relation_row["grade_$teacher_type"] == NULL){
            return false;
        }
        return true;
    }

    // function show_teacher($teacher_email, $conn){

    //     $teacher_row = mysqli_fetch_assoc(get_rows_from_table_where("teacher", "email", $teacher_email, $conn));
    //     $teacher_user_row = mysqli_fetch_assoc(get_rows_from_table_where("user", "email", $teacher_email, $conn));

    //     echo "Teacher Name: " .$teacher_user_row["name"]. "<br>";
    //     echo "Teacher Topic: " .$teacher_row["topic"]. "<br>";
    //     echo "Teacher Landline: " .$teacher_row["landline"]. "<br>";
    //     echo "Teacher Mobile: " .$teacher_row["mobile"]. "<br>";
    //     echo "Teacher Department: " .$teacher_row["department"]. "<br>";
    //     echo "Teacher University: " .$teacher_row["university"]. "<br><br>";
    // }

    // thesis_status_filter is the filter status. thesis_status_real is the status of the thesis in question
    function can_show_thesis($thesis_status_filter, $thesis_status_real){
        if ($thesis_status_filter == "all"){
            return true;
        }
        elseif ($thesis_status_filter == $thesis_status_real){
            return true;
        }
        else{
            return false;
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