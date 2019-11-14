<?php

class Menu extends Controller
{
	private $Views = ['main', 'single', 'news', 'product', 'contact', 'custom'];
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		if(Request::Req('ajax'))
			return;
		$this->Model->Params['menuItem'] = $Menu;
		$this->Model->Params['views'] = $this->Views;
	}

	public function Index()
	{
		$this->Model->Params['data'] = $this->Model->GetMenuArray()['Data'];
		$this->View->render('menu/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/menu/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['parents'] = $this->Model->GetMenuArray()['Data']['items'];
		$this->View->render('menu/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/menu/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['parents'] = $this->Model->GetMenuArray()['Data']['items'];
		$this->Model->Params['data'] = $this->Model->GetMenuData($Id)['Data'];
		if(!$this->Model->Params['data'])
			$this->Model->Error();

		$this->View->render('menu/inc/edit.tpl', $this->Model->Params);
	}

	public function Remove($Id)
	{
		$Result = $this->Model->Remove($Id);
		echo json_encode($Result);
	}

	public function SaveSort()
	{
		$Result = $this->Model->SaveSort(Request::Post());
		echo json_encode($Result);
	}

	public function GetContent()
	{
		$View = Request::Post('view');
		$this->Model->Params['view'] = $View;
		$this->Model->Params['id'] = Request::Post('id');

		if($View == 'single'){
			$this->Model->Params['options'] = $this->Model->GetPagesArray();
		}
		elseif($View == 'portfolio'){
			$this->Model->Params['options'] = $this->Model->GetPortfolioArray();
		}
		elseif($View == 'photogallery'){
			$this->Model->Params['options'] = $this->Model->GetAlbumsArray();
		}
		elseif($View == 'videogallery'){
			$this->Model->Params['options'] = $this->Model->GetVideoAlbumsArray();
		}
		elseif($View == 'product'){
			$this->Model->Params['options'] = $this->Model->GetProducCategoriesArray();
		}
		else{
			$this->Model->Params['options'] = [];
		}
		$Html = $this->View->Render('menu/inc/select.tpl', $this->Model->Params, true);
		$this->Model->SetResult(true, '', $Html);

		echo json_encode($this->Model->Result);

	}
}