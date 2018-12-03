<?php 
// 945 -> class BaseObjectToXML
// DDDD
// dddd
/**
 * CLASSI
 * FatturaElettronica
 * 
 * BaseObjectToXML
 * Classi figlie di BaseObjectToXML
 * 	Classi XML LIVELLO 1 
 * 		CedentePrestatore 1.2 [Header]-> FatturaElettronica / FatturaElettronicaHeader / CedentePrestatore
 * 		RappresentanteFiscale 1.3 [!]
 * 		CessionarioCommittente 1.4 [Header]
 *  Classi SOTTOLIVELLI 1
 * 		IdFiscaleIVA [Header - Body][num.nodi 2]
 * 		Anagrafica [Header - Body][num.nodi 3]
 * 		DatiAnagrafici
 * 		Sede
 * 		IscrizioneREA
 * 		Contatti
 * 		RappresentanteFiscaleCommittente
 *	Classi XML LIVELLO 1  		
 * 		DatiGenerali
 * 		DatiBeniServizi
 * 		DatiVeicoli
 * 		DatiPagamento
 * 	Classi SOTTOLIVELLI 2
 * 		DatiGeneraliDocumento
 * 		DatiRitenuta
 * 		DatiBollo
 * 		DatiCassaPrevidenziale
 * 		Causale [non estende BaseObjectToXML]
 * 		ScontoMaggiorazione
 * 		DatiOrdineAcquisto
 * 		DatiSAL
 * 		DatiDDT
 * 		DatiTrasporto
 * 		DatiAnagraficiVettore
 * 		FatturaPrincipale
 * 		DettaglioLinee
 * 		DatiRiepilogo
 *		CodiceArticolo
 * 		AltriDatiGestionali
 * 		DettagliPagamento
 *	Utility 
 */
class FatturaElettronica {

	private $xmlString;
	private $fileURL;



	/**
	 * dati Costruttore
	 * 1.1 Dati trasmissione
	 * sono i dati di chi invia i dati
	 * fattura di invio
	 */
	private $idPaese; //1.1.1.1
	private $idCodice; //1.1.1.2
	private $progressivoInvio; //1.1.2
	private $formatoTrasmissione; //1.1.3
	private $codiceDestinatario; //1.1.4
	private $PECDestinatario; //1.1.6



	/* Header */
	private $CedentePrestatore;
	private $RappresentanteFiscale = null;
	private $CessionarioComittente;
	private $TerzoIntermediarioOSoggettoEmittente = null;
	private $SoggettoEmittente = null;



	/* Body */
	private $DatiGenerale;
	private $DatiBeniServizi = [];
	private $DatiVeicoli = null;
	private $DatiPagamento = null;
	private $Allegati = null;





	// valori gestito dalla classe DatiAnagrafici
	public static $regimeFiscale = [
		"RF01" => "Ordinario",
		"RF02" => "Contribuenti minimi (art. 1, c.96-117, L. 244/2007)",
		"RF04" => "Agricoltura e attività connesse e pesca (artt. 34 e 34-bis, D.P.R. 633/1972)",
		"RF05" => "Vendita sali e tabacchi (art. 74, c.1, D.P.R. 633/1972)",
		"RF06" => "Commercio dei fiammiferi (art. 74, c.1, D.P.R. 633/1972)",
		"RF07" => "Editoria (art. 74, c.1, D.P.R. 633/1972)",
		"RF08" => "Gestione di servizi di telefonia pubblica (art. 74, c.1, D.P.R. 633/1972)",
		"RF09" => "Rivendita di documenti di trasporto pubblico e di sosta (art. 74, c.1, D.P.R. 633/1972)",
		"RF10" => "Intrattenimenti, giochi e altre attività di cui alla tariffa allegata al D.P.R. n. 640/72 (art. 74, c.6, D.P.R. 633/1972)",
		"RF11" => "Agenzie di viaggi e turismo (art. 74-ter, D.P.R. 633/1972)",
		"RF12" => "Agriturismo (art. 5, c.2, L. 413/1991)",
		"RF13" => "Vendite a domicilio (art. 25-bis, c.6, D.P.R. 600/1973)",
		"RF14" => "Rivendita di beni usati, di oggetti d’arte, d’antiquariato o da collezione (art. 36, D.L. 41/1995)",
		"RF15" => "Agenzie di vendite all’asta di oggetti d’arte, antiquariato, o da collezione (art. 40-bis, D.L. 41/1995)",
		"RF16" => "IVA per cassa P.A. (art. 6, c.5, D.P.R. 633/1972)",
		"RF17" => "IVA per cassa (art. 32-bis, D.L. 83/2012)",
		"RF18" => "Altro",
		"RF19" => "Forfettario (art.1, c. 54-89, L. 190/2014)"
	];



