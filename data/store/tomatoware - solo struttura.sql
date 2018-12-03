-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 26, 2018 alle 12:45
-- Versione del server: 10.1.33-MariaDB
-- Versione PHP: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tomatoware`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `areageografica`
--

CREATE TABLE `areageografica` (
  `id` int(11) NOT NULL,
  `paese` text NOT NULL,
  `codice_iso` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `assegni`
--

CREATE TABLE `assegni` (
  `id` int(11) NOT NULL,
  `numero` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` int(11) NOT NULL,
  `importo` float NOT NULL,
  `dataEmissione` date NOT NULL,
  `beneficiario` int(11) NOT NULL,
  `dataIncasso` date NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `buste_paga`
--

CREATE TABLE `buste_paga` (
  `id` int(11) NOT NULL,
  `dipendente` int(11) NOT NULL,
  `dataElaborazione` date NOT NULL,
  `mese` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `competenze` float NOT NULL,
  `trattenute` float NOT NULL,
  `netta` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `carnet`
--

CREATE TABLE `carnet` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `dataRitiro` date NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classeimballaggio`
--

CREATE TABLE `classeimballaggio` (
  `id` int(11) NOT NULL,
  `classe` text NOT NULL,
  `formula` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `classeprodotto`
--

CREATE TABLE `classeprodotto` (
  `id` int(11) NOT NULL,
  `classe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `id` int(11) NOT NULL,
  `ragione_sociale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `partita_iva` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protFatturazione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `codice_fiscale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_geografica` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `altriIndirizzi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codice_identificativo_sdi` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_via` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_ncivico` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirizzo_cap` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_comune` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_provincia` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirizzo_nazione` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `codiciiva`
--

CREATE TABLE `codiciiva` (
  `id` int(11) NOT NULL,
  `codice` text CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `aliquota` int(11) NOT NULL,
  `sigla` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `contratti`
--

CREATE TABLE `contratti` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataStipula` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `um` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` int(11) NOT NULL,
  `prezzo` float NOT NULL,
  `consegna` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `barattolo` int(11) NOT NULL,
  `coperchio` int(11) NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissione` float NOT NULL,
  `agente` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL,
  `modPag` int(11) NOT NULL,
  `archivio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `dash`
--

CREATE TABLE `dash` (
  `id` int(11) NOT NULL,
  `descrizione` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ddout_row`
--

CREATE TABLE `ddout_row` (
  `id` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` int(11) NOT NULL,
  `ddt` int(11) NOT NULL,
  `um` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoBar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotti` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ddtin`
--

CREATE TABLE `ddtin` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ddtout`
--

CREATE TABLE `ddtout` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL DEFAULT '0',
  `destinazione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `targa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigillo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordine` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ATTENZIONE: Id Shipment',
  `container` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trasporto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aspettoColli` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroColli` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `porto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vettore` int(11) NOT NULL,
  `causale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedane` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `divisori` int(11) NOT NULL,
  `ora` time NOT NULL,
  `tipologia` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposito` int(11) NOT NULL,
  `verso` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ddt_causali`
--

CREATE TABLE `ddt_causali` (
  `id` int(11) NOT NULL,
  `causale` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `depositi`
--

CREATE TABLE `depositi` (
  `id` int(11) NOT NULL,
  `descrizione` text NOT NULL,
  `indirizzo` text NOT NULL,
  `cliente` int(11) NOT NULL,
  `protIn` varchar(1) NOT NULL,
  `protOut` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `depositi_movimenti`
--

CREATE TABLE `depositi_movimenti` (
  `id` int(11) NOT NULL,
  `deposito` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `carico` int(11) NOT NULL,
  `scarico` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dich_intenti`
--

CREATE TABLE `dich_intenti` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL,
  `importo` float NOT NULL,
  `da` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `dich_intenti_ric`
--

CREATE TABLE `dich_intenti_ric` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `importo` float NOT NULL,
  `da` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendenti`
--

CREATE TABLE `dipendenti` (
  `id` int(11) NOT NULL,
  `nomeCognome` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `codiceFiscale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mansione` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendenti_certificati`
--

CREATE TABLE `dipendenti_certificati` (
  `id` int(11) NOT NULL,
  `dipendente` int(11) NOT NULL,
  `visitaMedica` date NOT NULL,
  `scadenzaVisitaMedica` date NOT NULL,
  `certAsl` date NOT NULL,
  `scadenzaCertAsl` date NOT NULL,
  `attestatoDlgs81` date NOT NULL,
  `scadenzaAttestatoDlgs81` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendenti_contratti`
--

CREATE TABLE `dipendenti_contratti` (
  `id` int(11) NOT NULL,
  `dipendente` int(11) NOT NULL,
  `inizio` date NOT NULL,
  `fine` date NOT NULL,
  `licenziamento` date NOT NULL,
  `proroga` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `distrimballaggi`
--

CREATE TABLE `distrimballaggi` (
  `id` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `data` date NOT NULL,
  `formulario` text COLLATE utf8_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `qt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `entrate`
--

CREATE TABLE `entrate` (
  `id` int(11) NOT NULL,
  `rowordineout` int(11) NOT NULL,
  `rowordinideposito` int(11) NOT NULL,
  `dataIngresso` date NOT NULL,
  `ddt` int(11) NOT NULL,
  `qt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `fondi`
--

CREATE TABLE `fondi` (
  `id` int(11) NOT NULL,
  `descrizione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `istituto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bic_swift` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo0` double NOT NULL,
  `colore` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitori`
--

CREATE TABLE `fornitori` (
  `id` int(11) NOT NULL,
  `ragione_sociale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `partita_iva` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `codice_fiscale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_geografica` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `altriIndirizzi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codice_identificativo_sdi` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_via` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_ncivico` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirizzo_cap` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_comune` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirizzo_provincia` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirizzo_nazione` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftin`
--

CREATE TABLE `ftin` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocollo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `dataRegistrazione` date DEFAULT NULL,
  `imponibile` double NOT NULL,
  `importoIva` float NOT NULL,
  `totale` double NOT NULL,
  `ordine` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dicIntenti` int(11) NOT NULL,
  `cambio` float NOT NULL,
  `impoEuro` double NOT NULL,
  `totaleEuro` double DEFAULT NULL,
  `rifFtOut` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_elettronica` tinyint(1) NOT NULL DEFAULT '0',
  `pec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codice_identificativo` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftin_copia`
--

CREATE TABLE `ftin_copia` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocollo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `imponibile` double NOT NULL,
  `importoIva` float NOT NULL,
  `totale` double NOT NULL,
  `ordine` int(11) NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dicIntenti` int(11) NOT NULL,
  `cambio` float NOT NULL,
  `impoEuro` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftin_online`
--

CREATE TABLE `ftin_online` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocollo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `imponibile` double NOT NULL,
  `importoIva` float NOT NULL,
  `totale` double NOT NULL,
  `ordine` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dicIntenti` int(11) NOT NULL,
  `cambio` float NOT NULL,
  `impoEuro` double NOT NULL,
  `rifFtOut` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftin_row`
--

CREATE TABLE `ftin_row` (
  `id` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `data` date NOT NULL,
  `costo` int(11) NOT NULL,
  `descrizione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` int(11) NOT NULL,
  `pzu` float NOT NULL,
  `pzt` double NOT NULL,
  `vat` int(11) NOT NULL,
  `tot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftout`
--

CREATE TABLE `ftout` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL,
  `indirizzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordine` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ATTENZIONE: Id Shipment',
  `imponibile` double NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `importoIva` float NOT NULL,
  `totaleFattura` double NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `incoterms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stornata` int(11) NOT NULL,
  `tassoCambio` float NOT NULL,
  `imponibileEuro` double NOT NULL,
  `totaleFatturaEuro` double NOT NULL DEFAULT '0',
  `fondo` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gw` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nw` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cbm` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dicIntenti` int(11) NOT NULL,
  `is_elettronica` tinyint(1) NOT NULL DEFAULT '0',
  `pec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codice_destinatario` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ftout_row`
--

CREATE TABLE `ftout_row` (
  `id` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `um` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` int(11) NOT NULL,
  `pzu` float NOT NULL,
  `discount` float NOT NULL,
  `pzt` double NOT NULL,
  `vat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tot` double NOT NULL,
  `gw` float NOT NULL,
  `nw` float NOT NULL,
  `cbm` float NOT NULL,
  `taricCode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotti` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ddt` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `imballaggi`
--

CREATE TABLE `imballaggi` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` int(11) NOT NULL,
  `categoria` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incassi`
--

CREATE TABLE `incassi` (
  `id` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `importo` float NOT NULL,
  `data` date NOT NULL,
  `mezzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incassi_dati`
--

CREATE TABLE `incassi_dati` (
  `id` int(11) NOT NULL,
  `importo` double NOT NULL,
  `data` date NOT NULL,
  `mezzo` text COLLATE utf8_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `commissioni` float NOT NULL,
  `abbuono` double NOT NULL,
  `importoTot` double NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `dataInsoluto` date NOT NULL,
  `cambio` double NOT NULL,
  `totEuro` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incassi_nc`
--

CREATE TABLE `incassi_nc` (
  `id` int(11) NOT NULL,
  `notaCredito` int(11) NOT NULL,
  `importo` float NOT NULL,
  `data` date NOT NULL,
  `mezzo` text NOT NULL,
  `valuta` text NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `incassi_row`
--

CREATE TABLE `incassi_row` (
  `id` int(11) NOT NULL,
  `incasso` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `parcella` int(11) NOT NULL,
  `ncredito` int(11) NOT NULL,
  `importoPagato` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lavorazioni`
--

CREATE TABLE `lavorazioni` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `consegna` int(11) NOT NULL,
  `qtLavorazione` int(11) NOT NULL,
  `qtCartoni` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtPallet` int(11) NOT NULL,
  `plastica` int(11) NOT NULL,
  `qtPlastica` int(11) NOT NULL,
  `dataInizio` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `dataChiusura` date NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dipendente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dash` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lottipf`
--

CREATE TABLE `lottipf` (
  `id` int(11) NOT NULL,
  `struttura` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `provenienza` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lavorazione` int(11) NOT NULL,
  `dataCreazione` date NOT NULL,
  `dataAcquisto` date NOT NULL,
  `fornitore` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `qtCarico` int(11) NOT NULL,
  `deposito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `mercetichettata`
--

CREATE TABLE `mercetichettata` (
  `id` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `carico` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `messaggi`
--

CREATE TABLE `messaggi` (
  `id` int(11) NOT NULL,
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `testo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `metodipagamento`
--

CREATE TABLE `metodipagamento` (
  `id` int(11) NOT NULL,
  `metodo` text NOT NULL,
  `scadenze` text NOT NULL,
  `classe` text NOT NULL,
  `codice_fe` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `movimballaggi`
--

CREATE TABLE `movimballaggi` (
  `id` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `scarico` int(11) NOT NULL,
  `carico` int(11) NOT NULL,
  `pzu` float NOT NULL,
  `lavorazione` int(11) NOT NULL,
  `ddt` int(11) NOT NULL,
  `ddt_row` int(11) NOT NULL,
  `data` date NOT NULL,
  `fornitore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `movimbscheda`
--

CREATE TABLE `movimbscheda` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `carico` int(11) NOT NULL,
  `scarico` int(11) NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `ddt` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `query_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `movimentifinanziari`
--

CREATE TABLE `movimentifinanziari` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `fondo` int(11) NOT NULL,
  `descrizione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dare` double NOT NULL,
  `avere` double NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` int(11) NOT NULL,
  `incasso` int(11) NOT NULL,
  `ver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `movlottipf`
--

CREATE TABLE `movlottipf` (
  `id` int(11) NOT NULL,
  `lotto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodotto` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `qtCarico` float NOT NULL,
  `data` date NOT NULL,
  `ddt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposito` int(11) NOT NULL,
  `ddtrow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `movpfiniti`
--

CREATE TABLE `movpfiniti` (
  `id` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `scarico` int(11) NOT NULL,
  `carico` int(11) NOT NULL,
  `lavorazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ncredito_emesse`
--

CREATE TABLE `ncredito_emesse` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `indirizzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rif_fattura` int(11) NOT NULL,
  `imponibile` float NOT NULL,
  `iva` float NOT NULL,
  `aliquota` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `totale` float NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `causale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ftStorno` int(11) NOT NULL,
  `dataPagamento` date NOT NULL,
  `dicint` int(11) NOT NULL,
  `cambio` double NOT NULL,
  `totEuro` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ncredito_ricevute`
--

CREATE TABLE `ncredito_ricevute` (
  `id` int(11) NOT NULL,
  `codice` text NOT NULL,
  `numeroNC` text NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataScadenza` date NOT NULL,
  `dataRegistrazione` date DEFAULT NULL,
  `fornitore` int(11) NOT NULL,
  `rifFattura` int(11) NOT NULL,
  `imponibile` double NOT NULL,
  `bollo` double NOT NULL,
  `aliquota` int(11) NOT NULL,
  `iva` float NOT NULL,
  `totale` double NOT NULL,
  `stato` text NOT NULL,
  `causale` text NOT NULL,
  `valuta` text NOT NULL,
  `pagamento` text NOT NULL,
  `ftStorno` int(11) NOT NULL,
  `dataPagamento` date NOT NULL,
  `dicint` int(11) NOT NULL,
  `cambio` double NOT NULL,
  `totEuro` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordineout`
--

CREATE TABLE `ordineout` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornitore` int(11) NOT NULL,
  `dataOrdie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordinideposito`
--

CREATE TABLE `ordinideposito` (
  `id` int(11) NOT NULL,
  `codice` text NOT NULL,
  `deposito` int(11) NOT NULL,
  `dataOrdine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordiniin`
--

CREATE TABLE `ordiniin` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `contratto` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `destinazione` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti`
--

CREATE TABLE `pagamenti` (
  `id` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `importo` float NOT NULL,
  `data` date NOT NULL,
  `mezzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_bp`
--

CREATE TABLE `pagamenti_bp` (
  `id` int(11) NOT NULL,
  `busta` int(11) NOT NULL,
  `data` date NOT NULL,
  `importo` float NOT NULL,
  `mezzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_dati`
--

CREATE TABLE `pagamenti_dati` (
  `id` int(11) NOT NULL,
  `importo` double NOT NULL,
  `data` date NOT NULL,
  `mezzo` text COLLATE utf8_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dipendente` int(11) NOT NULL,
  `commissioni` float NOT NULL,
  `abbuono` double NOT NULL,
  `importoTot` double NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `dataInsoluto` date NOT NULL,
  `cambio` double NOT NULL,
  `totEuro` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_nc`
--

CREATE TABLE `pagamenti_nc` (
  `id` int(11) NOT NULL,
  `notaCredito` int(11) NOT NULL,
  `importo` float NOT NULL,
  `data` date NOT NULL,
  `mezzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_parcella`
--

CREATE TABLE `pagamenti_parcella` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `fondo` int(11) NOT NULL,
  `importo` float NOT NULL,
  `mezzo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parcella` int(11) NOT NULL,
  `scadenzaRA` date NOT NULL,
  `ritenuta` float NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `statora` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataPagamentoRA` date NOT NULL,
  `tirardo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_row`
--

CREATE TABLE `pagamenti_row` (
  `id` int(11) NOT NULL,
  `pagamento` int(11) NOT NULL,
  `fattura` int(11) NOT NULL,
  `parcella` int(11) NOT NULL,
  `ncredito` int(11) NOT NULL,
  `bPaga` int(11) NOT NULL,
  `importoPagato` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `parcelle`
--

CREATE TABLE `parcelle` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataEmissione` date NOT NULL,
  `dataRegistrazione` date DEFAULT NULL,
  `fornitore` int(11) NOT NULL,
  `numeroParcella` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dicIntenti` int(11) NOT NULL,
  `valuta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataScadenza` date NOT NULL,
  `imponibile` float NOT NULL,
  `tipo_cassa` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cassa` float NOT NULL,
  `spese` float NOT NULL,
  `raa` float NOT NULL,
  `ra` float NOT NULL,
  `aliquotaIVA` float NOT NULL,
  `iva` float NOT NULL,
  `nonDoc` double NOT NULL,
  `totale` double NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `perFatture` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pedane`
--

CREATE TABLE `pedane` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `ddt` text NOT NULL,
  `cliente` int(11) NOT NULL,
  `vettore` int(11) NOT NULL,
  `caricate` int(11) NOT NULL,
  `ricevute` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodottifiniti`
--

CREATE TABLE `prodottifiniti` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `codiceNumerico` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_misura` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vassoi` int(11) NOT NULL,
  `etichette` int(11) NOT NULL,
  `formato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente` int(11) NOT NULL,
  `prodotto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `materiali` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inglese` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `francese` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `plastica` int(11) NOT NULL,
  `qtPlastica` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `riepilogomaterialicontratto`
--

CREATE TABLE `riepilogomaterialicontratto` (
  `id` int(11) NOT NULL,
  `imb` int(11) NOT NULL,
  `qt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `riepilogo_imballaggi`
--

CREATE TABLE `riepilogo_imballaggi` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` int(11) NOT NULL,
  `disponibile` int(11) NOT NULL,
  `preparare` int(11) NOT NULL,
  `ordinata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `riepilogo_prodotti`
--

CREATE TABLE `riepilogo_prodotti` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` int(11) NOT NULL,
  `disponibile` int(11) NOT NULL,
  `preparare` int(11) NOT NULL,
  `ordinata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `rowordineout`
--

CREATE TABLE `rowordineout` (
  `id` int(11) NOT NULL,
  `ordine` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `um` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prezzo` float NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `rowordinideposito`
--

CREATE TABLE `rowordinideposito` (
  `id` int(11) NOT NULL,
  `ordine` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `imballaggio` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `stato` text NOT NULL,
  `brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `scadenzario`
--

CREATE TABLE `scadenzario` (
  `id` int(11) NOT NULL,
  `scadenza` date NOT NULL,
  `fattura` text COLLATE utf8_unicode_ci NOT NULL,
  `metodo` int(11) NOT NULL,
  `importo` double NOT NULL,
  `cliente` int(11) NOT NULL,
  `fornitore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `schedacontabilecliente`
--

CREATE TABLE `schedacontabilecliente` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `data` date NOT NULL,
  `scadenza` date NOT NULL,
  `dare` double NOT NULL,
  `avere` double NOT NULL,
  `descrizione` text NOT NULL,
  `stato` text NOT NULL,
  `query_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `schedacontabiledipendente`
--

CREATE TABLE `schedacontabiledipendente` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `data` date NOT NULL,
  `dare` double NOT NULL,
  `avere` double NOT NULL,
  `descrizione` text NOT NULL,
  `stato` text NOT NULL,
  `query_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `schedacontabilefornitore`
--

CREATE TABLE `schedacontabilefornitore` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `data` date NOT NULL,
  `scadenza` date NOT NULL,
  `dare` double NOT NULL,
  `avere` double NOT NULL,
  `descrizione` text NOT NULL,
  `stato` text NOT NULL,
  `query_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `shipment`
--

CREATE TABLE `shipment` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente` int(11) NOT NULL,
  `contratto` int(11) NOT NULL,
  `ordine` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `struttura` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` int(11) NOT NULL,
  `dataConsegna` date NOT NULL,
  `stato` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `unitamisura`
--

CREATE TABLE `unitamisura` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8_unicode_ci NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `uscite`
--

CREATE TABLE `uscite` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodotto` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `dataUscita` date NOT NULL,
  `consegna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `vettori`
--

CREATE TABLE `vettori` (
  `id` int(11) NOT NULL,
  `ragione_sociale` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `vocidicosto`
--

CREATE TABLE `vocidicosto` (
  `id` int(11) NOT NULL,
  `codiceVoce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrizione` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `volantino`
--

CREATE TABLE `volantino` (
  `id` int(11) NOT NULL,
  `codice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ddt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `areageografica`
--
ALTER TABLE `areageografica`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `assegni`
--
ALTER TABLE `assegni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `buste_paga`
--
ALTER TABLE `buste_paga`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `carnet`
--
ALTER TABLE `carnet`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `classeimballaggio`
--
ALTER TABLE `classeimballaggio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `classeprodotto`
--
ALTER TABLE `classeprodotto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `codiciiva`
--
ALTER TABLE `codiciiva`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `contratti`
--
ALTER TABLE `contratti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dash`
--
ALTER TABLE `dash`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ddout_row`
--
ALTER TABLE `ddout_row`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ddtin`
--
ALTER TABLE `ddtin`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ddtout`
--
ALTER TABLE `ddtout`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ddt_causali`
--
ALTER TABLE `ddt_causali`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `depositi`
--
ALTER TABLE `depositi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indici per le tabelle `depositi_movimenti`
--
ALTER TABLE `depositi_movimenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dich_intenti`
--
ALTER TABLE `dich_intenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dich_intenti_ric`
--
ALTER TABLE `dich_intenti_ric`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dipendenti`
--
ALTER TABLE `dipendenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dipendenti_certificati`
--
ALTER TABLE `dipendenti_certificati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dipendenti_contratti`
--
ALTER TABLE `dipendenti_contratti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `distrimballaggi`
--
ALTER TABLE `distrimballaggi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `entrate`
--
ALTER TABLE `entrate`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `fondi`
--
ALTER TABLE `fondi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `fornitori`
--
ALTER TABLE `fornitori`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftin`
--
ALTER TABLE `ftin`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftin_copia`
--
ALTER TABLE `ftin_copia`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftin_online`
--
ALTER TABLE `ftin_online`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftin_row`
--
ALTER TABLE `ftin_row`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftout`
--
ALTER TABLE `ftout`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ftout_row`
--
ALTER TABLE `ftout_row`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `imballaggi`
--
ALTER TABLE `imballaggi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `incassi`
--
ALTER TABLE `incassi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `incassi_dati`
--
ALTER TABLE `incassi_dati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `incassi_nc`
--
ALTER TABLE `incassi_nc`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `incassi_row`
--
ALTER TABLE `incassi_row`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `lavorazioni`
--
ALTER TABLE `lavorazioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `lottipf`
--
ALTER TABLE `lottipf`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `mercetichettata`
--
ALTER TABLE `mercetichettata`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `messaggi`
--
ALTER TABLE `messaggi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `metodipagamento`
--
ALTER TABLE `metodipagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movimballaggi`
--
ALTER TABLE `movimballaggi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movimbscheda`
--
ALTER TABLE `movimbscheda`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movimentifinanziari`
--
ALTER TABLE `movimentifinanziari`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movlottipf`
--
ALTER TABLE `movlottipf`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movpfiniti`
--
ALTER TABLE `movpfiniti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ncredito_emesse`
--
ALTER TABLE `ncredito_emesse`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ncredito_ricevute`
--
ALTER TABLE `ncredito_ricevute`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordineout`
--
ALTER TABLE `ordineout`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordinideposito`
--
ALTER TABLE `ordinideposito`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordiniin`
--
ALTER TABLE `ordiniin`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti_bp`
--
ALTER TABLE `pagamenti_bp`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti_dati`
--
ALTER TABLE `pagamenti_dati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti_nc`
--
ALTER TABLE `pagamenti_nc`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti_parcella`
--
ALTER TABLE `pagamenti_parcella`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagamenti_row`
--
ALTER TABLE `pagamenti_row`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `parcelle`
--
ALTER TABLE `parcelle`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pedane`
--
ALTER TABLE `pedane`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `prodottifiniti`
--
ALTER TABLE `prodottifiniti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `riepilogomaterialicontratto`
--
ALTER TABLE `riepilogomaterialicontratto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `riepilogo_imballaggi`
--
ALTER TABLE `riepilogo_imballaggi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `riepilogo_prodotti`
--
ALTER TABLE `riepilogo_prodotti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `rowordineout`
--
ALTER TABLE `rowordineout`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `rowordinideposito`
--
ALTER TABLE `rowordinideposito`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `scadenzario`
--
ALTER TABLE `scadenzario`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `schedacontabilecliente`
--
ALTER TABLE `schedacontabilecliente`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `schedacontabiledipendente`
--
ALTER TABLE `schedacontabiledipendente`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `schedacontabilefornitore`
--
ALTER TABLE `schedacontabilefornitore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `unitamisura`
--
ALTER TABLE `unitamisura`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `uscite`
--
ALTER TABLE `uscite`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `vettori`
--
ALTER TABLE `vettori`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `vocidicosto`
--
ALTER TABLE `vocidicosto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `volantino`
--
ALTER TABLE `volantino`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `areageografica`
--
ALTER TABLE `areageografica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `assegni`
--
ALTER TABLE `assegni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `buste_paga`
--
ALTER TABLE `buste_paga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `carnet`
--
ALTER TABLE `carnet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `classeimballaggio`
--
ALTER TABLE `classeimballaggio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `classeprodotto`
--
ALTER TABLE `classeprodotto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `codiciiva`
--
ALTER TABLE `codiciiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `contratti`
--
ALTER TABLE `contratti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dash`
--
ALTER TABLE `dash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ddout_row`
--
ALTER TABLE `ddout_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ddtin`
--
ALTER TABLE `ddtin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ddtout`
--
ALTER TABLE `ddtout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ddt_causali`
--
ALTER TABLE `ddt_causali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `depositi`
--
ALTER TABLE `depositi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `depositi_movimenti`
--
ALTER TABLE `depositi_movimenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dich_intenti`
--
ALTER TABLE `dich_intenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dich_intenti_ric`
--
ALTER TABLE `dich_intenti_ric`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dipendenti`
--
ALTER TABLE `dipendenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dipendenti_certificati`
--
ALTER TABLE `dipendenti_certificati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dipendenti_contratti`
--
ALTER TABLE `dipendenti_contratti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `distrimballaggi`
--
ALTER TABLE `distrimballaggi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `entrate`
--
ALTER TABLE `entrate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fondi`
--
ALTER TABLE `fondi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fornitori`
--
ALTER TABLE `fornitori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftin`
--
ALTER TABLE `ftin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftin_copia`
--
ALTER TABLE `ftin_copia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftin_online`
--
ALTER TABLE `ftin_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftin_row`
--
ALTER TABLE `ftin_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftout`
--
ALTER TABLE `ftout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ftout_row`
--
ALTER TABLE `ftout_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `imballaggi`
--
ALTER TABLE `imballaggi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `incassi`
--
ALTER TABLE `incassi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `incassi_dati`
--
ALTER TABLE `incassi_dati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `incassi_nc`
--
ALTER TABLE `incassi_nc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `incassi_row`
--
ALTER TABLE `incassi_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `lavorazioni`
--
ALTER TABLE `lavorazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `lottipf`
--
ALTER TABLE `lottipf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `mercetichettata`
--
ALTER TABLE `mercetichettata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `messaggi`
--
ALTER TABLE `messaggi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `metodipagamento`
--
ALTER TABLE `metodipagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `movimballaggi`
--
ALTER TABLE `movimballaggi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `movimbscheda`
--
ALTER TABLE `movimbscheda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `movimentifinanziari`
--
ALTER TABLE `movimentifinanziari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `movlottipf`
--
ALTER TABLE `movlottipf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `movpfiniti`
--
ALTER TABLE `movpfiniti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ncredito_emesse`
--
ALTER TABLE `ncredito_emesse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ncredito_ricevute`
--
ALTER TABLE `ncredito_ricevute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordineout`
--
ALTER TABLE `ordineout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordinideposito`
--
ALTER TABLE `ordinideposito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordiniin`
--
ALTER TABLE `ordiniin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti_bp`
--
ALTER TABLE `pagamenti_bp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti_dati`
--
ALTER TABLE `pagamenti_dati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti_nc`
--
ALTER TABLE `pagamenti_nc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti_parcella`
--
ALTER TABLE `pagamenti_parcella`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamenti_row`
--
ALTER TABLE `pagamenti_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `parcelle`
--
ALTER TABLE `parcelle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pedane`
--
ALTER TABLE `pedane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodottifiniti`
--
ALTER TABLE `prodottifiniti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `riepilogomaterialicontratto`
--
ALTER TABLE `riepilogomaterialicontratto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `riepilogo_imballaggi`
--
ALTER TABLE `riepilogo_imballaggi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `riepilogo_prodotti`
--
ALTER TABLE `riepilogo_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `rowordineout`
--
ALTER TABLE `rowordineout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `rowordinideposito`
--
ALTER TABLE `rowordinideposito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `scadenzario`
--
ALTER TABLE `scadenzario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `schedacontabilecliente`
--
ALTER TABLE `schedacontabilecliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `schedacontabiledipendente`
--
ALTER TABLE `schedacontabiledipendente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `schedacontabilefornitore`
--
ALTER TABLE `schedacontabilefornitore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `shipment`
--
ALTER TABLE `shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `unitamisura`
--
ALTER TABLE `unitamisura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `uscite`
--
ALTER TABLE `uscite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `vettori`
--
ALTER TABLE `vettori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `vocidicosto`
--
ALTER TABLE `vocidicosto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `volantino`
--
ALTER TABLE `volantino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
