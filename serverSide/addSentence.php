<?php

	header('Location:.'); 

	if (isset($_POST['text'])) {
	
		$text = $_POST['text'];

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

		$found=false;
		$elements = $oldPool->getElementsByTagName('element');
		for ($i=0;$i<$elements->length;$i++) {
			$thisSentence = utf8_decode(stripslashes($elements->item($i)->nodeValue));
			if ($thisSentence==$text) $found=true;
		}
		$elements = $newPool->getElementsByTagName('element');
		for ($i=0;$i<$elements->length;$i++) {
			$thisSentence = utf8_decode(stripslashes($elements->item($i)->nodeValue));
			if ($thisSentence==$text) $found=true;
		}

		if (!$found) {
			$newElement = $doc->createElement('element',addslashes(utf8_encode($text)));
			$newElement->setAttribute('type','text');
			$newPool->appendChild($newElement);
			
			$doc->saveXML();
			$doc->save($baseXml);
		}
	}
	
?>
