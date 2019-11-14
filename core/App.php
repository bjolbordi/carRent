<?php

class App
{
	private $URL = NULL;
	private $Controller = NULL;
	
	private $ControllerPath = 'controllers/';
	private $ModelPath = 'models/';
	
	private $DefaultController = 'Main';
	public $ErrorController = 'error';

	private $DefaultMethod = 'Index';
	private $DB;

	private $Views = ['main', 'single', 'news', 'product', 'contact', 'custom'];
	
	public function Init()
	{
		$this->DB = new DataBase();
		Session::init();
		
		$this->SetURL();
		$this->LoadController();
		$this->CallControllerMethod();
		echo 123;
	}
	
	private function SetURL()
	{
		$URL_1		= isset($_GET['url']) ? $_GET['url'] : NULL;
		$URL_1 		= rtrim($URL_1, '/');
		$URL_1 		= filter_var($URL_1, FILTER_SANITIZE_URL);
		$URL_Array 	= explode('/', $URL_1);
		$Langs 		= json_decode(LANGS, true);

		if(!isset($Langs[$URL_Array[0]]))
		{
			$Lang = Cookie::Get('Lang');
			if($Lang == false)
				$Lang = DEFAULT_LANG;
			header('Location: ' . URL. $Lang . '/' . $URL_1);
			exit;
		}
		else
		{
			if(count($URL_Array) > 1)
				$URL_Array[1] = ucfirst(strtolower($URL_Array[1]));
			Lang::SetLang($URL_Array[0], $Langs[$URL_Array[0]]['id']);
			$this->URL = $URL_Array;
		}
	}

	private function GetMenu($Controller)
	{
		return $this->DB->GetRow('SELECT
									menu.*,
									t.*
									FROM
									menu
									LEFT JOIN menu_trans t ON menu.id = t.menu_id
									WHERE menu.alias = ?s AND t.language = ?i',
			 $Controller, Lang::GetLangID());
	}

	private function GetHomeMenu()
	{
		return $this->DB->GetRow('SELECT
								menu.*,
								t.*
								FROM
								menu
								LEFT JOIN menu_trans t ON menu.id = t.menu_id
								WHERE home=1 AND t.language = ?i', Lang::GetLangID());
	}

	private function LoadController()
	{
		if(isset($this->URL[1])){
			$Menu = $this->GetMenu(strtolower($this->URL[1]));
			if(!$Menu && in_array(strtolower($this->URL[1]), $this->Views))
				$Menu['view'] = $this->URL[1];
		}else{
			$Menu = $this->GetHomeMenu();
		}
		if(!$Menu)
			$this->Error();
		$Controller = ucfirst($Menu['view']);
		$File = $this->ControllerPath . $Controller . 'Controller.php';

		if(file_exists($File))
		{
			require_once $File;
			$this->Controller = new $Controller($Controller, $this->ModelPath, $Menu);
		}
		else
		{
			$this->Error();
		}
	}
	
	private function CallControllerMethod()
	{
		$this->Controller->Method = (isset($this->URL[2]) && ucfirst($this->URL[2]) && !is_numeric($this->URL[2])) ? $this->URL[2] : $this->DefaultMethod;

		if(!method_exists($this->Controller, $this->Controller->Method))
		{
			$this->Error();
		}
		if($this->Controller->Method == $this->DefaultMethod)
			$Args = array_slice($this->URL, 2);
		else
			$Args = array_slice($this->URL, 3);
		call_user_func_array([$this->Controller, $this->Controller->Method], $Args);
	}

	public function GetMethod()
	{
		return $this->Method;
	}
	
	private function Error()
	{
		$Lang = Cookie::Get('Lang');
		if($Lang == false)
			$Lang = DEFAULT_LANG;
		header('Location: ' . URL . $Lang . '/'. $this->ErrorController.'/');
		exit;
	}
	
	public function SetControllerPath($Path)
	{
		$this->ControllerPath = trim($Path, '/') . '/';
	}
	
	public function SetModelPath($Path)
	{
		$this->ModelPath = trim($Path, '/') . '/';
	}
	
	public function SetDefaultFile($File)
	{
		$this->DefaultController = $File;
	}
	
	public function SetErrorFile($File)
	{
		$this->ErrorController = $File;
	}
}