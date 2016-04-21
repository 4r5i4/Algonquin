<?php

require_once './abstractDAO.php';
require_once './userDAO.php';


session_start();
session_regenerate_id(false);
//echo session_id();

if(isset($_SESSION['abstractDAO'])){
    if(!$_SESSION['abstractDAO']->isAuthenticated()){
        header('Location:login.php');
    }
} else {
    header('Location:login.php');
}
?>

<!--header-->
<?php include_once './header.php'; ?>

<!--content-->
<div id="content" class="clearfix">
    <div id="wrap">


        <!--print a welcome message with the username appended at the end-->
        <h1>You have successfully logged in!</h1>
        <p>Admin level = <?php echo $_SESSION['abstractDAO']->getAdminLevel(); ?></p>
        <p>Admin ID = <?php echo $_SESSION['abstractDAO']->getAdminID(); ?></p>




        <?php echo '<p id="sessionID">Session ID: ' . session_id() . '</p>';?>


        <a href="logout.php" class="tableButton">logout</a>
<!--
        <?php
/*        try {
            $userDAO = new userDAO();
            $users = $userDAO->getUsers();
            if($users){
                echo "<table class='tableLists'>";
                echo '<thead><tr><th>Full Name</th><th>Email</th><th>Username</th><th>Phone</th></tr></thead><tbody>';
                foreach($users as $user) {
                    echo '<tr>';
                    echo "<td style='width: 100px;'>" . $user->getAdminID()       . '</td>';
                    echo "<td style='width: 200px;'>" . $user->getAdminLevel()    . '</td>';
                    echo "<td style='width: 120px;'>" . $user->getUsername()      . '</td>';
                    echo "<td style='width: 200px;'>" . $user->getLastLoginDate() . '</td>';
                    echo '</tr>';
                }
                echo '</tbody></table>';
            }
        } catch(Exception $e) {
            echo '<h3>Error on page.</h3>';
            echo '<p>' . $e->getMessage() . '</p>';
        }
        */?>

-->
    </div>
</div>

<!--footer-->
<?php include_once './footer.php'; ?>


