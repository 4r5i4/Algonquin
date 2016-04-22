<?php 
	require_once('./header.php'); 
	require_once('./customerDAO.php'); // Database connection and function defenition

	$is_submitted = false;
	
	// check whether the form needs validation or not
	if (isset($_POST["customerfName"]) &&
		isset($_POST["customerfName"]) &&
		isset($_POST["customerlName"]) &&
		isset($_POST["phoneNumber"]) &&
		isset($_POST["emailAddress"]) &&
		isset($_POST["username"]) &&
		isset($_POST["referral"]))
		{
		
		$is_submitted = true;
		
		// Initialize error array by each field	
		$error = array( 'fname'=>false, 'lname'=>false, 'phone'=>false, 'email'=>false, 'uname'=>false, 'refer'=>false ); 
		$emsg = array( 'fname'=>'', 'lname'=>'', 'phone'=>'', 'email'=>'', 'uname'=>'', 'refer'=>'' );
		
		$fname = trim($_POST["customerfName"]);
		$lname = trim($_POST["customerlName"]);
		$phone = trim($_POST["phoneNumber"]);
		$email = trim($_POST["emailAddress"]);

		//added 18-04-2016: emails need to be hashed before insertion into the database:
		$cryptedEmail = password_hash($email, PASSWORD_DEFAULT);

		$uname = trim($_POST["username"]);
		$refer = trim($_POST["referral"]);
	
		// Check for a proper First name
  		if (!empty($fname)) {
			$pattern = "/^[a-zA-Z0-9\_]{2,20}/"; // This is a regular expression that checks if the name is valid characters
			if (!preg_match($pattern, $fname)) { 
				$emsg['fname'] = 'Your first name can only contain _, 1-9, A-Z or a-z and should be 2-20 long.';
				$error['fname'] = true;
			}
		} else {
			$emsg['fname'] = 'You forgot to enter your FIRST name.';
			$error['fname'] = true;
		}

		// Check for a proper Last name
  		if (!empty($lname)) {
			$pattern = "/^[a-zA-Z0-9\_]{2,20}/"; // This is a regular expression that checks if the name is valid characters
			if (!preg_match($pattern, $fname)) { 
				$emsg['lname'] = 'Your last name can only contain _, 1-9, A-Z or a-z and should be 2-20 long.';
				$error['lname'] = true;
			}
		} else {
			$emsg['lname'] = 'You forgot to enter your LAST name.';
			$error['lname'] = true;
		}

		// Check for a valid phone number
  		if (!empty($phone)) {
			// regular expression to check north american telephone number format
			$pattern = "/^(\d[\s-]?)?[\(\[\s-]{0,2}?\d{3}[\)\]\s-]{0,2}?\d{3}[\s-]?\d{4}$/i";
			if (!preg_match($pattern, $phone)) { 
				$emsg['phone'] = 'Your phone number should be 10 digits';
				$error['phone'] = true;
			}
		} else {
			$emsg['phone'] = 'You forgot to enter your PHONE number.';
			$error['phone'] = true;
		}
  
		// Check for a valid email address
  		if (!empty($email)) {
			if (!filter_var($email, FILTER_VALIDATE_EMAIL)) { 
				$emsg['email'] = 'Your email address is wrong. It should be in the format of john.doe@example.com';
				$error['email'] = true;
			}
		} else {
			$emsg['email'] = 'You forgot to enter your EMAIL address.';
			$error['email'] = true;
		}
		
		// Check for a valid user name
  		if (!empty($uname)) {
			// regular expression that checks if user name is valid characters
			$pattern = "/^[A-Za-z]{1}[A-Za-z0-9]{4,31}$/"; 
			if (!preg_match($pattern, $uname)) { 
				$emsg['uname'] = 'User name should be 5 to 31 long, and first character should be alphabet.';
				$error['uname'] = true;
			}
		} else {
			$emsg['uname'] = 'You forgot to enter your USER name.';
			$error['uname'] = true;
		}
  
  		// Check for a referral
  		if ($refer != 'newspaper' && $refer != 'radio' && $refer != 'tv' && $refer != 'other') {
			$emsg['refer'] = 'You should select one of referrals.';
			$error['refer'] = true;
		}

		// check if there are some errors
		$errcount = 0;
		foreach ($error as $er) {
			if ($er == true) {
				$errcount++;
				break;
			}
		}

		//if there are no errors, proceed to make a new CustomerDAO object and make insertions and queries
		if ($errcount == 0) {

			// The abstractDAO and customerDAO will throw exceptions if there is a problem with the database connection.
 			try {
				$customerDAO = new CustomerDAO();

				// User can not have same Username.
				if (!$customerDAO->getCustomerByUsername($uname)) {

					// Customer ID is defined by MySql because it is auto increasement mode.
					//updated 18-04-2016: emails are hashed first ($cryptedEmail), and then inserted into the database:


					if ($customerDAO->insertCustomer($fname, $lname, $phone, $cryptedEmail, $uname, $refer)) {
						echo "<p class='addedCustomer'>You successfully added $fname $lname to the database</p>";
					} else {
						echo "<p class='error-text'> An error occured in adding $fname $lname to the database</p>";
					}


				} else {
					$emsg['uname'] = 'User name has already registered. Please use another user name.';
					$error['uname'] = true;
				}

				
				$target_file = $_FILES['myfile']['name'];
				$target_path = "file/";
				$target_path = $target_path . basename($_FILES['myfile']['name']);

				//bool move_uploaded_file ( string $filename , string $destination )
				if(move_uploaded_file($_FILES['myfile']['tmp_name'], $target_path)) {
					$fileUploaded = "The file ".  basename( $_FILES['myfile']['name']). " has been uploaded in \"$target_path\"";
					echo "<p class='addedCustomer'>$fileUploaded</p>";
				} else{
					echo "<p class='failedCustomer'>There was an error uploading the $target_file file, please try again!</p>";
				}



				
			} catch (Exception $err){
				$msg = "Error on page: " . $err->getMessage();
				echo "<script type='text/javascript'>alert('$msg')</script>";
			}
        }
	}
