<div class="row ">
<div class="col-md-4"></div>
<div class="col-md-4 ">
	<div class="login-box-body vertical-center">
		<span class="sign-in-text-bld">Sign In </span>
		<div></div>
		<span class="sign-in-text">to GRS Hiring Portal</b></span>
		<div class="custom-height"></div>
		
		<?php echo $form->open(); ?>
			<?php echo $form->messages(); ?>
			<div class="txt_field">
			<?php echo $form->bs3_text('Username / Email Address*', 'username', ENVIRONMENT==='development' ? ' ' : ''); ?>
			</div>
			<div class="txt_field">
			<?php echo $form->bs3_password('Password', 'password', ENVIRONMENT==='development' ? '' : ''); ?>
			</div>
			<div class="row">
				<div class="col-xs-8">
				<div class="checkbox">
						<label><input type="checkbox" name="remember"> Remember Me</label>
				</div>
</div>
				<div class="col-xs-4"><br>
					<?php echo $form->bs3_submit('LOGIN', 'btn btn-primary btn-block btn-flat hp-login-btn'); ?>
				</div>
			</div>
		<?php echo $form->close(); ?>
	</div>

</div>
<div class="col-md-4"></div>
</div>