<?php

	$baseXml = './pool.xml';
	$doc = new DOMDocument();
	$doc->Load($baseXml);

	$newPool;
	$oldPool;
	$pools = $doc->getElementsByTagName('pool');
	for ($i=0;$i<$pools->length;$i++) {
		if ($pools->item($i)->getAttribute("id")=="old") $oldPool=$pools->item($i);
		if ($pools->item($i)->getAttribute("id")=="new") $newPool=$pools->item($i);
	}
		
	$index = $doc->getElementsByTagName('var')->item(0)->getAttribute('index');
	$foundInNew=true;
	$elements = $newPool->getElementsByTagName('element');
	if ($elements->length<=0) {
		$elements = $oldPool->getElementsByTagName('element');
		$foundInNew=false;
	}
	if ($elements->length>0) {
		$index = $index % $elements->length;
		$thisElement = $elements->item($index);
		echo stripslashes($thisElement->nodeValue);
		if ($foundInNew) {
			$oldPool->appendChild($thisElement);
		}
		if ($elements->length>0) $index = ($index+1) % $elements->length;
		$doc->getElementsByTagName('var')->item(0)->setAttribute('index',$index);
		$doc->saveXML();
		$doc->save($baseXml);
	}else{
		echo " ";
	}

?>
