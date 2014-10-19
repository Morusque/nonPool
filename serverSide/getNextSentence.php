<?php

<<<<<<< HEAD
	define('DEBUG', false);

	if(DEBUG == true)
	{
		ini_set('display_errors', 'On');
		error_reporting(E_ALL);
	}
	else
	{
		ini_set('display_errors', 'Off');
		error_reporting(0);
	}

=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
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
<<<<<<< HEAD
	} else {
		$index = 0;
=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
	}
	if ($elements->length>0) {
		$index = $index % $elements->length;
		$thisElement = $elements->item($index);
		echo stripslashes($thisElement->nodeValue);
<<<<<<< HEAD
		if ($foundInNew) $oldPool->appendChild($thisElement);
		if (!$foundInNew) if ($elements->length>0) $index = ($index+1) % $elements->length;
=======
		if ($foundInNew) {
			$oldPool->appendChild($thisElement);
		}
		if ($elements->length>0) $index = ($index+1) % $elements->length;
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
		$doc->getElementsByTagName('var')->item(0)->setAttribute('index',$index);
		$doc->saveXML();
		$doc->save($baseXml);
	}else{
		echo " ";
	}

?>
