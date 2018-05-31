<?php
//////////////////////////////////////////////////////////
// PERFECT PHP                                          //
// v2.1.0 (March 26, 2018)                              //
// Process a web form to extract the user input and     //
//    then email the data to a predefined recipient.    //
// MIT or WTFPL (your choice)                           //
// http://centerkey.com/php                             //
//////////////////////////////////////////////////////////

// Configuration settings
$sendFrom =    "Form Feedback <feedback@yourdomain.com>";
$sendTo =      "feedback@yourdomain.com";
$subjectLine = "Feedback Submission";
$thanksUrl =   "thanks.html";  //confirmation page

// Build message body from web form input
$body = $_SERVER["SERVER_NAME"] . "\n\n";
foreach ($_POST as $field=>$value)
   $body .= "$field: $value\n";
$body .= "\n" . @gethostbyaddr($_SERVER["REMOTE_ADDR"]);
$body = htmlspecialchars($body, ENT_NOQUOTES);  //make safe

// Send email and direct browser to confirmation page
mail($sendTo, $subjectLine, $body, "From: $sendFrom");
header("Location: $thanksUrl");
?>
