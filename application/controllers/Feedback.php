<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Feedback extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Crud_model');
        $this->load->helper('date');
    }

    public function index() {
        if ($this->session->userdata('userInfo')['logged_in'] == 1 && $this->session->userdata('userInfo')['identifier'] == "student") {
            $info = $this->session->userdata('userInfo');
            $student_temp = $this->session->userdata('userInfo')["user"]->student_program;
            $dept_temp = $this->Crud_model->fetch('professor', array('professor_department' => $student_temp));
            $feedback_status = $dept_temp[0]->professor_feedback_active;
            $data = array(
                'title' => "Feedback",
                'info' => $info
            );
            $this->load->view('includes/header', $data);
            if ($feedback_status == 1) {                //checks if feedback is open
                $error = true;          //error holder
                $user_hold = $this->session->userdata('userInfo')['user'];
                $user_id = $user_hold->offering_id;
                $course_hold2 = $this->Crud_model->fetch('offering', array('offering_id' => $user_id))[0]->course_id;
                $course_hold = $this->Crud_model->fetch('course', array('course_id' => $course_hold2))[0];
                $enrollment_hold = $this->Crud_model->fetch('enrollment', array('enrollment_id' => $course_hold->enrollment_id))[0];
                if (empty($enrollment_hold) != 1) {       //check the fetched table and if it is active
                    if ($enrollment_hold->enrollment_is_active == 0) {
                        $error = false;
                        $this->load->view('feedback/feedback_main', $data);
                        include(APPPATH . 'views\feedback\custom1.php');
                    }
                }

                if ($error) {
                    $subject_hold = $this->Crud_model->fetch('subject', array('offering_id' => $user_id)); //error
                    $lect = array();
                    $inner_counter = 0;
                    if (empty($subject_hold) != 1) {
                        foreach ($subject_hold as $subject) {
                            $lect_id = $subject->lecturer_id;
                            $lect_hold = $this->Crud_model->fetch('lecturer', array('lecturer_id' => $lect_id))[0];
                            $lect_hold->topic = $subject_hold[$inner_counter]->subject_name;
                            if ($this->Crud_model->fetch('lecturer_feedback', array('lecturer_id' => $lect_id, 'student_id' => $user_hold->student_id))[0]) {
                                $lect_hold->sent_feedback = 1;
                            } else {
                                $lect_hold->sent_feedback = 0;
                            }
                            array_push($lect, $lect_hold);
                            $inner_counter++;
                        }

                        $data = array(
                            'title' => "Feedback",
                            'info' => $info,
                            'lect' => $lect
                        );
                        $this->load->view('feedback/feedback_main', $data);
                    } else {
                        $this->load->view('feedback/feedback_main', $data);
                        include(APPPATH . 'views\feedback\custom3.php');
                    }
                }
            } else {
                $this->load->view('feedback/error', $data);
                $this->load->view('feedback/custom4');
            }
        } else if ($this->session->userdata('userInfo')['logged_in'] == 1 && $this->session->userdata('userInfo')['identifier'] == "fic") { //show to fic
            if ($this->session->userdata('userInfo')['user']->fic_status == 1) {
                $data = array(
                    'title' => "Feedback"
                );
                $this->load->view('includes/header', $data);
                $info = $this->session->userdata('userInfo');
                $active_enrol = $info['active_enrollment'];
                $dept = $info['user']->fic_department;
                //fetch feedbacks (distinct by lecturer_id)
                $feedbacks = $this->Crud_model->fetch('lecturer_feedback', array('lecturer_feedback_department' => $dept, 'enrollment_id' => $active_enrol));
                //get section from fic
                $sections = $this->Crud_model->fetch_select('offering', array('offering_id', 'offering_name'), array('fic_id' => $info["user"]->fic_id));
                //store lecturer_id in DISTINCT
                $lecturers = array();
                foreach ($feedbacks as $feedback) {             //LAST, gagawa na lang ako if-else
                    $lecturers[] = $feedback->lecturer_id;
                }
                $lecturers = array_unique($lecturers);
                $counter = 0;
                $inner_counter = array();
                foreach ($sections as $section => $val) {           //loop section
                    $section_hold[] = array();
                    $cols = array('lecturer_feedback_id', 'lecturer_feedback_timedate', 'lecturer_feedback_comment', 'lecturer_id', 'offering_id');
                    foreach ($lecturers as $lecturer) {
                        $temp = $this->Crud_model->fetch_select('lecturer_feedback', $cols, array('lecturer_feedback_department' => $dept, 'enrollment_id' => $active_enrol, 'offering_id' => $val->offering_id));
                        foreach ($temp as $key => $temp2) {         //loop $temp
//                        echo"<pre>";
//                        print_r($temp2);
//                        echo"</pre>";
                            if (!in_array($temp2->lecturer_id, $inner_counter)) {
                                $cols = array('firstname', 'midname', 'lastname');
                                $res = $this->Crud_model->fetch_select('lecturer', $cols, array('lecturer_id' => $temp2->lecturer_id));
                                $inner_counter[] = $temp2->lecturer_id;
                                $cols = array('subject_name');
                                $subject = $this->Crud_model->fetch_select('subject', $cols, array('lecturer_id' => $temp2->lecturer_id, 'offering_id' => $val->offering_id));
                                $separate_lecturer[$temp2->lecturer_id][] = ucwords(implode(" ", (array) $res[0])); //name
                                $separate_lecturer[$temp2->lecturer_id][] = $subject[0]->subject_name;              //subject
                            }
                            $separate_lecturer[$temp2->lecturer_id][] = $temp2;         //stored values of lecturers
                        }
                    }
                    $section_hold[$counter][] = $val;
                    $section_hold[$counter][] = $separate_lecturer;
                    $counter++;
                }
                $data = array(
                    'title' => "Feedback",
                    'data' => $section_hold
                );
                $this->load->view('feedback/fic_view', $data);
            } else {
                redirect();
            }
        } else {
            redirect("");
        }

        $this->load->view('includes/footer');
    }

    public function content() {
        if ($this->session->userdata('userInfo')['logged_in'] == 1 && $this->session->userdata('userInfo')['identifier'] == "student") {
            $info = $this->session->userdata('userInfo');
            $course_id = $this->Crud_model->fetch('offering', array('offering_id' => $info["user"]->offering_id))[0]->course_id; //get course id from stud
            $enrollment_id = $this->Crud_model->fetch('course', array('course_id' => $course_id))[0]->enrollment_id; //get enrollment id from course
            $enrollment_active = $this->Crud_model->fetch('enrollment', array('enrollment_id' => $enrollment_id))[0]->enrollment_is_active; //get enrollment id from course
            $data = array(//gonna need to put this for header
                'title' => "Feedback"
            );
            $this->load->view('includes/header', $data);
            if ($enrollment_active == 1) {
                $stud_id = $this->session->userdata('userInfo')['user']->student_id;
                $data = array(
                    'title' => "Feedback",
                    'info' => $info
                );
                $segment = $this->uri->segment(3);
                $subject_hold2 = $this->Crud_model->fetch('subject', array('lecturer_id' => $segment))[0]->offering_id; //get offering_id on subject table from lecturer
                $subject_hold = $this->Crud_model->fetch('offering', array('offering_id' => $subject_hold2))[0]->course_id; //get course_id on offering table
                $offering_hold = $this->Crud_model->fetch('offering', array('offering_id' => $info["user"]->offering_id))[0]->course_id; //get course_id from student
                if ($this->Crud_model->fetch('lecturer_feedback', array('lecturer_id' => $segment, 'student_id' => $stud_id))[0]) {         //there is already record
//                    echo"<pre>";
//                    print_r($this->Crud_model->fetch('offering', array('course_id' => $subject_hold2))[0]);
//                    echo"</pre>";
                    $this->load->view('feedback/error', $data);
                    if ($subject_hold == $offering_hold) {                      //END OF VERIFYING, STUDENT ALREADY SUBMITTED
                        $this->load->view('feedback\submitted2.php');
                    } else {
                        $this->load->view('feedback\submitted.php');
                    }
                } else if ($subject_hold == $offering_hold) {                                            //didn't find anything on database
                    $offering_id = $this->Crud_model->fetch('lecturer', array('lecturer_id' => $segment))[0];

                    if (empty($offering_id) != 1) {             //found offering_id, WHERE THE STUDENT SUBMITS THE FEEDBACK
                        $data = array(
                            'title' => "Feedback",
                            'info' => $info,
                            'lect' => $offering_id
                        );
                        $this->load->view('feedback/feedback_content', $data);
                    } else {                                //unknown section
                        $this->load->view('feedback/error', $data);
                        include(APPPATH . 'views\feedback\custom5.php');
                    }
                } else {
                    redirect();
                }
            } else {
                $data = array(
                    'title' => "Feedback",
                    'info' => $info
                );
                $this->load->view('feedback/error', $data);
                include(APPPATH . 'views\feedback\custom1.php');
            }
            $this->load->view('includes/footer');
        } else {
            redirect();
        }
    }

    public function submit() {
        if ($this->session->userdata('userInfo')['logged_in'] == 1 && $this->session->userdata('userInfo')['identifier'] == "student") {
            /*  CHECKS THE CONNECTION TO THE ENROLLMEN  */
            $offering_id = $this->session->userdata('userInfo')['user']->offering_id;
            $course_id = $this->Crud_model->fetch('offering', array('offering_id' => $offering_id))[0]->course_id;
            $enrollment_id = $this->Crud_model->fetch('course', array('course_id' => $course_id))[0]->enrollment_id;
            $hold = $this->session->userdata('userInfo')["active_enrollment"];      //stored the enrollment_id of active
            /*  END */
            $data = array('title' => 'Feedback');
            $this->load->view('includes/header', $data);
            if ($this->session->userdata('userInfo')["active_enrollment"] == $enrollment_id) {   //checks if enrollment active is equals to involve student
                /*  student is qualified to submit  */
                date_default_timezone_set('Asia/Manila');
                $feedback = $this->input->post('feedback_content');
                /*  end     */
                /*  gets lecturer_id from url previous page */
                $url = $_SERVER['HTTP_REFERER'];
                $hold = array();
                $hold = explode("/", $url);
                $temp = $hold[count($hold) - 1];
                /*  end     */
                $data = array(
                    'lecturer_feedback_timedate' => time(),
                    'lecturer_feedback_comment' => $feedback,
                    'lecturer_feedback_department' => $this->session->userdata('userInfo')['user']->student_program,
                    'student_id' => $this->session->userdata('userInfo')['user']->student_id,
                    'lecturer_id' => $temp,
                    'enrollment_id' => $enrollment_id,
                    'offering_id' => $this->session->userdata('userInfo')['user']->offering_id
                );
                $this->Crud_model->insert('lecturer_feedback', $data);
                redirect('feedback');
            } else {    //the student is in an inactive enrollment; theoretically should work; not yet tested
                $this->load->view('feedback/error', $data);
                include(APPPATH . 'views\feedback\custom1.php');
            }
            $this->load->view('includes/footer');
//
        } else {
            redirect("home");
        }
    }

}
