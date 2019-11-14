<?php

class View 
{	
	private $Twig;

	function __construct()
	{
		$Loader 	= new Twig_Loader_Filesystem(ADMIN_TWIG_TPL);
		$CachePath = [];

		if(TWIG_CACHE){
			$CachePath = ['cache' => ROOT.TWIG_CACHE_PATH, 'auto_reload' => true];
		}
		$this->Twig = new Twig_Environment($Loader, $CachePath);

		// add functions
		$Date = new Twig_SimpleFunction('date', 'date');
		$this->Twig->addFunction($Date);

		$Time = new Twig_SimpleFunction('time', 'time');
		$this->Twig->addFunction($Time);

		$Strtotime = new Twig_SimpleFunction('strtotime', 'strtotime');
		$this->Twig->addFunction($Strtotime);

		$json_decode = new Twig_SimpleFunction('json_decode', 'json_decode');
		$this->Twig->addFunction($json_decode);

		$IsEmail = new Twig_SimpleFunction('IsEmail', ['Functions', 'IsEmail']);
		$this->Twig->addFunction($IsEmail);

		$ChangeDate = new Twig_SimpleFunction('ChangeDate', ['Functions', 'ChangeDate']);
		$this->Twig->addFunction($ChangeDate);

		$Currency = new Twig_SimpleFunction('GetCurrencySymbol', ['Functions', 'GetCurrencySymbol']);
		$this->Twig->addFunction($Currency);

		$Pre = new Twig_SimpleFunction('pre', ['Functions', 'Pre']);
		$this->Twig->addFunction($Pre);

		// add filters
		$Clean = new Twig_SimpleFilter('clean', ['Functions', 'Clean']);
		$this->Twig->addFilter($Clean);

		$Url = Functions::GetRoute();

		$Globals = array(
			'lang' 	=> array(
				'id' 	=> Lang::GetLangID(),
				'code' 	=> Lang::GetLang(),
				'langs' => json_decode(LANGS),
			),
			'uri' 	 => URL . Lang::GetLang() . '/',
			'url' 	 => URL,
			'path' 	 => DIR,
			'controller' 	 => isset($Url[1]) ? strtolower($Url[1]) : '',
			'action' => isset($Url[2]) ? strtolower($Url[2]) : '',
			'route' => $Url,
			'ip'     => $_SERVER['REMOTE_ADDR']
		);

		$this->Twig->addGlobal('constants', get_defined_constants(true)['user']);
		$this->Twig->addGlobal('session', $_SESSION);
		$this->Twig->addGlobal('cookie', $_COOKIE);
		$this->Twig->addGlobal('post', $_POST);
		$this->Twig->addGlobal('get', $_GET);
		$this->Twig->addGlobal('langs', Lang::Get());
		$this->Twig->addGlobal('globals', $Globals);
	}

	private function SetTwigOptions($Options){
		$lexer = new Twig_Lexer($this->Twig, $Options);
		$this->Twig->setLexer($lexer);
	}

	public function Render($File, $Replace = array(), $Return = false)
	{
		if(!$Return)
			echo $this->Twig->render($File, $Replace);
		else
			return $this->Twig->render($File, $Replace);

	}
}