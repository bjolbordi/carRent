<?php

class Email
{
	public static function Send($To, $From, $Subject, $Message)
	{
		require_once 'mail/class.phpmailer.php';

		$Headers  = "From: " . strip_tags($From) . "\r\n";
		$Headers .= "Reply-To: " . strip_tags($From) . "\r\n";
		$Headers .= "MIME-Version: 1.0\r\n";
		$Headers .= "Content-Type: text/html; charset=UTF-8\r\n";

		$mail	= new PHPMailer;

		$mail->CharSet = 'utf-8';
		$mail->SMTPSecure = 'none'; // Enable encryption, 'ssl' also accepted

		if(SMTP) {
			$mail->IsSMTP();                                      // Set mailer to use SMTP
			$mail->Host = 'mail.ajaratravel.com';                 // caucasusis ip 213.157.205.169 an mail.tbet.ge
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = 'root@ajaratravel.com';             // SMTP username
			$mail->Password = 'Ajaratravel1234';                  // SMTP password
		}

		$mail->From = $From;
		$mail->FromName = $From;
		$mail->AddAddress($To);             		  		 // Name is optional
		$mail->Port = 25;							 		 //465 for ssl

		$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
		$mail->IsHTML(true);                                  // Set email format to HTML
		$mail->SMTPDebug = 0;

		$mail->Subject = $Subject;
		$mail->Body = $Message;

		if(!$mail->Send()) {
			echo 'Message could not be sent.';
			echo 'Mailer Error: ' . $mail->ErrorInfo;
            return false;
		}
		return true;
	}

	public static function TestSend($To, $From, $Host, $User, $Pass)
	{
		require_once 'mail/class.phpmailer.php';

		$mail	= new PHPMailer;

		$mail->CharSet = 'utf-8';
		$mail->IsSMTP();                           // Set mailer to use SMTP
		$mail->Host = $Host;  					   // caucasusis ip 213.157.205.169 an mail.tbet.ge
		$mail->SMTPAuth = true;                    // Enable SMTP authentication
		$mail->Username = $User;                   // SMTP username
		$mail->Password = $Pass;               	   // SMTP password
		$mail->SMTPSecure = 'none';                // Enable encryption, 'ssl' also accepted

		$mail->From = $From;
		$mail->FromName = $From;
		$mail->AddAddress($To);             		  // Name is optional
		$mail->Port = 25;

		$mail->WordWrap = 50;                         // Set word wrap to 50 characters
		$mail->IsHTML(true);                          // Set email format to HTML
		$mail->SMTPDebug = 0;

		$mail->Subject = 'test';

		$mail->Body    = 'test message '.date('Y-m-d H:i:s');

		if(!$mail->Send()) {
			echo 'Message could not be sent.';
			echo 'Mailer Error: ' . $mail->ErrorInfo;
			return false;
		}

		return true;
	}

}
?>