<!-- Footer -->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<?php if ($this->editmode) {
					while ($this->block("contentblock")->loop()) { ?>
						Font Awesome Code: <?= $this->input("fa_code"); ?>
						Url: <?= $this->input("url"); ?>
					<?php }
				} else { ?>
					<ul class="list-inline text-center">
						<?php while ($this->block("contentblock")->loop()) { ?>
							<li>
								<a href="<?= $this->input("url"); ?>" target="_blank">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa <?= $this->input("fa_code"); ?> fa-stack-1x fa-inverse"></i>
                                </span>
								</a>
							</li>
						<?php } ?>
					</ul>
				<? } ?>
				<p class="copyright text-muted">
					Copyright &copy; <?= $this->input("copyright_message"); ?> <?= date("Y"); ?></p>
			</div>
		</div>
	</div>
</footer>
