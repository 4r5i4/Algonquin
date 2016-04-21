<?php 
	require_once('./header.php'); 
	require_once('./customerDAO.php'); // Database connection and function defenition
?>
            <div id="content" class="clearfix">
                <div class="main" style="width: 660px;">
                    <?php
					try {
						$customerDAO = new CustomerDAO();
				        $customers = $customerDAO->getCustomers();
       	    			if($customers){
			                echo "<table class='tableLists'>";
           	    			echo '<thead><tr><th>Full Name</th><th>Email</th><th>Username</th><th>Phone</th></tr></thead><tbody>';
               				foreach($customers as $customer) {
                   				echo '<tr>';
                   				echo "<td style='width: 200px;'>" . $customer->getFirstName() . ' ' . $customer->getLastName() . '</td>';
           	        			echo "<td style='width: 200px;'>" . $customer->getEmailAddress() . '</td>';
               	    			echo "<td style='width: 120px;'>" . $customer->getUsername() . '</td>';
								echo "<td style='width: 120px;'>" . $customer->getPhoneNumber() . '</td>';
                   				echo '</tr>';
							}
							echo '</tbody></table>';
               			}
           			} catch(Exception $e) {
           				echo '<h3>Error on page.</h3>';
           				echo '<p>' . $e->getMessage() . '</p>';            
       				}
       			?>
                </div><!-- End Main -->
            </div><!-- End Content -->
            
<?php include './footer.php'; ?>