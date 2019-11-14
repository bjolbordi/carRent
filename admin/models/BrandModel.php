<?php

class BrandModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetBrands()
	{
		$Data = $this->DB->GetAll('SELECT
								    * 
									FROM brands
									ORDER BY ordering ASC');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetBrandData($Id)
	{
		$Data = $this->DB->GetRow('SELECT
									*
									FROM brands
									WHERE brand_id = ?i', (int)$Id);
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function Insert($Post)
	{
        $Oredring = $this->DB->GetOne('SELECT count(0)+1 FROM brands');
	    $this->DB->Query('INSERT INTO brands SET title = ?s, ordering = ?i', $Post['title'], $Oredring);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
        $this->DB->Query('UPDATE brands SET title = ?s WHERE brand_id = ?i', $Post['title'], $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
        $Count = $this->DB->GetOne('SELECT count(0) FROM products WHERE brand_id = ?i', $Id);
        if($Count){
            $this->SetResult(false, 'First Change Products Brands');
            return $this->Result;
        }

	    $this->DB->Query('DELETE FROM brands WHERE brand_id = ?i', $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function SaveSort($Post)
	{
		$Order = explode(',', $Post['data']);
		foreach ($Order as $k => $id)
		{
			$i = $k+1;
			$this->DB->Query('UPDATE brands SET ordering =?i WHERE brand_id = ?i', $i, $id);
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}