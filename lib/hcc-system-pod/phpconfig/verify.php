<?php 
session_start();

$otp = $_POST['otp'];
try{
    
    /*
    if($current_otp === $otp)
    {
        echo "200";
    }
    else
    {
        echo "404";
    }
    */
    
}
catch(Exception $e)
{
    echo "something went wrong";
}
session_destroy();

?>