?>
            <div id="content" class="clearfix">
                <aside>
                        <h2>Mailing Address</h2>
                        <h3>1385 Woodroffe Ave<br>
                            Ottawa, ON K4C1A4</h3>
                        <h2>Phone Number</h2>
                        <h3>(613)727-4723</h3>
                        <h2>Fax Number</h2>
                        <h3>(613)555-1212</h3>
                        <h2>Email Address</h2>
                        <h3>info@wpeatery.com</h3>
                </aside>
                <div class="main">
                    <h1>Sign up for our newsletter</h1>
                    <p>Please fill out the following form to be kept up to date with news, specials, and promotions from the WP eatery!</p>

					<!-- 18-04-2016 updated: enctype="multipart/form-data" was added-->
					<form name="frmNewsletter" id="frmNewsletter" method="post" action="contact.php" enctype="multipart/form-data">

                        <table>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['fname']) echo "<span class='error-text'>" . $emsg['fname'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td style="width: 120px;">First Name:</td>
                                <td><input type="text"
									<?php
									if ($is_submitted) {
										if ($error['fname']) {
											echo "class='error-input'";
										}else{
											echo "class='norm-input'";
										}
										echo "value='$fname'"; }
									else echo "class='norm-input'"; ?> name="customerfName" id="customerfName" size='35'></td>
                            </tr>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['lname']) echo "<span class='error-text'>" . $emsg['lname'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td>Last Name:</td>
                                <td><input type="text"
									<?php if ($is_submitted) { if ($error['lname']) echo "class='error-input'";
									else echo "class='norm-input'"; echo "value='$lname'"; }
									else echo "class='norm-input'"; ?> name="customerlName" id="customerlName" size='35'></td>
                            </tr>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['phone']) echo "<span class='error-text'>" . $emsg['phone'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td>Phone Number:</td>
                                <td><input type="text"
									<?php if ($is_submitted) { if ($error['phone']) echo "class='error-input'";
									else echo "class='norm-input'"; echo "value='$phone'"; }
									else echo "class='norm-input'"; ?> name="phoneNumber" id="phoneNumber" size='35'></td>
                            </tr>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['email']) echo "<span class='error-text'>" . $emsg['email'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td>Email Address:</td>
                                <td><input type="text"
									<?php if ($is_submitted) { if ($error['email']) echo "class='error-input'";
									else echo "class='norm-input'"; echo "value='$email'"; }
									else echo "class='norm-input'"; ?> name="emailAddress" id="emailAddress" size='35'></td>
                            </tr>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['uname']) echo "<span class='error-text'>" . $emsg['uname'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td>Username:</td>
                                <td><input type="text"
									<?php if ($is_submitted) { if ($error['uname']) echo "class='error-input'";
									else echo "class='norm-input'"; echo "value='$uname'"; }
									else echo "class='norm-input'"; ?> name="username" id="username" size='20'>
                            </tr>
							<tr>
								<td></td>
								<td><?php if ($is_submitted && $error['refer']) echo "<span class='error-text'>" . $emsg['refer'] .
										"</span>"; ?></td>
							</tr>
							<tr>
                                <td>How did you<br>hear about us?</td>
                                <td>
                                   <select name="referral"
									<?php if ($is_submitted) { if ($error['refer']) echo "class='error-input'";
									else echo "class='norm-input'"; echo "value='$refer'"; }
									else echo "class='norm-input'"; ?> size="1">
                                      <option>Select referer</option>
                                      <option value="newspaper"
									  	<?php if ($is_submitted && $refer=='newspaper') echo 'selected'; ?>>Newspaper</option>
                                      <option value="radio"
									  	<?php if ($is_submitted && $refer=='radio') echo 'selected'; ?>>Radio</option>
                                      <option value="tv"
									  	<?php if ($is_submitted && $refer=='tv') echo 'selected'; ?>>Television</option>
                                      <option value="other"
									  	<?php if ($is_submitted && $refer=='other') echo 'selected'; ?>>Other</option>
                                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan='3'>
									<input class="tableButton" type='submit' name='btnSubmit' id='btnSubmit' value='Sign up!'>
									&nbsp;&nbsp;
                                	<input class="tableButton" type='reset' name='btnReset' id='btnReset' value='Reset Form'>
									&nbsp;&nbsp;
									<input class= "tableButton" type=file name='myfile' id='myfile'>
								</td>
                            </tr>
                        </table>
                    </form>
                </div><!-- End Main -->
            </div><!-- End Content -->
            
<?php 
	include './footer.php'; 
?>