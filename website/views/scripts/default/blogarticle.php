<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url(<?php if($this->blogarticle->getHeaderbackgroundimage() != "") { echo $this->blogarticle->getHeaderbackgroundimage()->getThumbnail("headerbackground"); } else { echo '/static/img/post-bg.jpg'; } ?>)">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div class="post-heading">
					<h1><?= $this->blogarticle->getTitle(); ?></h1>
					<?php if($this->blogarticle->getSubtitle() != "") { ?>
					<h2 class="subheading"><?= $this->blogarticle->getSubtitle(); ?></h2>
					<?php } ?>
					<span class="meta">Posted by <a href="#"><?= $this->blogarticle->getAuthor(); ?></a> on <?= $this->blogarticle->getBlogpostcreated()->format("Y-m-d"); ?></span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Post Content -->
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<?= $this->blogarticle->getContent(); ?>
			</div>
		</div>
	</div>
</article>

<hr>
