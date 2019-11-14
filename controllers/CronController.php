<?php

class Cron extends Controller
{
	private $Menu;

	function __construct($Model, $ModelPath, $Menu)
	{
		$this->Menu = $Menu;
		parent::__construct($Model, $ModelPath);
		set_time_limit(0);
	}
	
	public function Index()
	{
		echo 'Index';
	}

	public function Minutes1()
	{
        $Id = $this->Model->StartCron('Minutes1');

        $this->Model->UpdateSales();
        $this->Model->FixPipeDriveProducts();
        $this->Model->FixOldProducts();
		$this->Model->AddProducts();
		$this->Model->UpdateProducts();
		$this->Model->DeleteProducts();
		$this->Model->PipeDriveOrders();

        $this->Model->EndCron($Id);
	}

	public function Minutes5()
	{
		//
	}

	public function Hour1()
	{
		//
	}

	public function Day1()
	{
		//
	}

	public function LangsGenerator()
	{
		$Langs = new LangsGenerator();
		$Langs->FillLangs();
		$Langs->SaveLangFiles();
		// for admin
		$Langs = new LangsGenerator(true);
		$Langs->FillLangs();
		$Langs->SaveLangFiles();
	}
}