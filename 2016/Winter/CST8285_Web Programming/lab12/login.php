
<?php
require_once('./abstractDAO.php');
require ('./userDAO.php');
session_start();
if(isset($_SESSION['abstractDAO'])){
    if($_SESSION['abstractDAO']->isAuthenticated()){
        session_write_close();
        header('Location:internal.php');
    }
}
$missingFields = false;
if(isset($_POST['submit'])){
    if(isset($_POST['username']) && isset($_POST['password'])){
        if($_POST['username'] == "" || $_POST['password'] == ""){
            $missingFields = true;
        } else {
            //All fields set, fields have a value
            $abstractDAO = new AbstractDAO();
            if(!$abstractDAO->hasDbError()){
                $username = $_POST['username'];
                $password = $_POST['password'];
                $abstractDAO->authenticate($username, $password);



                if($abstractDAO->isAuthenticated()){
                    $_SESSION['abstractDAO'] = $abstractDAO;
                    $_SESSION['abstractDAO']->setAdminID(1);
                    $_SESSION['abstractDAO']->setAdminLevel('Administrator');

                    
                    /*Here I will add the username and password and other info to the adminuser DB and later retrieve it in internal*/
                    $userDAO = new userDAO();
/*                  $username = $_POST['username'];
                    $password = $_POST['password'];
                    $adminLevel = 'Administrator';*/

                    $userDAO->insertUser(
                        null,
                        $_POST['username'],
                        $_POST['password'],
                        'Administrator',
                        null );

                    header('Location:internal.php');
                }
            }
        }
    }
}
?>



<?php include './header.php'; ?>
<!-- MESSAGES -->
<div id="content" class="clearfix">

    <div id="wrap">
        <!--<p>&nbsp;</p>-->
        <h1>LOGIN PAGE</h1>
        <h4>Please enter your administrative username and password to log into the internal page</h4>

        <?php
        //Missing username/password
        if($missingFields){
            echo '<h3 style="color:#dc4504;">Please enter both a username and a password</h3>';
        }

        //Authentication failed
        if(isset($abstractDAO)){
            if(!$abstractDAO->isAuthenticated()){
                echo '<h3 style="color:#dc4504;">Login failed. Please try again.</h3>';
            }
        }
        ?>


        <!--
        login form:
        asks for username and password
        -->
        <form name="login" id="login" method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
            <table>
                <!--username field-->
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" id="username" placeholder="Username" ></td>
                </tr>

                <!--password field-->
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" id="password" placeholder="Password" ></td>
                </tr>

                <!--submit and reset buttons-->
                <tr>
                    <td><input class="tableButton" type="submit" name="submit" id="submit" value="Login" ></td>
                    <td><input class="tableButton" type="reset" name="reset" id="reset" value="Reset"></td>
                </tr>

            <!--end of table-->
            </table>

            <!--show session id-->
            <?php echo '<p id="sessionID">Session ID: ' . session_id() . '</p>';?>
            

        </form>
    </div> <!--end of div id=wrap-->
</div><!-- End Content -->

<!--include footer-->
<?php include './footer.php'; ?>
