<div class="row">


	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'yellow', $count['users'], 'Users', 'fa fa-users', 'admin_users'); ?>
	</div>

	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['jobs'], 'Total Jobs', 'fa fa-gear', 'job_posts'); ?>
	</div>
	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['practices'], 'Total Practices', 'fa fa-gear', 'job_practices'); ?>
	</div>
	
</div>
