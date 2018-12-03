<?php 

function indirizzoFull($via,$ncivico,$cap,$comune,$provincia,$nazione){
    
    $indirizzo = $via;
    if(!empty($ncivico))
        $indirizzo .= ', '. $ncivico;
        $indirizzo .= ' - ' . $cap;
        $indirizzo .= ' ' . $comune;
        if(!empty($provincia))
            $indirizzo .= ' (' . $provincia . ')';
            $indirizzo .= ' - ' . $nazione;
            
            return str_replace("'", "\'", $indirizzo);
}

?>