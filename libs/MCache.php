<?php
/*
class MCache extends Memcache
{
	private $DB;
	private $Data;
	private $Cnt;
	private $ExpireSeconds;

	public function __construct($DB)
	{
		$this->AddServer('127.0.0.1');
		$this->DB   		 = $DB;
		$this->Data 		 = NULL;
		$this->Cnt  		 = 0;
		$this->ExpireSeconds = 3600;
	}

	public function GetAll()
	{
		return $this->GetDbData('GetAll', func_get_args());
	}

	public function GetRow()
	{
		return $this->GetDbData('GetRow', func_get_args());
	}

	public function GetCol()
	{
		return $this->GetDbData('GetCol', func_get_args());
	}

	public function GetOne()
	{
		return $this->GetDbData('GetOne', func_get_args());
	}

	public function GetInd()
	{
		return $this->GetDbData('GetInd', func_get_args());
	}

	public function GetIndCol()
	{
		return $this->GetDbData('GetIndCol', func_get_args());
	}

	private function GetDbData($Func, $args)
	{
		$nArgs    = $args;
		$IndFuncs = false;

		if(($IndFuncs = in_array($Func, array('GetInd', 'GetIndCol'))))
		{
			$Index = array_shift($args);
			$nArgs = $args;
		}
 		
		$raw   = array_shift($args);
		$array = preg_split('~(\?[nsiuap])~u', $raw, null, PREG_SPLIT_DELIM_CAPTURE);
		$anum  = count($args);
		$pnum  = floor(count($array) / 2);
		
		if($pnum != $anum && $pnum != $anum - 1)
		{
			$this->DB->Error("Number of args ($anum) doesn't match number of placeholders ($pnum) in [$raw]");

			return false;
		}

		if($pnum == $anum - 1)
		{
			
			$this->ExpireSeconds = array_pop($nArgs);
		}
		
		$Query        = $this->DB->PrepareQuery($nArgs);
		$QueryName    = md5($Func . ' - ' . $Query);
		$QueryCntName = md5($Func . ' - ' . $Query . ' - Cnt');
		
		$this->Data = $this->Get($QueryName);
		$this->Cnt  = $this->Get($QueryCntName);
		//$this->flush();
		if($this->Data === false)
		{
			if($IndFuncs)
			{
				$this->Data = $this->DB->{$Func}($Index, $Query);
			}
			else
			{
				$this->Data = $this->DB->{$Func}($Query);
			}

			if(strpos($Query, 'SQL_CALC_FOUND_ROWS'))
			{
				$this->Cnt  = $this->DB->GetOne('SELECT FOUND_ROWS()');
			}
			else
			{
				$this->Cnt = count($this->Data);	
			}

			$this->Set($QueryName, $this->Data, 0, $this->ExpireSeconds);	
			$this->Set($QueryCntName, $this->Cnt, 0, $this->ExpireSeconds);
		}

	    return $this->Data;
	}

	public function GetCnt()
	{
		return $this->Cnt;
	}
}*/