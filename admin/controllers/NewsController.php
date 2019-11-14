<?php

class News extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['news'] = $this->Model->GetNews()['Data'];
        $this->Model->Params['Page'] = Request::Get('page') ? (int)Request::Get('page') : 1;
        // set url
        Request::UnSetGet('url');
        Request::UnSetGet('page');
        $this->Model->Params['Url'] = http_build_query(Request::Get());
		$this->View->render('news/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/news/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
        $this->Model->Params['allTags'] = $this->Model->GetTags()['Data'];
		$this->View->render('news/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/news/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['news'] = $this->Model->GetNewsData($Id)['Data'];
		$this->Model->Params['images'] = $this->Model->GetItemImages($Id)['Data'];
        $this->Model->Params['tags'] = $this->Model->GetTags($Id)['Data'];
        $this->Model->Params['allTags'] = $this->Model->GetTags()['Data'];

		if(!$this->Model->Params['news'])
			$this->Model->Error();

		$this->View->render('news/inc/edit.tpl', $this->Model->Params);
	}

	public function Remove($Id)
	{
		$Result = $this->Model->Remove($Id);
		echo json_encode($Result);
	}

	public function RemoveImage()
	{
		$Result = $this->Model->RemoveImage(Request::Post('id'));
		echo json_encode($Result);
	}

	public function CoverImage()
	{
		$Result = $this->Model->CoverImage(Request::Post('id'));
		echo json_encode($Result);
	}
}