	// valori gestito dalla classe DatiCassaPrevidenziale
	public static $tipoCassa = [
		"TC01" => "Cassa Nazionale Previdenza e Assistenza Avvocati e Procuratori Legali",
		"TC02" => "Cassa Previdenza Dottori Commercialisti",
		"TC03" => "Cassa Previdenza e Assistenza Geometri",
		"TC04" => "Cassa Nazionale Previdenza e Assistenza Ingegneri e Architetti Liberi Professionisti",
		"TC05" => "Cassa Nazionale del Notariato",
		"TC06" => "Cassa Nazionale Previdenza e Assistenza Ragionieri e Periti Commerciali",
		"TC07" => "Ente Nazionale Assistenza Agenti e Rappresentanti di Commercio (ENASARCO)",
		"TC08" => "Ente Nazionale Previdenza e Assistenza Consulenti del Lavoro (ENPACL)",
		"TC09" => "Ente Nazionale Previdenza e Assistenza Medici (ENPAM)",
		"TC10" => "Ente Nazionale Previdenza e Assistenza Farmacisti (ENPAF)",
		"TC11" => "Ente Nazionale Previdenza e Assistenza Veterinari (ENPAV)",
		"TC12" => "Ente Nazionale Previdenza e Assistenza Impiegati dell'Agricoltura (ENPAIA)",
		"TC13" => "Fondo Previdenza Impiegati Imprese di Spedizione e Agenzie Marittime",
		"TC14" => "Istituto Nazionale Previdenza Giornalisti Italiani (INPGI)",
		"TC15" => "Opera Nazionale Assistenza Orfani Sanitari Italiani (ONAOSI)",
		"TC16" => "Cassa Autonoma Assistenza Integrativa Giornalisti Italiani (CASAGIT)",
		"TC17" => "Ente Previdenza Periti Industriali e Periti Industriali Laureati (EPPI)",
		"TC18" => "Ente Previdenza e Assistenza Pluricategoriale (EPAP)",
		"TC19" => "Ente Nazionale Previdenza e Assistenza Biologi (ENPAB)",
		"TC20" => "Ente Nazionale Previdenza e Assistenza Professione Infermieristica (ENPAPI)",
		"TC21" => "Ente Nazionale Previdenza e Assistenza Psicologi (ENPAP)",
		"TC22" => "INPS"
	];

	// valori gestito dalla classe DettagliPagamento
	public static $modalitaPagamento = [
		"MP01" => "contanti",
		"MP02" => "assegno",
		"MP03" => "assegno circolare",
		"MP04" => "contanti presso Tesoreria",
		"MP05" => "bonifico",
		"MP06" => "vaglia cambiario",
		"MP07" => "bollettino bancario",
		"MP08" => "carta di pagamento",
		"MP09" => "RID",
		"MP10" => "RID utenze",
		"MP11" => "RID veloce",
		"MP12" => "Riba",
		"MP13" => "MAV",
		"MP14" => "quietanza erario stato",
		"MP15" => "giroconto su conti di contabilità speciale",
		"MP16" => "domiciliazione bancaria",
		"MP17" => "domiciliazione postale",
		"MP18" => "bollettino di c/c postale",
		"MP19" => "SEPA Direct Debit",
		"MP20" => "SEPA Direct Debit CORE",
		"MP21" => "SEPA Direct Debit B2B",
		"MP22" => "Trattenuta su somme già riscosse"
	];

	// valori gestiti dalla classe DatiGeneraliDocumento
	public static $tipoDocumento = [
		"TD01" => "Fattura",
		"TD02" => "Acconto/Anticipo su fattura",
		"TD03" => "Acconto/Anticipo su parcella",
		"TD04" => "Nota di Credito",
		"TD05" => "Nota di Debito",
		"TD06" => "Parcella"
	];

	// valori gestiti dalle classi [DatiCassaPrevidenziale, DettaglioLinee, DatiRiepilogo]
	public static $natura = [
		"N1" => "escluse ex art.15",
		"N2" => "non soggette",
		"N3" => "non imponibili",
		"N4" => "esenti",
		"N5" => "regime del margine / IVA non esposta in fattura",
		"N6" => "inversione contabile (per le operazioni in reverse charge ovvero nei casi di autofatturazione per acquisti extra UE di servizi ovvero per importazioni di beni nei soli casi previsti)",
		"N7" => "IVA assolta in altro stato UE (vendite a distanza ex art. 40 commi 3 e 4 e art. 41 comma 1 lett. b, DL 331/93; prestazione di servizi di telecomunicazioni, teleradiodiffusione ed elettronici ex art. 7-sexies lett. f, g, DPR 633/72 e art. 74-sexies, DPR 633/72)"
	];

