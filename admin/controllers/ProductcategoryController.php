<?php

class Productcategory extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

    public function Index($Id = 0)
    {
        $this->Model->Params['categories'] = $this->Model->GetCategories((int)$Id)['Data'];
        $this->View->render('productcategory/index.tpl', $this->Model->Params);
    }

	public function AddCategory()
	{
		if(Request::Post()){
			$Result = $this->Model->InsertCategory(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/productcategory/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
        $this->Model->Params['parents'] = $this->Model->GetAllCategory()['Data'];
		$this->View->render('productcategory/inc/add.tpl', $this->Model->Params);
	}

	public function EditCategory($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->UpdateCategory($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/productcategory/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['category'] = $this->Model->GetCategoryData((int)$Id)['Data'];
        $this->Model->Params['parents'] = $this->Model->GetAllCategory((int)$Id)['Data'];
		//Functions::Pre($this->Model->Params['category']);
		if(!$this->Model->Params['category'])
			$this->Model->Error();

		$this->View->render('productcategory/inc/edit.tpl', $this->Model->Params);
	}

	public function RemoveCategory($Id)
	{
		$Result = $this->Model->RemoveCategory($Id);
		echo json_encode($Result);
	}

    public function SaveSort()
    {
        $Result = $this->Model->SaveSort(Request::Post());
        echo json_encode($Result);
    }
}