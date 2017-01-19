<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<?php foreach($this->paginator as $blogpost) { ?>
				<div class="post-preview">
					<a href="<?= $this->url(["id" => $blogpost->getId(), "title" => \Website\Tool\Text::toUrl($blogpost->getTitle())],"blogpost"); ?>">
						<h2 class="post-title">
							<?= $blogpost->getTitle(); ?>
						</h2>
						<?php if($blogpost->getSubtitle() != "") { ?>
							<h3 class="post-subtitle">
								<?= $blogpost->getSubtitle(); ?>
							</h3>

						<?php } ?>
					</a>
					<p class="post-meta">Posted by <a href="#"><?= $blogpost->getAuthor(); ?></a> on <?= $blogpost->getBlogpostcreated()->format("Y-m-d"); ?></p>
				</div>
				<hr>
			<?php } ?>


			<!-- pagination start -->
			<?= $this->paginationControl($this->paginator, 'Sliding', 'includes/paging.php', [
				'urlprefix' => $this->document->getFullPath() . '?page=', // just example (this parameter could be used in paging.php to construct the url)
				'appendQueryString' => true // just example (this parameter could be used in paging.php to construct the url)
			]); ?>
			<!-- pagination end -->

		</div>
	</div>
</div>
