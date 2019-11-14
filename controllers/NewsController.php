<?php

class News extends Controller
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
        $this->Model->Params['Page'] = Request::Get('page') ? (int)Request::Get('page') : 1;
        $this->Model->Params['PerPage'] = 8;

        $this->Model->Params['News'] = $this->Model->GetNews($this->Model->Params['Page'], $this->Model->Params['PerPage']);

        $this->Model->Params['Count'] = $this->Model->Count;
        $this->View->render('news/index.tpl', $this->Model->Params);
	}

	public function Detail($Id = false)
	{
		if(empty($Id))
			$this->Model->Error();
		$this->Model->Params['Post'] = $this->Model->GetPost($Id);
        if(!$this->Model->Params['Post'])
            $this->Model->Error();
		$this->Model->Params['Images'] = $this->Model->GetImages($Id);
		$this->Model->Params['SimilarNews'] = $this->Model->GetSimilarNews($Id);

        $this->Model->SetMetaData(
            [
                'title' => $this->Model->Params['Post']['title'],
                'desc' => $this->Model->Params['Post']['text']
            ]);

		$this->View->render('news/detail.tpl', $this->Model->Params);
	}

}