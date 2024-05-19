<?php
session_start();

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/SMTP.php';

function generateOTP($length = 6) {
    $characters = '0123456789';
    $otp = '';
    $max = strlen($characters) - 1;
    for ($i = 0; $i < $length; $i++) {
        $otp .= $characters[random_int(0, $max)];
    }
    return $otp;
}


$mail = new PHPMailer(true);

try {
    
    $otp = generateOTP();
    $email = $_POST['email'];             
    $mail->isSMTP();                                            
    $mail->Host       = 'smtp.gmail.com';                   
    $mail->SMTPAuth   = true;                                  
    $mail->Username   = 'madelpangan0@gmail.com';                     
    $mail->Password   = 'lgaf uwyf iuty jyna';                              
    $mail->SMTPSecure = 'ssl';           
    $mail->Port       = 465;                                 
    $mail->setFrom('madelpangan0@gmail.com');
    $mail->addAddress($email);     
    $mail->isHTML(true);                                  
    $mail->Subject = 'OTP';
    $mail->Body    = 'Here is your otp'.$otp;
    $mail->send();
    

    echo strval($otp);
} catch (Exception $e) {
    
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}


?>