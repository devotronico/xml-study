<?php

class xml2db{
    
    //Codice test per leggere l'xml della fattura in ingresso e creare gli oggetti con relativa operazione di insert sul db
    private $url; 
    private $objDocumento;
    private $conn;
    private $sql;
    private $params;
    
    function __construct($url, $conn){
        $this->url = $url;
        $this->conn = $conn;
        
        include("../params.php");
        $this->params = $params;
        if (file_exists($this->url)) {
            $xml = file_get_contents($this->url);
            $this->objDocumento = simplexml_load_string($xml);
            
            //debug
            /*
            echo "<pre>";
            //var_dump($this->objDocumento);
            print_r($this->objDocumento);
            echo "</pre>";
            */
            $this->toSql();
        }
        
    }

    private function test(){
        print_r($obj->FatturaElettronicaHeader->DatiTrasmissione->IdTrasmittente->IdCodice);
        print_r($obj->FatturaElettronicaBody->DatiBeniServizi);
    }
    
    
    private function getIdAnagrafica() {
       
        $piva = $this->objDocumento->FatturaElettronicaHeader->CedentePrestatore->DatiAnagrafici->IdFiscaleIVA->IdCodice;
                
        //Fornitori
        $sql = "SELECT id FROM fornitori WHERE partita_iva LIKE '%$piva'";
        $result = $this->conn->query($sql);
        if($result->num_rows > 0){
            $dati = $result->fetch_assoc();
            $id = $dati['id'];
            return ['type' => 'F', 'id' => $id];
        }
        
        //Clienti
        $sql = "SELECT id FROM clienti WHERE partita_iva LIKE '%$piva'";
        $result = $this->conn->query($sql);
        if($result->num_rows > 0){
            $dati = $result->fetch_assoc();
            $id = $dati['id'];
            return ['type' => 'C', 'id' => $id];
        }
    }
    
    private function getMetodoPagamentoId(){
        
        $mp_codice_fe = $this->objDocumento->FatturaElettronicaHeader->CedentePrestatore->DatiAnagrafici->IdFiscaleIVA->IdCodice;
        
        $sql = "SELECT id FROM metodipagamento WHERE codice_fe = '$mp_codice_fe'";
        $result = $this->conn->query($sql);
        return $result->fetch_assoc()['id'];
        
    }
    
    private function getIvaId($codiceIva){
        
        $sql = "SELECT id FROM codiciiva WHERE aliquota = $codiceIva LIMIT 1";
        $result = $this->conn->query($sql);
        if($result)
            return $result->fetch_assoc()['id'];
        return 0;
    }
    
    private function getValutaFromISo($valuta_iso){
        
        return array_search($valuta_iso, $this->params['valuteIsoCode']);
    }
    
    private function getTassoCambio(){

        //Si da per scontato che la valuta sia sempre euro, quindi il tasso di cambio sia sempre 1
        //In futuro si pu� implementare qualcosa per consentire e gestire anche valute straniere ...
        return 1;
    }
    
    private function getNextCodice(){
        
        $anno = date('Y');
        $sql = "SELECT id, codice FROM ftin WHERE YEAR(dataEmissione) = " . $anno . " AND RIGHT(codice, 1) = 'E' ORDER BY id DESC LIMIT 1";
        $result = $this->conn->query($sql);
        $dati = $result->fetch_assoc();
        $codice = $dati["codice"];
        
        @list($numero,$anno,$numerazione) = @explode('/',$codice);
        $next = (int)$numero+1;
        $next .= '/' . date('y') . '/' . 'E';  
        return $next;
    }
    
