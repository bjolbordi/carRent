<?php

class Session 
{	
	public static function Init()
	{		
		@session_start();
	}
	
	public static function Set($Key, $Val)
	{	
		$_SESSION[$Key] = $Val;
	}
	
	public static function Get($Key = false)
	{
		if($Key && isset($_SESSION[$Key]))
		{
			return $_SESSION[$Key];
		}
		elseif($Key === false)
		{
			return $_SESSION;
		}

		return false;
	}	
	
	public static function Destroy($Key = false)
	{
		if($Key == false)
		{
			unset($_SESSION);
			session_destroy();	
		}
		elseif(isset($_SESSION[$Key]))
		{
			unset($_SESSION[$Key]);
		}
	}

	public static function Push($Arr, $Key, $Val)
	{	
		$_SESSION[$Arr][$Key] = $Val;
	}

	public static function _Unset($Arr, $Key)
	{	
		unset($_SESSION[$Arr][$Key]);
	}
}