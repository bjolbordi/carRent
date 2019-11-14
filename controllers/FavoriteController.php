<?php

class Favorite extends Controller
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
        $this->Model->Params['Favorites'] = $this->Model->GetFavorites();
        $this->View->render('favorite/index.tpl', $this->Model->Params);
	}

    public function Save($ProductId = 0)
    {
        $Result = $this->Model->SaveFavorite($ProductId);
        echo json_encode($Result);
    }

    public function Remove($ProductId = 0)
    {
        $Result = $this->Model->RemoveFavorite($ProductId);
        echo json_encode($Result);
    }
}