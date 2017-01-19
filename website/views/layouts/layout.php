<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?php

	// output the collected meta-data
	if(!$this->document) {
		// use "home" document as default if no document is present
		$this->document = Document::getById(1);
	}
	if($this->document->getTitle()) {
		// use the manually set title if available
		$this->headTitle()->set($this->document->getTitle());
	}
	if($this->document->getDescription()) {
		// use the manually set description if available
		$this->headMeta()->appendName('description', $this->document->getDescription());
	}
	$this->headTitle()->append("Awesome Pimcore Tutorial");
	$this->headTitle()->setSeparator(" : ");
	echo $this->headTitle();
	echo $this->headMeta();
	?>

	<?= $this->headLink(); ?>


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="//oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body>

<?php if(!$this->editmode) { ?>
<?= $this->inc("/includes/navigation"); ?>
<?php } ?>

<?= $this->layout()->content; ?>

<?= $this->inc("/includes/footer"); ?>

<?= $this->headScript(); ?>
</body>

</html>
