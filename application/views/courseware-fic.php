<?php $this->load->view('includes/home-sidenav'); ?>
<?php $this->load->view('includes/home-navbar'); ?>
<div class="row container">
	<div class="col s1"></div>
	<div class="col s7">
		<blockquote class="color-primary-green">
			<h3 class="color-black">Manage Coursewares</h3>
		</blockquote>
	</div>
	<div class="col s4"></div>
</div>
<div class="row container">
	<div class="col s1"></div>
	<div class="col s11">
		<textarea name="editor1"></textarea>
		<script>

			CKEDITOR.replace( 'editor1');
		</script>
	</div>

</div>
<a id="btn_show_menu"  class="btn-floating btn-large waves-effect waves-light red button-collapse right" data-activates="slide-out"><i  class="material-icons">menu</i></a>