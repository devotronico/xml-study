<?php





class Causale extends BaseObjectToXML {

    protected $causale;

    public function __construct($testo) {
      //  return $causale;
        $this->casuale = $testo;
    }

    public function toXML() {

        return $this->casuale;
    }

}




class Figlio extends BaseObjectToXML {

    protected $name;
    protected $last;
    protected $address = array();
    protected $Causale;
    //protected $colors = [];

    public function __construct($name, $last, array $address, $causale) {
    // public function __construct($name, $last, array $address, $causale, $colors) {

        $this->name = $name;
        $this->last = $last;
        $this->address = $address;
        $this->Causale = new Causale($causale);
       // $this->colors = $colors;
    }
 
    public function getThis() {

        return $this;
    }

    public function toXML() {

        return "<box>" . parent::toXML() . "</box>";
    }

}

class BaseObjectToXML {

	public function toXML(){

		$xmlString = '';
		foreach($this as $tag => $value){

			if(is_null($value) || empty($value))
				continue;
			
			if(is_array($value)){
				foreach($value as $k => $v){
                   // var_dump($v); die();
					$xmlString .= '<' . $k .'>';
					$xmlString .= $v;
					// $xmlString .= $v->toXML();
					$xmlString .= '</' . $k .'>';
				}
			}
			elseif(is_object($value)){
                //var_dump($value instanceof BaseObjectToXML); die();
                //  var_dump($value); die();
				$xmlString .= ($value instanceof BaseObjectToXML) ? '<' . $tag .'>' : '';
				$xmlString .= $value->toXML(); 
				$xmlString .= ($value instanceof BaseObjectToXML) ? '</' . $tag .'>' : '';
			}
			else {
				$xmlString .= '<' . $tag .'>';
				$xmlString .= $value;
				$xmlString .= '</' . $tag .'>';
			}
		}
		return $xmlString;
	}
}


$inst = new Figlio('Daniele', 'Manzi', ["via"=>"Sepe", "civico"=>"3", "città"=>"Nola"], 'Descrizione');
$x = $inst->toXML();

//$y =  $inst->getThis();
//echo '<pre>';print_r( $y );
//var_dump($x);
//echo '<pre>';print_r( $x );
echo $x;




