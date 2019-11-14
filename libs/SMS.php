<?php

Class SMS
{
	public static function Send($Phone, $Message)
	{
		$Response = file_get_contents(SMS_SEND_URL . 'key=' . urlencode(SMS_KEY) . '&destination=' . SMS::CorrectPhone($Phone) . '&sender=' . urlencode(SMS_SENDER_NAME). '&content=' . urlencode($Message));
		if($Response == '01')
			return true;
		return false;
	}

	public static function CorrectPhone($Phone)
	{
		if(substr($Phone, 0, 3) != '995')
			$Phone = '995' . $Phone;
		return $Phone;
	}

	public static function RandCode()
	{
		return rand(10000, 99999);
	}
}