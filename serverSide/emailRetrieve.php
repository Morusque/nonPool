<?php

	$hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
	$username = 'aissemesse@gmail.com';
	$password = 'smssmssms';

	$mbox = imap_open($hostname,$username,$password) or die('Cannot connect to Gmail: ' . imap_last_error());
 	$MC = imap_check($mbox);
	
	for ($i=0;$i<$MC->Nmsgs;$i++) {
		$message = quoted_printable_decode(imap_fetchbody($mbox, $i+1, '1'));
		if (ereg("\\+33787190481:",$message))  {
			$mBody = utf8_decode(substr($message,13));
			echo $mBody.'<br/>';
			$url = 'http://www.tntb.net/nonPool/addSentence.php';
			$r = new HttpRequest($url, HttpRequest::METH_POST);
			$r->addPostFields(array('text' => $mBody));
			try {
				echo $r->send()->getBody();
			} catch (HttpException $ex) {
				echo $ex;
			}		
		}
	}

	imap_close($mbox);
 
?>

<?

