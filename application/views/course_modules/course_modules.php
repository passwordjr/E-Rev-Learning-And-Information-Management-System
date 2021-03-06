<?php $this->load->view('includes/home-navbar'); ?>
<?php $this->load->view('includes/home-sidenav'); ?>

<div class="container row">
	<blockquote class="color-primary-green">
		<h5 class="color-black">Course Modules</h5>
	</blockquote>
	<div class="row">
		<?php   
		$enrollment = $this->Crud_model->fetch("enrollment",array("enrollment_is_active"=>1));
		$enrollment = $enrollment[0];
		// fetch offering
		$offering = $this->Crud_model->fetch("offering",array("offering_id"=>$info['user']->offering_id));
		$offering = $offering[0];
		// fetch course
		$course = $this->Crud_model->fetch("course",
			array("course_id"=>$offering->course_id,
				"enrollment_id"=>$enrollment->enrollment_id));
		$count = 0;
		?> 
		<?php if ($course): ?>
			<?php foreach ($course as $key => $value): ?>
				<?php if ($count == 3): ?><?= "<div class='row'>" ?><?php endif ?>
					<div class="col s4" >
						<div class="row">
							<div class="col s12">
								<div class="card bg-primary-green">
									<div class="card-content white-text">
										<span class="card-title"><?= $value->course_course_code ?></span>
										<p><?= $value->course_course_title ?>.</p>
									</div>
									<div class="card-action ">
										<a href="<?= base_url() ?>CourseModules/viewModules/<?= $value->course_id ?>" class="valign-wrapper">View<i class="material-icons" style="padding-left: 5%">remove_red_eye</i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php if ($count == 3): ?><?= "</div>" ?><?php endif ?>
					<?php $count++; ?>
				<?php endforeach ?>
			<?php endif ?>
		</div>
	</div>
