<?php

echo 'Test';

class FatturaElettronica{

// HEADER
// CedentePrestatore
// DatiAnagrafici
// IdFiscaleIVA
// IdPaese
// IdCodice

// BODY
// DatiGenerali
// DatiGeneraliDocumento
// TipoDocumento
// Divisa
// Data
// Numero
// Causale


private $xmlString;
private $fileURL;

/* Header */
// dati Costruttore
private $idPaese; 
private $idCodice; 

// dati di chi emette la fattura
private $CedentePrestatore;



/* Body */
private $DatiGenerale;
private $DatiBeniServizi = [];
private $DatiVeicoli = null;
private $DatiPagamento = null;
private $Allegati = null;


 
	function __construct($idPaese,$idCodice) {

    	$this->idPaese = $idPaese;
		$this->idCodice = $idCodice;
    }


    public function setHeader($cedentePrestatore){
    	$this->CedentePrestatore = $cedentePrestatore; // [head]
    }

    public function setBody($datiGenerali,$datiBeniServizi,$datiVeicoli = null,$datiPagamento = null){
    	$this->DatiGenerali = $datiGenerali; // 
    	$this->DatiBeniServizi = $datiBeniServizi; // array
    	$this->DatiVeicoli = $datiVeicoli; // 
    	$this->DatiPagamento = $datiPagamento;  // ok
    }




/**
* Dati Trasmissione To XML
* richiamata da metodo _genera
* Blocco 1.1 
* 
* @access private
* @return string $xmlString
*/
private function datiTrasmissioneToXML(){

    $xmlString = '
    <DatiTrasmissione>
          <IdTrasmittente>
            <IdPaese>' . $this->idPaese .'</IdPaese>
            <IdCodice>' . $this->idCodice . '</IdCodice>
          </IdTrasmittente>
          <ProgressivoInvio>' . $this->progressivoInvio . '</ProgressivoInvio>
          <FormatoTrasmissione>' . $this->formatoTrasmissione . '</FormatoTrasmissione>
          <CodiceDestinatario>' . $this->codiceDestinatario .'</CodiceDestinatario>';
    $xmlString .= '</DatiTrasmissione>';

    return $xmlString;
}





/**
* GENERA
* Blocco 1.1 
* Genera una stringa in formato xml
* 
* @access private
* @return string $xmlString
*/
public function genera(){


// HEADER
$this->xmlString = '<p:FatturaElettronica>';

/*Header*/
$this->xmlString .= $this->datiTrasmissioneToXML();
$this->xmlString .= $this->CedentePrestatore->toXML();
$this->xmlString .= '</FatturaElettronicaHeader>';
    

// BODY 
$this->xmlString .= '<FatturaElettronicaBody>';
$this->xmlString .= $this->DatiGenerali->toXML();
$this->xmlString .='</FatturaElettronicaBody></p:FatturaElettronica>';
}




public function view(){

    header('Content-Type: application/xml');
    $doc = new DOMDocument();
    $doc->load($this->fileURL);
    echo $doc->saveXML();
}




public function salva($url = "", $filename = null){
    
    if(strlen($this->xmlString) <= 0) 
        return false;
    /*Crea file XML da stringa*/
    $dom = new DOMDocument('1.0','utf-8');
    $dom->loadXml($this->xmlString);
    
    if(is_null($filename))
      $filename = $this->idPaese.$this->idCodice.'_'.$this->progressivoInvio.'.xml';
    $this->fileURL = $url . $filename;

    $formattedXml = new DOMDocument('1.0','utf-8');
    $formattedXml->preserveWhiteSpace = false; 
    $formattedXml->formatOutput = true; 
    $formattedXml->loadXML($dom->saveXML()); 
    $formattedXml->save($this->fileURL); 
}




}



// CEDENTE PRESTATORE Classi XML LIVELLO 1 
class CedentePrestatore extends BaseObjectToXML{

	public $DatiAnagrafici;
	public $Sede;
	public $StabileOrganizzazione;
	public $IscrizioneREA;
	public $Contatti;
	public $RiferimentoAmministrazione;

	function __construct($datiAnagrafici, $sede, $stabileOrganizzazione = null, $iscrizioneREA = null, $contatti = null, $riferimentoAmministrazione = null){

		$this->DatiAnagrafici = $datiAnagrafici;
		if(!is_null($sede) && $sede instanceof Sede)
			$this->Sede = $sede;
		if(!is_null($stabileOrganizzazione) && !$stabileOrganizzazione instanceof Sede)
			$this->StabileOrganizzazione = $stabileOrganizzazione;
		if(!is_null($iscrizioneREA) && $sede instanceof IscrizioneREA)
			$this->IscrizioneREA = $iscrizioneREA;
		$this->RiferimentoAmministrazione = $riferimentoAmministrazione;
		
	}

	public function toXML(){

		return "<CedentePrestatore>" . parent::toXML() . "</CedentePrestatore>";
	}

}




class DatiAnagrafici extends BaseObjectToXML{

