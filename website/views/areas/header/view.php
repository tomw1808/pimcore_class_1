<?php if($this->editmode) { ?>
	Background picture: <?= $this->image("bg_image"); ?>
	<br />
	Background color: <?= $this->input("bg_color"); ?>
<?php } ?>
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="<?php if($this->input("bg_color")->getData() != "") { echo "background-color: ".$this->input("bg_color")->getData()."; "; } ?> <?php if($this->image("bg_image")->getSrc() != null) { echo "background-image: url('". $this->image("bg_image")->getThumbnail("headerbackground")."')"; } ?>">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div class="site-heading">
					<h1><?= $this->input("headline"); ?></h1>
					<hr class="small">
					<span class="subheading"><?= $this->input("subheadline"); ?></span>
				</div>
			</div>
		</div>
	</div>
</header>
