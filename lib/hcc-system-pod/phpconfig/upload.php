<?php
include 'conn.php';

$fullname = $_POST['fullname'];
$course_year_section = $_POST['course_year_section'];
$home_address = $_POST['home_address'];
$phone_number = $_POST['phone_number'];
$identity = $_POST['identity'];
$incident_date = $_POST['incident_date'];
$incident_time = $_POST['incident_time'];
$incident_location = $_POST['incident_location'];
$incident_description = $_POST['incident_description'];


$sql = "INSERT INTO tbl_incidentdata (fullname, course_year_section, home_address, phone_number, identity, incident_date, incident_time, incident_location, incident_description)
VALUES ('$fullname', '$course_year_section', '$home_address', '$phone_number', '$identity', '$incident_date', '$incident_time', '$incident_location', '$incident_description')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>