	public $IdFiscaleIVA;
	public $CodiceFiscale;
	public $Anagrafica;
	public $AlboProfessionale;
	public $ProvinciaAlbo;
	public $NumeroIscrizioneAlbo;
	public $DataIscrizioneAlbo;
	public $RegimeFiscale;

	function __construct($idPaese,$idCodice,$codiceFiscale,$anagrafica,$alboProfessionale = null,$provinciaAlbo = null,$numeroIscrizioneAlbo = null,$dataIscrizioneAlbo = null,$regimeFiscale = null) {
		
		$this->IdFiscaleIVA = new IdFiscaleIVA($idPaese,$idCodice);
		$this->CodiceFiscale = $codiceFiscale;		
		if(!is_null($anagrafica) && $anagrafica instanceof Anagrafica)
			$this->Anagrafica = $anagrafica;
		$this->AlboProfessionale = $alboProfessionale;
		$this->ProvinciaAlbo = $provinciaAlbo;
		$this->NumeroIscrizioneAlbo = $numeroIscrizioneAlbo;
		$this->DataIscrizioneAlbo = $dataIscrizioneAlbo;
		$this->RegimeFiscale = $regimeFiscale;
	}
}



//Classi sottolivelli 1
class IdFiscaleIVA extends BaseObjectToXML{
	public $IdPaese;
	public $IdCodice;

	function __construct($idPaese,$idCodice){
		$this->IdPaese = $idPaese;
		$this->IdCodice = $idCodice;				
	}
}





// BODY ============ BODY ============ BODY ============
/**
 * DATI GENERALI
 * 
 */

class DatiGenerali extends BaseObjectToXML{

	public $DatiGeneraliDocumento;
	public $DatiRicezione;      //array or obj - instanceof DatiOrdineAcquisto
	public $DatiFattureCollegate; //array or obj - instanceof DatiOrdineAcquisto
	public $DatiSAL;
	public $DatiDDT;
	public $DatiTrasporto;
	public $FatturaPrincipale;

	function __construct($datiGeneraliDocumento,$datiOrdineAcquisto = null,$datiContratto = null,$datiConvenzione = null,$datiRicezione = null,$datiFattureCollegate = null,$datiSAL = null,$datiDDT = null,$datiTrasporto = null,$fatturaPrincipale = null) {
		$this->DatiGeneraliDocumento = $datiGeneraliDocumento;
		$this->DatiRicezione = $datiRicezione;
		$this->DatiFattureCollegate = $datiFattureCollegate;
		$this->DatiSAL = $datiSAL;
		$this->DatiDDT = $datiDDT;
		$this->DatiTrasporto = $datiTrasporto;
		$this->FatturaPrincipale = $fatturaPrincipale;
	}

	public function toXML(){
		return "<DatiGenerali>" . parent::toXML() . "</DatiGenerali>";
	}
}






//Classi sottolivelli 2
class DatiGeneraliDocumento extends BaseObjectToXML{
	
	public $TipoDocumento;
	public $Divisa;
	public $Data;
	public $Numero;
	public $DatiRitenuta;
	public $DatiBollo;
	public $DatiCassaPrevidenziale;
	public $ScontoMaggiorazione;
	public $ImportoTotaleDocumento;
	public $Arrotondamento;
	public $Causale;
	public $Art73;

	function __construct($tipoDocumento,$divisa,$data,$numero,$datiRitenuta = null,$datiBollo = null,$datiCassaPrevidenziale = null,$scontoMaggiorazione = null,$importoTotaleDocumento = null,$arrotondamento = null,$causale = null,$art73 = null){
		$this->TipoDocumento = $tipoDocumento;
		$this->Divisa = $divisa;
		$this->Data = $data;
		$this->Numero = $numero;
		$this->DatiRitenuta = $datiRitenuta;
		$this->DatiBollo = $datiBollo;
		$this->DatiCassaPrevidenziale = $datiCassaPrevidenziale;
		$this->ScontoMaggiorazione = $scontoMaggiorazione;
		$this->ImportoTotaleDocumento = $importoTotaleDocumento;
		$this->Arrotondamento = $arrotondamento;
		$this->Causale = new Causale($causale);
		$this->Art73 = $art73;

	}
}









/**
 * CLASSE BaseObjectToXML
 * 
 * @return string
 */
class BaseObjectToXML{

	public function toXML(){

		$xmlString = '';
		foreach($this as $tag => $value){
			if(is_null($value) || empty($value))
				continue;
			
			if(is_array($value)){
				foreach($value as $k => $v){
					$xmlString .= '<' . $tag .'>';
					$xmlString .= $v->toXML();
					$xmlString .= '</' . $tag .'>';
				}
			}
			elseif(is_object($value)){
				$xmlString .= ($value instanceof BaseObjectToXML) ? '<' . $tag .'>' : '';
				$xmlString .= $value->toXML(); 
				$xmlString .= ($value instanceof BaseObjectToXML) ? '</' . $tag .'>' : '';
			}
			else{
				$xmlString .= '<' . $tag .'>';
				$xmlString .= $value;
				$xmlString .= '</' . $tag .'>';
			}
		}
		return $xmlString;
	}
}