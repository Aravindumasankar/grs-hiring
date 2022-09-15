<div class="row">


	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['jobs'], 'Total Jobs', 'fa fa-gear', 'job_posts'); ?>
	</div>
	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['hiring_managers'], 'Hiring Managers', 'fa fa-users', 'hiring_managers'); ?>
	</div>
	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['practice_managers'], 'Practice Managers', 'fa fa-users', 'practice_managers'); ?>
	</div>
	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['sub_practices'], 'Sub Practices', 'fa fa-users', 'sub_practices'); ?>
	</div>
	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'green', $count['practices'], 'Practices', 'fa fa-gear', 'job_practices'); ?>
	</div>
	
</div>
