<?php
// http://localhost/xml/domdoc.php
$xmlDoc = new DOMDocument();
$xmlDoc->load("data.xml");

print $xmlDoc->saveXML();
echo '<pre>';print_r( $xmlDoc )."<pre>"; // DOMDocument Object
/*

$xml = file_get_contents("data.xml");
$doc = new DOMDocument();
$doc->loadXML($xml);
$json = new \FluentDOM\Serializer\Json\RabbitFish($doc);
$object = json_decode($json);

echo "<pre>" . print_r( $object, true) . "</pre>";
echo "<script>console.log({$json})</script>";
*/