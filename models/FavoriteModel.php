<?php

class FavoriteModel extends Model
{
	public function __construct()
	{		
		parent::__construct();
	}

    public function GetFavorites()
    {
        $Favorites = json_decode(Cookie::Get('favorites'), true);
        $In = implode(',', $Favorites);
        $Data = [];
        if(count($Favorites)){
            $Data = $this->DB->GetAll('SELECT
                                        p.product_id,
                                        IF(v.variant_id, v.sale, p.sale) AS sale,
									    IF(v.variant_id, v.price, p.price) AS price,
                                        IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,
                                        v.variant_id,
                                        IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,
                                        t.title
                                        FROM products p
                                        LEFT JOIN products_trans t ON t.product_id = p.product_id
                                        LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1
                                        LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1
                                        LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id
                                        LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id 
                                        WHERE p.product_id IN ('.$In.') AND t.lang_id = ?i AND p.status_id = 1 
                                        GROUP BY p.product_id ORDER BY p.product_id ASC LIMIT 20', Lang::GetLangID());
        }
        return $Data;
    }

    public function SaveFavorite($ProductId)
    {
        $Favorites = json_decode(Cookie::Get('favorites'), true);

        if(!is_array($Favorites)){
            $Favorites =  [$ProductId];
        }else{
            $NewFavorites = $ProductId;

            if(!in_array($NewFavorites, $Favorites))
                $Favorites[] = $NewFavorites;
            else{
                $this->SetResult(false, 'Error', ['Count' => 0]);
                return $this->Result;
            }

        }
        if(count($Favorites) > 20)
            $Favorites = array_slice($Favorites, 1);
        Cookie::Set('favorites', json_encode($Favorites), time() + 60*60*24*365, '/');
        $this->SetResult(true, 'Success', ['Count' => count($Favorites)]);
        return $this->Result;
    }

    public function RemoveFavorite($ProductId)
    {
        $Favorites = json_decode(Cookie::Get('favorites'), true);

        if(is_array($Favorites)){
            $Favorite = $ProductId;
            $Key = array_search($Favorite, $Favorites);
            if($Key !== false)
                unset($Favorites[$Key]);
            Cookie::Set('favorites', json_encode($Favorites), time() + 60*60*24*365, '/');

            $this->SetResult(true, 'Success', ['Count' => count($Favorites)]);
            return $this->Result;
        }
        $this->SetResult(false, 'Error', ['Count' => 0]);
        return $this->Result;

    }
}