	function __construct($idPaese,$idCodice,$progressivoInvio,$formatoTrasmissione,$codiceDestinatario,$PECDestinatario = null) {
    	$this->idPaese = $idPaese;
		$this->idCodice = $idCodice;
		$this->progressivoInvio = $progressivoInvio;
		$this->formatoTrasmissione = $formatoTrasmissione;
		$this->codiceDestinatario = $codiceDestinatario;

		if($codiceDestinatario = '0000000' && $codiceDestinatario = '000000')
			$this->PECDestinatario = $PECDestinatario;
    }

    public function setHeader($cedentePrestatore,$rappresentanteFiscale,$cessionarioCommittente,$terzoIntermediarioOSoggettoEmittente = null,$soggettoEmittente = 'CC'){
    	$this->CedentePrestatore = $cedentePrestatore;
    	$this->RappresentanteFiscale = $rappresentanteFiscale;
    	$this->CessionarioCommittente = $cessionarioCommittente;
    	$this->TerzoIntermediarioOSoggettoEmittente = $terzoIntermediarioOSoggettoEmittente;
    	$this->SoggettoEmittente = $soggettoEmittente;
    }

    public function setBody($datiGenerali,$datiBeniServizi,$datiVeicoli = null,$datiPagamento = null){
    	$this->DatiGenerali = $datiGenerali;
    	$this->DatiBeniServizi = $datiBeniServizi;
    	$this->DatiVeicoli = $datiVeicoli;
    	$this->DatiPagamento = $datiPagamento;
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
      		if($this->PECDestinatario)
      			$xmlString .= '
      		<PECDestinatario>' . $this->PECDestinatario . '</PECDestinatario>';
	  
	  		if(!empty($this->DT_telefono) || !empty($this->DT_email)){
      			$xmlString .= 
      		'<ContattiTrasmittente>';
      			if($this->DT_telefono)
	      			$xmlString .= 
	      		'<Telefono>' . $this->DT_telefono . '</Telefono>';
  				if($this->DT_email)
	      			$xmlString .= 
	      		'<Email>' . $this->DT_telefono . '</Email>';
  				$xmlString .= 
  			'</ContattiTrasmittente>';
      		}
    		$xmlString .= '
    	</DatiTrasmissione>';

    	return $xmlString;
	}





/**
* GENERA
* Blocco 1.1 
* 
* @access private
* @return void
*/
public function genera(){

$this->xmlString = '<?xml version="1.0" encoding="UTF-8"?>
<p:FatturaElettronica versione="' . $this->formatoTrasmissione . '" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
xmlns:p="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xsi:schemaLocation="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2 http://www.fatturapa.gov.it/export/fatturazione/sdi/fatturapa/v1.2/Schema_del_file_xml_FatturaPA_versione_1.2.xsd">
	<FatturaElettronicaHeader>';
		/*Header*/
		$this->xmlString .= $this->datiTrasmissioneToXML();
		$this->xmlString .= $this->CedentePrestatore->toXML();
		if(!is_null($this->RappresentanteFiscale))
			$this->xmlString .= $RappresentanteFiscale->toXML();	
		$this->xmlString .= $this->CessionarioCommittente->toXML();
		
    $this->xmlString .=
    	'</FatturaElettronicaHeader>
  		<FatturaElettronicaBody>';
  		
  		/*Body*/
		$this->xmlString .= $this->DatiGenerali->toXML();
		$this->xmlString .= $this->DatiBeniServizi->toXML();
		if(!is_null($this->DatiVeicoli))
			$this->xmlString .= $this->DatiVeicoli->toXML();
		if(!is_null($this->DatiPagamento))
			$this->xmlString .= $this->DatiPagamento->toXML();
		
    		
	$this->xmlString .='
  		</FatturaElettronicaBody>
	</p:FatturaElettronica>';
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

} // chiude Classe FatturaElettronica






//Classi XML LIVELLO 1 
//1.2
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



//1.3 
class RappresentanteFiscale extends BaseObjectToXML{

	public $DatiAnagrafici;
	
	function __construct($datiAnagrafici){

		$this->DatiAnagrafici = $datiAnagrafici;
		
	}

	public function toXML(){

		return "<RappresentanteFiscale>" . parent::toXML() . "</RappresentanteFiscale>";
	}

}

//1.4
class CessionarioCommittente extends BaseObjectToXML{

