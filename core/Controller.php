<?php

class Controller 
{	
	public $Method;

	function __construct($Model, $ModelPath)
	{
		$this->View  = new View();
		$this->LoadModel($Model, $ModelPath);
	}
	
	private function LoadModel($Name, $ModelPath)
	{
		$File = $ModelPath . $Name . 'Model.php';

		if(file_exists($File))
		{
			require_once $File;

			$ModelName   = $Name . 'Model';
			$this->Model = new $ModelName();
		}
	}
}