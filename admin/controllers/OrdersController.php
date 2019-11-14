<?php

class Orders extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

    public function Index()
    {
        $this->Model->Params['items'] = $this->Model->GetItems()['Data'];
        $this->Model->Params['Page'] = Request::Get('page') ? (int)Request::Get('page') : 1;
        // set url
        Request::UnSetGet('url');
        Request::UnSetGet('page');
        $this->Model->Params['Url'] = http_build_query(Request::Get());
        $this->View->render('orders/index.tpl', $this->Model->Params);
    }

    public function Detail($OrderId = false)
    {
        $this->Model->Params['items'] = $this->Model->GetItemData($OrderId)['Data'];
        $this->View->render('orders/detail.tpl', $this->Model->Params);
    }
}