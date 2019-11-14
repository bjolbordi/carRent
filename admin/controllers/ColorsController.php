<?php

class Colors extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index($SaveSort = '')
    {
        if($SaveSort == 'savesort'){
            $Result = $this->Model->SaveSort(Request::Post());
            echo json_encode($Result);
            exit;
        }

        $this->Model->Params['colors'] = $this->Model->GetItems()['Data'];
        $this->View->render('colors/index.tpl', $this->Model->Params);
    }

	public function AddItem()
	{
		if(Request::Post()){
			$Result = $this->Model->InsertItem(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/colors/');
			else
				$this->Model->Params['message'] = $Result['Message'];
		}
		$this->View->render('colors/inc/add.tpl', $this->Model->Params);
	}

	public function EditItem($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->UpdateItem($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/colors/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['item'] = $this->Model->GetItemData($Id)['Data'];

		if(!$this->Model->Params['item'])
			$this->Model->Error();

		$this->View->render('colors/inc/edit.tpl', $this->Model->Params);
	}

	public function RemoveItem($Id)
	{
		$Result = $this->Model->RemoveItem($Id);
		echo json_encode($Result);
	}

	public function SaveSort()
	{
		$Result = $this->Model->SaveSort(Request::Post());
		echo json_encode($Result);
	}
}