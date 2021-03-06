<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<body style="font-size:30px;">
<?php

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
	
	$elements = $newPool->getElementsByTagName('element');
	foreach ($elements AS $element) {
		echo stripslashes($element->nodeValue).'<br/>';
	}
	$elements = $oldPool->getElementsByTagName('element');
	foreach ($elements AS $element) {
		echo stripslashes($element->nodeValue).'<br/>';
	}

?>
</body>