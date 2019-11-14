<pre><?php

class LangsGenerator
{
    public $DB = NULL;
    public $Langs = [];
    public $LangsFolder = 'langs/';
    public $LangsTable = 'langs';

    public function __construct($Admin = false)
    {
        $this->DB = new DataBase();
        if ($Admin) {
            $ConfigLangs = array_keys(json_decode(ADMIN_LANGS, true));
            $this->LangsFolder = 'admin/langs/';
            $this->LangsTable = 'admin_langs';
        } else {
            $ConfigLangs = array_keys(json_decode(LANGS, true));
            $this->LangsFolder = 'langs/';
		}

        foreach ($ConfigLangs as $Key => $Val) {
            $this->Langs[$Val]['js'] = [];
            $this->Langs[$Val]['json'] = [];
        }
    }

    public function FillLangs()
    {
        $Data = $this->DB->getAll('SELECT * FROM '.$this->LangsTable.' ');

        if (count($Data)) {
            foreach ($Data as $Key => $Val) {
                foreach ($this->Langs as $Key_1 => $Val_1) {
                    $this->FillLang($Key_1, $Val['lang_var'], $Val['lang_' . $Key_1], $Val['lang_js']);
                }
            }
        }
    }

    public function FillLang($Key, $Var, $Val, $Js)
    {
        $Var = explode('[', $Var);

        switch (count($Var)) {
            case 2:
                $this->Langs[$Key]['json'][$Var[0]][substr($Var[1], 0, -1)] = $Val;
                if ($Js == 1) {
                    $this->Langs[$Key]['js'][$Var[0]][substr($Var[1], 0, -1)] = $Val;
                }
                break;

            case 3:
                $this->Langs[$Key]['json'][$Var[0]][substr($Var[1], 0, -1)][substr($Var[2], 0, -1)] = $Val;
                if ($Js == 1) {
                    $this->Langs[$Key]['js'][$Var[0]][substr($Var[1], 0, -1)][substr($Var[2], 0, -1)] = $Val;
                }
                break;

            default:
                $this->Langs[$Key]['json'][$Var[0]] = $Val;
                if ($Js == 1) {
                    $this->Langs[$Key]['js'][$Var[0]] = $Val;
                }
                break;
        }
    }

    public function SaveLangFiles()
    {
        if (!is_dir($this->LangsFolder))
            mkdir($this->LangsFolder, 0777);
        else
            array_map('unlink', glob($this->LangsFolder . '*'));

        foreach ($this->Langs as $Key => $Val) {
            Functions::Pre($Val['js'], false);
            file_put_contents($this->LangsFolder . $Key . '.json', json_encode($Val['json'], true));
            file_put_contents($this->LangsFolder . $Key . '.js', 'var lang = ' . json_encode($Val['js'], true));
        }

    }
}