    private function toSql(){
        
        $cliente = 0;
        $fornitore = 0;
        $cedentePrestatoreId = $this->getIdAnagrafica();
        if($cedentePrestatoreId['type'] == 'F')
            $fornitore = $cedentePrestatoreId['id'];
        else 
            $cliente = $cedentePrestatoreId['id'];
            
        $protocollo = $this->getNextCodice();
        $protFornitore = $this->objDocumento->FatturaElettronicaBody->DatiGenerali->DatiGeneraliDocumento->Numero;
        $dataEmissione = $this->objDocumento->FatturaElettronicaBody->DatiGenerali->DatiGeneraliDocumento->Data;
        $dataRegistrazione = 'NOW()';
        $dataScadenza = (isset($this->objDocumento->FatturaElettronicaBody->DatiPagamento->DettaglioPagamento->DataScadenzaPagamento)) ? $this->objDocumento->FatturaElettronicaBody->DatiPagamento->DettaglioPagamento->DataScadenzaPagamento : '';
        $valuta =  $this->getValutaFromISo($this->objDocumento->FatturaElettronicaBody->DatiGenerali->DatiGeneraliDocumento->Divisa);
        $pagamento = (isset($this->objDocumento->FatturaElettronicaBody->DatiPagamento)) ? $this->getMetodoPagamentoId($this->objDocumento->FatturaElettronicaBody->DatiPagamento->DettaglioPagamento->ModalitaPagamento) : 0;
        $imponibile = 0;
        $importoIva = 0;
        $totale = 0;
        $cambio = $this->getTassoCambio();
        
        //Calcola totali
        foreach($this->objDocumento->FatturaElettronicaBody->DatiBeniServizi->DatiRiepilogo as $riepilogo){
            $importoIva += (float)$riepilogo->Imposta;
            $imponibile += (float)$riepilogo->ImponibileImporto;
            //$totale = ;
        }
        $imponibileEuro = $imponibile * $cambio;
        $totaleEuro = $totale * $cambio;
        
        $sql = "INSERT INTO ftin(is_elettronica, codice, fornitore, cliente, dataEmissione, dataScadenza, dataRegistrazione, imponibile, importoIva, totale, ordine, stato, pagamento, valuta, protocollo, cambio, impoEuro, totaleEuro)
                VALUES (
                    '1',
                    '$protocollo', 
                    '$fornitore', 
                    '$cliente',
                    '$dataEmissione', 
                    '$dataScadenza', 
                    $dataRegistrazione, 
                    '$imponibile', 
                    '$importoIva', 
                    '$totale', 
                    '(0)', 
                    'ricevuta', 
                    '$pagamento', 
                    '$valuta', 
                    '$protFornitore', 
                    '$cambio', 
                    '$imponibileEuro',
                    '$totaleEuro',
                );";
            
            $this->sql = $sql; //Debug
            $this->conn->query($sql);
            $this->sql = "";
            $idFattura = $this->conn->mysql_insert_id;
            
            //Querys Rows/BeniServizi
            if(!is_null($this->objDocumento->FatturaElettronicaBody->DatiBeniServizi->DettaglioLinee)){
                foreach($this->objDocumento->FatturaElettronicaBody->DatiBeniServizi->DettaglioLinee as $row){
                    
                    $costi = 0;
                    $desc = addslashes($row->Descrizione);
                    $qt = $row->Quantita;
                    $pzu = $row->PrezzoUnitario;
                    $pzt = $row->PrezzoTotale;
                    $vat = $this->getIvaId($row->AliquotaIVA); 
                    $tot = $row->PrezzoTotale; //TO-DO Aggiungere iva 
                    
                    $sql = "INSERT INTO ftin_row(fattura, data, costo, descrizione, qt, pzu, pzt, vat, tot)
                            VALUES ('$idFattura', '$dataEmissione','$costi', '$desc', '$qt', '$pzu', '$pzt', '$vat', '$tot')";
                    
                    $this->sql .= $sql; //Debug
                    $this->conn->query($sql);
                }
                
                
            }
        
    }
    
    //Debug
    public function getSql(){
        return $this->sql;    
    }


}

include("../libreria.php");
$obj = new xml2db('../repository-doc/eftin/IT01234567890_00001.xml', $conn);
print_r($obj->getSql()); 