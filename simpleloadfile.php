<?php
// http://localhost/xml/simpleloadfile.php
$xml = simplexml_load_file('data.xml'); // return SimpleXMLElement Object
echo '<pre>';print_r( $xml );