	public $DatiAnagrafici;
	public $Sede;
	public $StabileOrganizzazione;
	public $RappresentanteFiscale;

	function __construct($datiAnagrafici,$sede,$stabileOrganizzazione = null, $rappresentanteFiscale = null){

		$this->DatiAnagrafici = $datiAnagrafici;
		if(!is_null($sede) && $sede instanceof Sede)
			$this->Sede = $sede;
		if(!is_null($stabileOrganizzazione) && !$stabileOrganizzazione instanceof Sede)
			$this->StabileOrganizzazione = $stabileOrganizzazione;
		if(!is_null($rappresentanteFiscale) && $rappresentanteFiscale instanceof RappresentanteFiscale)
			$this->RappresentanteFiscale = $rappresentanteFiscale;
		
	}

	public function toXML(){
		return "<CessionarioCommittente>" . parent::toXML() . "</CessionarioCommittente>";
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

class Anagrafica extends BaseObjectToXML{

	public $Denominazione;
	public $Nome;
	public $Cognome;
	public $Titolo;
	public $CodEORI;

	function __construct($denominazione,$nome = null,$cognome = null,$titolo = null, $codEORI = null) {
		$this->Denominazione = $denominazione;
		if(empty($this->Denominazione)){
			$this->Nome = $nome;			
			$this->Cognome = $cognome;			
		}
		$this->Titolo = $titolo;
		$this->CodEORI = $codEORI;
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

class Sede extends BaseObjectToXML{

	public $Indirizzo;
	public $NumeroCivico;
	public $CAP;
	public $Comune;
	public $Provincia;
	public $Nazione;

	function __construct($indirizzo,$numeroCivico,$CAP,$comune,$provincia,$nazione) {
		$this->Indirizzo = $indirizzo;
		$this->NumeroCivico = $numeroCivico;
		$this->CAP = $CAP;
		$this->Comune = $comune;
		$this->Provincia = $provincia;
		$this->Nazione = $nazione;
	}
}

class IscrizioneREA extends BaseObjectToXML{

	public $Ufficio;
	public $NumeroREA;
	public $CapitaleSociale;
	public $SocioUnico;
	public $StatoLiquidazione;

	function __construct($ufficio,$numeroREA,$capitaleSociale,$socioUnico,$statoLiquidazione) {
		
		$this->Ufficio = $ufficio;
		$this->NumeroREA = $numeroREA;
		$this->CapitaleSociale = $capitaleSociale;
		$this->SocioUnico = $socioUnico;
		$this->StatoLiquidazione = $statoLiquidazione;
	}
}

class Contatti extends BaseObjectToXML{

	public $Telefono;
	public $Fax;
	public $Email;

	function __construct($telefono,$fax,$email) {
		
		$this->Telefono = $telefono;
		$this->Fax = $fax;
		$this->Email = $email;
	}

}

class RappresentanteFiscaleCommittente extends BaseObjectToXML{

	public $IdFiscaleIVA;
	public $Denominazione;
	public $Nome;
	public $Cognome;

	function __construct($idPaese,$idCodice,$denominazione,$nome = null,$cognome = null) {
		$this->IdFiscaleIVA = new IdFiscaleIVA($idPaese,$idCodice);
		$this->Denominazione = $denominazione;
		if(empty($this->Denominazione)){
			$this->Nome = $nome;			
			$this->Cognome = $cognome;			
		}		
	}

}

//Classi XML LIVELLO 2 
//2.1
class DatiGenerali extends BaseObjectToXML{

	public $DatiGeneraliDocumento;
	public $DatiOrdineAcquisto; //array or obj; 
	public $DatiContratto; //array or obj - instanceof DatiOrdineAcquisto
	public $DatiConvenzione; //array or obj - instanceof DatiOrdineAcquisto
	public $DatiRicezione; //array or obj - instanceof DatiOrdineAcquisto
	public $DatiFattureCollegate; //array or obj - instanceof DatiOrdineAcquisto
	public $DatiSAL;
	public $DatiDDT;
	public $DatiTrasporto;
	public $FatturaPrincipale;

	function __construct($datiGeneraliDocumento,$datiOrdineAcquisto = null,$datiContratto = null,$datiConvenzione = null,$datiRicezione = null,$datiFattureCollegate = null,$datiSAL = null,$datiDDT = null,$datiTrasporto = null,$fatturaPrincipale = null) {
		$this->DatiGeneraliDocumento = $datiGeneraliDocumento;
		$this->DatiOrdineAcquisto = $datiOrdineAcquisto;
		$this->DatiContratto = $datiContratto;
		$this->DatiConvenzione = $datiConvenzione;
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

//2.2
class DatiBeniServizi extends BaseObjectToXML{

	public $DettaglioLinee; //array or obj
	public $DatiRiepilogo; //array or obj

	function __construct($dettaglioLinee,$datiRiepilogo = null){
		$this->DettaglioLinee = $dettaglioLinee;

		//Genera DatiRiepilogo in automatico se non specificati
		if(!is_null($datiRiepilogo))		
			$this->DatiRiepilogo = $datiRiepilogo;
		else{
			$this->generaDatiRiepilogo();
		} 
	}

	public function toXML(){
		return "<DatiBeniServizi>" . parent::toXML() . "</DatiBeniServizi>";
	}	

	private function generaDatiRiepilogo(){

		$totale = 0;
		$totali_imponibili_aliquote = [];
		$dettaglioLinee = [];
		if(!is_array($this->DettaglioLinee))
			$dettaglioLinee[] = $this->DettaglioLinee;
		else 
			$dettaglioLinee = $this->DettaglioLinee;

		foreach($dettaglioLinee as $linea){
	  		if(array_key_exists($linea->AliquotaIVA, $totali_imponibili_aliquote))
	      		$totali_imponibili_aliquote[$linea->AliquotaIVA] += (float)$linea->PrezzoTotale;
	      	else 
	      		$totali_imponibili_aliquote[$linea->AliquotaIVA] = (float)$linea->PrezzoTotale;
	    }

		//Dati Riepilogo
		$datiRiepilogo = [];
		foreach($totali_imponibili_aliquote as $aliquota => $imponibile){
		  $totale = Utility::calcolaIva((float)$imponibile,(float)$aliquota);
		  $imposta = $totale - $imponibile;
		  
		  $datiRiepilogo[] = new DatiRiepilogo(
		  			number_format((float)$aliquota,'2','.',''),
		  			null,
		  			null,
		  			null,
		  			number_format((float)$imponibile,'2','.',''),
	  				number_format((float)$imposta,'2','.','')
		 		);
		}

		$this->DatiRiepilogo = $datiRiepilogo;
	}


}

//2.3
class DatiVeicoli extends BaseObjectToXML{

	public $Data; 
	public $TotalePercorso; 

	function __construct($data,$totalePercorso){
		$this->Data = $data;
		$this->TotalePercorso = $totalePercorso;
	}

	public function toXML(){
		return "<DatiVeicoli>" . parent::toXML() . "</DatiVeicoli>";
	}	
}

//2.4
class DatiPagamento extends BaseObjectToXML{

	public $CondizioniPagamento; 
	public $DettagliPagamento; 

	function __construct($condizioniPagamento,$dettaglioPagamento){
		$this->CondizioniPagamento = $condizioniPagamento;
		$this->DettaglioPagamento = $dettaglioPagamento;
	}

	public function toXML(){
		return "<DatiPagamento>" . parent::toXML() . "</DatiPagamento>";
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



class DatiRitenuta extends BaseObjectToXML{

	public $TipoRitenuta;
	public $ImportoRitenuta;
	public $AliquotaRitenuta;
	public $CausalePagamento;

	function __construct($tipoRitenuta,$importoRitenuta,$aliquotaRitenuta,$causalePagamento){
		
		$this->TipoRitenuta = $tipoRitenuta;
		$this->ImportoRitenuta = $importoRitenuta;
		$this->AliquotaRitenuta = $aliquotaRitenuta;
		$this->CausalePagamento = $causalePagamento;

	}
}

class DatiBollo extends BaseObjectToXML{

	public $BolloVirtuale;
	public $ImportoBollo;

	function __construct($bolloVirtuale,$importoBollo){
		
		$this->BolloVirtuale = $bolloVirtuale;
		$this->ImportoBollo = $importoBollo;
	}
}

class DatiCassaPrevidenziale extends BaseObjectToXML{

	public $TipoCassa;
	public $AlCassa;
	public $ImportoContributoCassa;
	public $ImponibileCassa;
	public $AliquotaIVA;
	public $Ritenuta;
	public $Natura;
	public $RiferimentoAmministrazione;

	function __construct($tipoCassa,$alCassa,$importoContributoCassa,$imponibileCassa,$aliquotaIVA,$ritenuta,$natura,$riferimentoAmministrazione){
		$this->TipoCassa = $tipoCassa;
		$this->AlCassa = $alCassa;
		$this->ImportoContributoCassa = $importoContributoCassa;
		$this->ImponibileCassa = $imponibileCassa;
		$this->AliquotaIVA = $aliquotaIVA;
		$this->Ritenuta = $ritenuta;
		$this->Natura = $natura;
		$this->RiferimentoAmministrazione = $riferimentoAmministrazione;		
	}

}

class Causale{
	private $Causale;

	function __construct($causale){
		$this->Causale = $causale;
	}

	public function toXML(){
		if(!is_null($this->Causale))
			return Utility::splitTagXML('Causale',$this->Causale,200);
	}

}

class ScontoMaggiorazione extends BaseObjectToXML{

	public $Tipo;
	public $Percentuale;
	public $Importo;

	function __construct($tipo,$percentuale,$importo){
		$this->Tipo = $tipo;
		$this->Percentuale = number_format((float)$percentuale,'2','.','');
		$this->Importo = number_format((float)$importo,'2','.','');
	}
	
}

class DatiOrdineAcquisto extends BaseObjectToXML{

	public $RiferimentoNumeroLinea;
	public $IdDocumento;
	public $Data;
	public $NumItem;
	public $CodiceCommessaConvenzione;
	public $CodiceCUP;
	public $CodiceCIG;

	function __construct($riferimentoNumeroLinea= null,$idDocumento,$data = null,$numItem = null,$codiceCommessaConvenzione = null,$codiceCUP = null,$codiceCIG = null){
		$this->RiferimentoNumeroLinea = $riferimentoNumeroLinea;
		$this->IdDocumento = $idDocumento;
		$this->Data = $data;
		$this->NumItem = $numItem;
		$this->CodiceCommessaConvenzione = $codiceCommessaConvenzione;
		$this->CodiceCUP = $codiceCUP;
		$this->CodiceCIG = $codiceCIG;
	}

}

class DatiSAL extends BaseObjectToXML{

	public $RiferimentoFase;

	function __construct($riferimentoFase){
		$this->RiferimentoFase = $RiferimentoFase;
	}

}

class DatiDDT extends BaseObjectToXML{

	public $NumeroDDT;
	public $DataDDT;
	public $RiferimentoNumeroLinea;

	function __construct($numeroDDT,$dataDDT,$riferimentoNumeroLinea){
		$this->NumeroDDT = $numeroDDT;
		$this->DataDDT = $dataDDT;
		$this->RiferimentoNumeroLinea = $riferimentoNumeroLinea;	
	}
	
}

class DatiTrasporto extends BaseObjectToXML{

	public $DatiAnagraficiVettore;
	public $MezzoTrasporto;
	public $CausaleTrasporto;
	public $NumeroColli;
	public $Descrizione;
	public $UnitaMisuraPeso;
	public $PesoLordo;
	public $PesoNetto;
	public $DataOraRitiro;
	public $DataInizioTrasporto;
	public $TipoResa;
	public $IndirizzoResa; //instanceof Sede
	public $DataOraConsegna;

	function __construct($datiAnagraficiVettore,$mezzoTrasporto,$causaleTrasporto,$numeroColli,$descrizione,$unitaMisuraPeso,$pesoLordo,$pesoNetto,$dataOraRitiro,$dataInizioTrasporto,$tipoResa,$indirizzoResa,$dataOraConsegna){
		$this->DatiAnagraficiVettore = $datiAnagraficiVettore;
		$this->MezzoTrasporto = $mezzoTrasporto;
		$this->CausaleTrasporto = $causaleTrasporto;
		$this->NumeroColli = $numeroColli;
		$this->Descrizione = $descrizione;
		$this->UnitaMisuraPeso = $unitaMisuraPeso;
		$this->PesoLordo = $pesoLordo;
		$this->PesoNetto = $pesoNetto;
		$this->DataOraRitiro = $dataOraRitiro;
		$this->DataInizioTrasporto = $dataInizioTrasporto;
		$this->TipoResa = $tipoResa;
		$this->IndirizzoResa = $indirizzoResa;
		$this->DataOraConsegna = $dataOraConsegna;
	}
	
}

class DatiAnagraficiVettore extends BaseObjectToXML{

	public $IdFiscaleIVA;
	public $CodiceFiscale;
	public $Anagrafica; //instanceof Anagrafica
	public $NumeroLicenzaGuida;

	function __construct($idFiscaleIVA,$codiceFiscale,$anagrafica,$numeroLicenzaGuida){
		$this->IdFiscaleIVA = $idFiscaleIVA;
		$this->CodiceFiscale = $codiceFiscale;
		$this->Anagrafica = $anagrafica;
		$this->NumeroLicenzaGuida = $numeroLicenzaGuida;
	}
	
}

class FatturaPrincipale extends BaseObjectToXML{

	public $NumeroFatturaPrincipale;
	public $DataFatturaPrincipale;

	function __construct($numeroFatturaPrincipale,$dataFatturaPrincipale){
		$this->NumeroFatturaPrincipale = $numeroFatturaPrincipale;
		$this->DataFatturaPrincipale = $dataFatturaPrincipale;
	}
	
}

class DettaglioLinee extends BaseObjectToXML{

	public $NumeroLinea;
	public $TipoCessionePrestazione;
	public $CodiceArticolo; //array or obj
	public $Descrizione;
	public $Quantita;
	public $UnitaMisura;
	public $DataInizioPeriodo;
	public $DataFinePeriodo;
	public $PrezzoUnitario;
	public $ScontoMaggiorazione; //array or obj
	public $PrezzoTotale;
	public $AliquotaIVA;
	public $Ritenuta;
	public $Natura;
	public $RiferimentoAmministrazione;
	public $AltriDatiGestionali; //array or obj

	function __construct($numeroLinea,$tipoCessionePrestazione = null,$codiceArticolo = null,$descrizione,$quantita = null,$unitaMisura = null,$dataInizioPeriodo = null,$dataFinePeriodo = null,$prezzoUnitario,$scontoMaggiorazione = null,$prezzoTotale,$aliquotaIVA,$ritenuta = null,$natura = null,$riferimentoAmministrazione = null,$altriDatiGestionali = null){

		$this->NumeroLinea = $numeroLinea;
		$this->TipoCessionePrestazione = $tipoCessionePrestazione;
		$this->CodiceArticolo = $codiceArticolo; //array or obj
		$this->Descrizione = $descrizione;
		$this->Quantita = number_format((float)$quantita,'2','.','');
		$this->UnitaMisura = $unitaMisura;
		$this->DataInizioPeriodo = $dataInizioPeriodo;
		$this->DataFinePeriodo = $dataFinePeriodo;
		$this->PrezzoUnitario = number_format((float)$prezzoUnitario,'2','.','');
		$this->ScontoMaggiorazione = $scontoMaggiorazione; //array or obj
		$this->PrezzoTotale = number_format((float)$prezzoTotale,'2','.','');
		$this->AliquotaIVA = number_format((float)$aliquotaIVA,'2','.','');
		$this->Ritenuta = $ritenuta;
		$this->Natura = $natura;
		$this->RiferimentoAmministrazione = $riferimentoAmministrazione;
		$this->AltriDatiGestionali = $altriDatiGestionali; //array or obj
	}

}

class DatiRiepilogo extends BaseObjectToXML{

	public $AliquotaIVA;
	public $Natura;
	public $SpeseAccessorie;
	public $Arrotondamento;
	public $ImponibileImporto;
	public $Imposta;
	public $EsigibilitaIVA;
	public $RiferimentoNormativo;
	
	function __construct($aliquotaIVA,$natura = null,$speseAccessorie = null,$arrotondamento = null,$imponibileImporto,$imposta,$esigibilitaIVA = null,$riferimentoNormativo = null){

		$this->AliquotaIVA = $aliquotaIVA;
		$this->Natura = $natura;
		$this->SpeseAccessorie = $speseAccessorie;
		$this->Arrotondamento = $arrotondamento;
		$this->ImponibileImporto = $imponibileImporto;
		$this->Imposta = $imposta;
		$this->EsigibilitaIVA = $esigibilitaIVA;
		$this->RiferimentoNormativo = $riferimentoNormativo;
	}	

}

class CodiceArticolo extends BaseObjectToXML{

	public $CodiceTipo;
	public $CodiceValore;

	function __construct($codiceTipo,$codiceValore){
		$this->CodiceTipo = $codiceTipo;
		$this->CodiceValore = $codiceValore;
	}

}  

class AltriDatiGestionali extends BaseObjectToXML{

	public $TipoDato;
	public $RiferimentoTesto;
	public $RiferimentoNumero;
	public $RiferimentoData;

	function __construct($tipoDato,$riferimentoTesto,$riferimentoNumero,$riferimentoData){
		$this->TipoDato = $tipoDato;
		$this->RiferimentoTesto = $riferimentoTesto;
		$this->RiferimentoNumero = $riferimentoNumero;
		$this->RiferimentoData = $riferimentoData;

	}

}  

class DettagliPagamento extends BaseObjectToXML{

	public $Beneficiario; 
	public $ModalitaPagamento;
	public $DataRiferimentoTerminiPagamento;
	public $GiorniTerminiPagamento; 
	public $DataScadenzaPagamento;
	public $ImportoPagamento;
	public $CodUfficioPostale;
	public $CognomeQuietanzante;
	public $NomeQuietanzante;
	public $CFQuietanzante;
	public $TitoloQuietanzante;
	public $IstitutoFinanziario;
	public $IBAN;
	public $ABI;
	public $CAB;
	public $BIC;
	public $ScontoPagamentoAnticipato;
	public $DataLimitePagamentoAnticipato;
	public $PenalitaPagamentiRitardati;
	public $DataDecorrenzaPenale;
	public $CodicePagamento;

	function __construct($beneficiario = null,$modalitaPagamento,$dataRiferimentoTerminiPagamento = null,$giorniTerminiPagamento = null,$dataScadenzaPagamento = null,$importoPagamento = null,$codUfficioPostale = null,$cognomeQuietanzante = null,$nomeQuietanzante = null,$CFQuietanzante = null,$titoloQuietanzante = null,$istitutoFinanziario,$IBAN = null,$ABI = null,$CAB = null,$BIC = null,$scontoPagamentoAnticipato = null,$dataLimitePagamentoAnticipato = null,$penalitaPagamentiRitardati = null,$dataDecorrenzaPenale = null,$codicePagamento = null){

		$this->Beneficiario = $beneficiario; 
		$this->ModalitaPagamento = $modalitaPagamento;
		$this->DataRiferimentoTerminiPagamento = $dataRiferimentoTerminiPagamento;
		$this->GiorniTerminiPagamento = $giorniTerminiPagamento; 
		$this->DataScadenzaPagamento = $dataScadenzaPagamento;
		$this->ImportoPagamento = $importoPagamento;
		$this->CodUfficioPostale = $codUfficioPostale;
		$this->CognomeQuietanzante = $cognomeQuietanzante;
		$this->NomeQuietanzante = $nomeQuietanzante;
		$this->CFQuietanzante = $CFQuietanzante;
		$this->TitoloQuietanzante = $titoloQuietanzante;
		$this->IstitutoFinanziario = $istitutoFinanziario;
		$this->IBAN = $IBAN;
		$this->ABI = $ABI;
		$this->CAB = $CAB;
		$this->BIC = $BIC;
		$this->ScontoPagamentoAnticipato = $scontoPagamentoAnticipato;
		$this->DataLimitePagamentoAnticipato = $dataLimitePagamentoAnticipato;
		$this->PenalitaPagamentiRitardati = $penalitaPagamentiRitardati;
		$this->DataDecorrenzaPenale = $dataDecorrenzaPenale;
		$this->CodicePagamento = $CodicePagamento;
	}

}

/**
 * CLASSE BaseObjectToXML
 * 
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


//Classe Utilita
class Utility{

	public static function calcolaIva($imponibile,$aliquota){
		return $imponibile + (($imponibile/100)*$aliquota);
	}

	public static function scorporaIva($totale,$aliquota){
		return ($totale / (100+$aliquota)) * 100;
	}

	public static function splitTagArray($value,$nchars){

		$returnArray = [];
		$valueArray = str_split($value, $nchars);
		foreach($valueArray as $v){
			$stringXml .= "<" . $tag . ">" . addslashes($v) . "</" . $tag . ">";
		}
		return $returnArray;
	}

	public static function splitTagXML($tag,$value,$nchars){

		$stringXml = "";
		$valueArray = str_split($value, $nchars);
		foreach($valueArray as $v){
			$stringXml .= "<" . $tag . ">" . addslashes($v) . "</" . $tag . ">";
		}
		return $stringXml;
	}
}



/*

die( $ );
die( '' );
var_dump( $ );
echo '<pre>';print_r( $ );
if ( isset( $ )) { var_dump( $ ); echo '<pre>';print_r( $ ); die(); }

$test = "";
if ( is_null( $var )) {$test .= "null, ";}
if ( isset( $var )) { $test .= "settata, "; }
if ( !$var ) {$test .= "false, ";} 
if ( empty( $var )) {$test .= "empty, ";}
echo $test;

*/


/**
 * Get photo from blog author
 * 
 * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id volutpat 
 * orci. Etiam pharetra eget turpis non ultrices. Pellentesque vitae risus 
 * sagittis, vehicula massa eget, tincidunt ligula.
 *
 * @access private
 * @author Firstname Lastname
 * @global object $post
 * @param int $id Author ID
 * @param string $type Type of photo
 * @param int $width Photo width in px
 * @param int $height Photo height in px
 * @return object Photo
 */


?>