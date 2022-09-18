<div class="login-box">

	<div class="login-box-body">
		<span class="sign-in-text">Sign in</span>
		<div> </div>
		<span class="">GRS Hiring Portal </span>
		<?php echo $form->open(); ?>
			<?php echo $form->messages(); ?>
			<?php echo $form->bs3_text('', 'username', ENVIRONMENT==='development' ? 'Email ID' : ''); ?>
			<?php echo $form->bs3_password('', 'password', ENVIRONMENT==='development' ? 'password' : ''); ?>
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox">
						<label><input type="checkbox" name="remember"> Remember Me</label>
					</div>
				</div>
				<div class="col-xs-4">
					<?php echo $form->bs3_submit('Sign In', 'btn btn-primary btn-block btn-flat hp-login-btn'); ?>
				</div>
			</div>
		<?php echo $form->close(); ?>
	</div>

</div>