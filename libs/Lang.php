<?php

class Lang
{
    private static $Lang = DEFAULT_LANG;
    private static $LangID = NULL;
    private static $Data = NULL;

    public static function SetLang($Lang, $LangID)
    {
        self::$Lang = $Lang;
        self::$LangID = $LangID;
        setcookie("Lang", $Lang, time() + 60*60*24*365, "/");
    }

    public static function GetLang()
    {
        return self::$Lang;
    }

    public static function GetLangID()
    {
        return self::$LangID;
    }

    public static function SetData()
    {
        if (is_null(self::$Data)) {
            self::$Data = json_decode(file_get_contents('langs/' . self::$Lang . '.json'), true);
        }
    }

    public static function Get($Key = false)
    {
        self::SetData();

        if ($Key == false) {
            return self::$Data;
        }

        //print_r(self::$_Data);
        if (is_array($Key)) {
            switch (count($Key)) {
                case 2:
                    return isset(self::$Data[$Key[0]][$Key[1]]) ? self::$Data[$Key[0]][$Key[1]] : '!lang';
                    break;

                case 3:
                    return isset(self::$Data[$Key[0]][$Key[1]][$Key[2]]) ? self::$Data[$Key[0]][$Key[1]][$Key[2]] : '!lang';
                    break;
            }
        }

        return isset(self::$Data[$Key]) ? self::$Data[$Key] : $Key;
    }
}