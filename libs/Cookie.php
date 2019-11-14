<?php

class Cookie 
{	
	public static function Set($Key, $Val, $Expire = 0, $Path = '/', $Domain = '')
	{
        return setcookie($Key, $Val, $Expire, $Path, $Domain);
	}
	
	public static function Get($Key = false)
	{
		if(isset($_COOKIE[$Key]))
			return $_COOKIE[$Key];
        if(!$Key)
            return $_COOKIE;
		return false;
	}	
	
	public static function Destroy($Key = false)
	{
		if($Key == false)
			unset($_COOKIE);
		elseif(isset($_COOKIE[$Key]))
			unset($_COOKIE[$Key]);
	}
}