<?php


class Contact extends Controller
{
	private $Menu;

	function __construct($Model, $ModelPath, $Menu)
	{
		$this->Menu = $Menu;
		parent::__construct($Model, $ModelPath);
		$this->Model->SetMetaData($this->Menu);
        $this->Model->SetCurrentMenu($this->Menu);
	}

	public function Index()
	{
		$this->View->render('contact/index.tpl', $this->Model->Params);
	}

	public function Send()
	{
		$this->Model->Send();
		echo json_encode($this->Model->Result);
	}

	

}