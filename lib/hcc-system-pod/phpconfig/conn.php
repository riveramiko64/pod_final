<?php 

$servername = "id22175641_podserverdatabase";
$username = "id22175641_grimlocker08";
$password = "Grimlocker_08";
$dbname = "id22175641_podserverdatabase";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


?>