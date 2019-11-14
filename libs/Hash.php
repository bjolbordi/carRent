<?php

class Hash
{	
	public static function Create($Algo, $Data, $HashKay)
	{
		$Context = hash_init($Algo, HASH_HMAC, $HashKay);
		hash_update($Context, $Data);
		
		return hash_final($Context);
	}
}