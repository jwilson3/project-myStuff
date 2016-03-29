<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Create a connection to the database mystuff_1_0
$conn = mysqli_connect($server = 'localhost', $username = 'admin', 
                        $password = 'password', $db = 'mystuff_1_0');

//Check to see if the connection was made
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_errno();
} else {
    echo "You're connected!<br />\n";
}

?>