<?php

class Curl 
{
	public static function Post($URL, $Data)
	{
		Curl::BuildQuery($Data, $Params);

		$Curl = curl_init();
		
		curl_setopt($Curl, CURLOPT_URL, $URL);
		curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($Curl, CURLOPT_POST, 1);
		curl_setopt($Curl, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($Curl, CURLOPT_REFERER, SITE);
		curl_setopt($Curl, CURLOPT_POSTFIELDS, Curl::ImplodeQuery($Params));
		//echo serialize(Curl::ImplodeQuery($Params));
		$Result = curl_exec($Curl);
		
		curl_close($Curl);
		
		return $Result;
	}
	
	public static function BuildQuery($Arrays, &$New = array(), $Prefix = NULL)
	{
		if(is_object($Arrays)){
			$Arrays = get_object_vars($Arrays);
		}
	
		foreach($Arrays as $Key => $Value) {
			$K = isset($Prefix) ? $Prefix . '[' . $Key . ']' : $Key;
			if(is_array($Value) || is_object($Value)){
				Curl::BuildQuery($Value, $New, $K);
			} else {
				$New[$K] = $Value;
			}
		}
	}
	
	public static function ImplodeQuery($Array)
	{
		$Result = array();
		
		foreach($Array as $Key => $Value) {
			$Result[] = $Key . '=' . $Value;
		}
		
		return implode('&', $Result);
	}
}