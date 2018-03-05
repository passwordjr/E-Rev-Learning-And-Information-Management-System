-- MySQL Script generated by MySQL Workbench
-- Mon Mar  5 14:26:58 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema engineering
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema engineering
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `engineering` DEFAULT CHARACTER SET utf8 ;
USE `engineering` ;

-- -----------------------------------------------------
-- Table `engineering`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`lecturer` (
  `lecturer_id` INT(20) NOT NULL AUTO_INCREMENT,
  `id_number` INT(20) NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `midname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `lecturer_expertise` VARCHAR(300) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `lecturer_status` TINYINT(1) NOT NULL DEFAULT 0,
  `image_path` VARCHAR(100) NOT NULL,
  `lecturer_is_confirm` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lecturer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`enrollment` (
  `enrollment_id` INT(20) NOT NULL AUTO_INCREMENT,
  `enrollment_sy` VARCHAR(20) NOT NULL,
  `enrollment_term` TINYINT(1) NOT NULL,
  `enrollment_is_active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`enrollment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`professor` (
  `professor_id` INT(20) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `midname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `professor_department` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `image_path` VARCHAR(100) NOT NULL,
  `professor_feedback_active` TINYINT(1) NOT NULL DEFAULT 0,
  `professor_status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`professor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`year_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`year_level` (
  `year_level_id` INT(20) NOT NULL AUTO_INCREMENT,
  `year_level_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`year_level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`course` (
  `course_id` INT(20) NOT NULL AUTO_INCREMENT,
  `course_course_code` VARCHAR(20) NOT NULL,
  `course_course_title` VARCHAR(100) NOT NULL,
  `course_department` VARCHAR(10) NOT NULL,
  `course_is_active` TINYINT(1) NOT NULL,
  `enrollment_id` INT(20) NOT NULL,
  `professor_id` INT(20) NOT NULL,
  `year_level_id` INT(20) NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_offering_enrollment1_idx` (`enrollment_id` ASC),
  INDEX `fk_offering_professor1_idx` (`professor_id` ASC),
  UNIQUE INDEX `course_course_code_UNIQUE` (`course_course_code` ASC),
  UNIQUE INDEX `course_course_title_UNIQUE` (`course_course_title` ASC),
  INDEX `fk_course_year_level1_idx` (`year_level_id` ASC),
  CONSTRAINT `fk_offering_enrollment1`
    FOREIGN KEY (`enrollment_id`)
    REFERENCES `engineering`.`enrollment` (`enrollment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offering_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `engineering`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_year_level1`
    FOREIGN KEY (`year_level_id`)
    REFERENCES `engineering`.`year_level` (`year_level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`fic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`fic` (
  `fic_id` INT(20) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `midname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `image_path` VARCHAR(100) NOT NULL,
  `fic_department` VARCHAR(5) NOT NULL,
  `fic_status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`fic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`offering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`offering` (
  `offering_id` INT(20) NOT NULL,
  `offering_name` VARCHAR(20) NOT NULL,
  `offering_department` VARCHAR(5) NOT NULL,
  `course_id` INT(20) NOT NULL,
  `fic_id` INT(20) NOT NULL,
  PRIMARY KEY (`offering_id`),
  INDEX `fk_offering_course1_idx` (`course_id` ASC),
  INDEX `fk_offering_fic1_idx` (`fic_id` ASC),
  CONSTRAINT `fk_offering_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `engineering`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offering_fic1`
    FOREIGN KEY (`fic_id`)
    REFERENCES `engineering`.`fic` (`fic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`student` (
  `student_id` INT(20) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `midname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `student_department` VARCHAR(10) NOT NULL,
  `image_path` VARCHAR(100) NOT NULL,
  `offering_id` INT(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_offering1_idx` (`offering_id` ASC),
  CONSTRAINT `fk_student_offering1`
    FOREIGN KEY (`offering_id`)
    REFERENCES `engineering`.`offering` (`offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`lecturer_feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`lecturer_feedback` (
  `lecturer_feedback_id` INT(20) NOT NULL AUTO_INCREMENT,
  `lecturer_feedback_timedate` INT(20) NOT NULL,
  `lecturer_feedback_comment` VARCHAR(500) NOT NULL,
  `lecturer_feedback_department` VARCHAR(5) NOT NULL,
  `student_id` INT(20) NOT NULL,
  `lecturer_id` INT(20) NOT NULL,
  `enrollment_id` INT(20) NOT NULL,
  `offering_id` INT(20) NOT NULL,
  PRIMARY KEY (`lecturer_feedback_id`),
  INDEX `fk_lecturer_feedback_student1_idx` (`student_id` ASC),
  INDEX `fk_lecturer_feedback_lecturer1_idx` (`lecturer_id` ASC),
  INDEX `fk_lecturer_feedback_enrollment1_idx` (`enrollment_id` ASC),
  INDEX `fk_lecturer_feedback_offering1_idx` (`offering_id` ASC),
  CONSTRAINT `fk_lecturer_feedback_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `engineering`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_feedback_lecturer1`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `engineering`.`lecturer` (`lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_feedback_enrollment1`
    FOREIGN KEY (`enrollment_id`)
    REFERENCES `engineering`.`enrollment` (`enrollment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_feedback_offering1`
    FOREIGN KEY (`offering_id`)
    REFERENCES `engineering`.`offering` (`offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`schedule` (
  `schedule_id` INT(20) NOT NULL AUTO_INCREMENT,
  `schedule_start_time` INT(20) NOT NULL,
  `schedule_end_time` INT(20) NOT NULL,
  `schedule_venue` VARCHAR(20) NOT NULL,
  `lecturer_id` INT(20) NOT NULL,
  `offering_id` INT(20) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `fk_schedule_lecturer1_idx` (`lecturer_id` ASC),
  INDEX `fk_schedule_offering1_idx` (`offering_id` ASC),
  CONSTRAINT `fk_schedule_lecturer1`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `engineering`.`lecturer` (`lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_offering1`
    FOREIGN KEY (`offering_id`)
    REFERENCES `engineering`.`offering` (`offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`activity_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`activity_details` (
  `activity_details_id` INT(20) NOT NULL AUTO_INCREMENT,
  `activity_details_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`activity_details_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`activity_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`activity_schedule` (
  `activity_schedule_id` INT(20) NOT NULL AUTO_INCREMENT,
  `activity_schedule_date` INT(10) NOT NULL,
  `activity_schedule_start_time` INT(10) NOT NULL,
  `activity_schedule_end_time` INT(20) NOT NULL,
  PRIMARY KEY (`activity_schedule_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`activity` (
  `activity_id` INT(20) NOT NULL AUTO_INCREMENT,
  `activity_venue` VARCHAR(20) NOT NULL,
  `activity_status` TINYINT(1) NOT NULL,
  `activity_description` VARCHAR(500) NOT NULL,
  `activity_details_id` INT(20) NOT NULL,
  `lecturer_id` INT(20) NULL,
  `offering_id` INT(20) NOT NULL,
  `activity_schedule_id` INT(20) NOT NULL,
  PRIMARY KEY (`activity_id`),
  INDEX `fk_activity_activity_details1_idx` (`activity_details_id` ASC),
  INDEX `fk_activity_lecturer1_idx` (`lecturer_id` ASC),
  INDEX `fk_activity_offering1_idx` (`offering_id` ASC),
  INDEX `fk_activity_activity_schedule1_idx` (`activity_schedule_id` ASC),
  CONSTRAINT `fk_activity_activity_details1`
    FOREIGN KEY (`activity_details_id`)
    REFERENCES `engineering`.`activity_details` (`activity_details_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_lecturer1`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `engineering`.`lecturer` (`lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_offering1`
    FOREIGN KEY (`offering_id`)
    REFERENCES `engineering`.`offering` (`offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_schedule1`
    FOREIGN KEY (`activity_schedule_id`)
    REFERENCES `engineering`.`activity_schedule` (`activity_schedule_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`admin` (
  `admin_id` INT(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `midname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `image_path` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`subject` (
  `subject_id` INT(20) NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(45) NOT NULL,
  `subject_description` VARCHAR(800) NULL,
  `lecturer_id` INT(20) NULL,
  `course_id` INT(20) NOT NULL,
  PRIMARY KEY (`subject_id`),
  INDEX `fk_subject_lecturer1_idx` (`lecturer_id` ASC),
  INDEX `fk_subject_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_subject_lecturer1`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `engineering`.`lecturer` (`lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `engineering`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`topic` (
  `topic_id` INT(20) NOT NULL AUTO_INCREMENT,
  `topic_name` VARCHAR(100) NOT NULL,
  `topic_description` VARCHAR(800) NULL,
  `topic_done` INT NOT NULL,
  `subject_id` INT(20) NOT NULL,
  PRIMARY KEY (`topic_id`),
  INDEX `fk_topic_subject1_idx` (`subject_id` ASC),
  CONSTRAINT `fk_topic_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `engineering`.`subject` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`courseware`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`courseware` (
  `courseware_id` INT(50) NOT NULL AUTO_INCREMENT,
  `courseware_name` VARCHAR(100) NOT NULL,
  `courseware_description` VARCHAR(800) NULL,
  `courseware_date_added` INT(20) NOT NULL,
  `courseware_date_edited` INT(20) NOT NULL,
  `courseware_status` TINYINT(1) NULL DEFAULT 1,
  `topic_id` INT(20) NOT NULL,
  PRIMARY KEY (`courseware_id`),
  INDEX `fk_courseware_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_courseware_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `engineering`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`courseware_question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`courseware_question` (
  `courseware_question_id` INT(20) NOT NULL AUTO_INCREMENT,
  `courseware_question_question` TEXT NOT NULL,
  `courseware_question_status` TINYINT(1) NOT NULL DEFAULT 1,
  `courseware_id` INT(50) NOT NULL,
  PRIMARY KEY (`courseware_question_id`),
  INDEX `fk_courseware_question_courseware1_idx` (`courseware_id` ASC),
  CONSTRAINT `fk_courseware_question_courseware1`
    FOREIGN KEY (`courseware_id`)
    REFERENCES `engineering`.`courseware` (`courseware_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`course_modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`course_modules` (
  `courseware_file_id` INT(20) NOT NULL AUTO_INCREMENT,
  `courseware_file_path` VARCHAR(100) NOT NULL,
  `subject_id` INT(20) NOT NULL,
  PRIMARY KEY (`courseware_file_id`),
  INDEX `fk_course_modules_subject1_idx` (`subject_id` ASC),
  CONSTRAINT `fk_course_modules_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `engineering`.`subject` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`announcement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`announcement` (
  `announcement_id` INT(20) NOT NULL AUTO_INCREMENT,
  `announcement_title` VARCHAR(100) NOT NULL,
  `announcement_content` VARCHAR(800) NOT NULL,
  `announcement_created_at` INT(20) NOT NULL,
  `announcement_edited_at` INT(20) NOT NULL,
  `announcement_is_active` TINYINT(1) NOT NULL,
  `announcement_audience` VARCHAR(10) NOT NULL,
  `announcement_announcer` VARCHAR(100) NOT NULL,
  `announcement_start_datetime` INT(15) NOT NULL,
  `announcement_end_datetime` INT(15) NOT NULL,
  PRIMARY KEY (`announcement_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`choice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`choice` (
  `choice_id` INT(20) NOT NULL AUTO_INCREMENT,
  `choice_choice` VARCHAR(800) NOT NULL,
  `choice_is_answer` TINYINT(1) NOT NULL,
  `courseware_question_id` INT(20) NOT NULL,
  PRIMARY KEY (`choice_id`),
  INDEX `fk_choice_courseware_question1_idx` (`courseware_question_id` ASC),
  CONSTRAINT `fk_choice_courseware_question1`
    FOREIGN KEY (`courseware_question_id`)
    REFERENCES `engineering`.`courseware_question` (`courseware_question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`comment` (
  `comment_id` INT(20) NOT NULL AUTO_INCREMENT,
  `comment_content` VARCHAR(500) NOT NULL,
  `comment_user_id` INT(20) NOT NULL,
  `courseware_question_id` INT(20) NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_courseware_question1_idx` (`courseware_question_id` ASC),
  CONSTRAINT `fk_comment_courseware_question1`
    FOREIGN KEY (`courseware_question_id`)
    REFERENCES `engineering`.`courseware_question` (`courseware_question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`log_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`log_content` (
  `log_content_id` INT(20) NOT NULL AUTO_INCREMENT,
  `log_content_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`log_content_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`log` (
  `log_id` INT(20) NOT NULL AUTO_INCREMENT,
  `log_user_id` INT(20) NOT NULL,
  `log_timedate` INT(20) NOT NULL,
  `log_platform` TINYINT(1) NOT NULL,
  `log_content_id` INT(20) NOT NULL,
  PRIMARY KEY (`log_id`),
  INDEX `fk_log_log_content1_idx` (`log_content_id` ASC),
  CONSTRAINT `fk_log_log_content1`
    FOREIGN KEY (`log_content_id`)
    REFERENCES `engineering`.`log_content` (`log_content_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`grade_assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`grade_assessment` (
  `grade_assessment_id` INT(20) NOT NULL AUTO_INCREMENT,
  `grade_assessment_score` INT(10) NOT NULL,
  `grade_assessment_total` INT(10) NOT NULL,
  `student_id` INT(20) NOT NULL,
  `courseware_id` INT(50) NOT NULL,
  `courseware_question_id` INT(20) NOT NULL,
  PRIMARY KEY (`grade_assessment_id`),
  INDEX `fk_grade_assessment_student1_idx` (`student_id` ASC),
  INDEX `fk_grade_assessment_courseware1_idx` (`courseware_id` ASC),
  INDEX `fk_grade_assessment_courseware_question1_idx` (`courseware_question_id` ASC),
  CONSTRAINT `fk_grade_assessment_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `engineering`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grade_assessment_courseware1`
    FOREIGN KEY (`courseware_id`)
    REFERENCES `engineering`.`courseware` (`courseware_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grade_assessment_courseware_question1`
    FOREIGN KEY (`courseware_question_id`)
    REFERENCES `engineering`.`courseware_question` (`courseware_question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`total_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`total_grade` (
  `total_grade_id` INT NOT NULL AUTO_INCREMENT,
  `total_grade_total` VARCHAR(45) NOT NULL,
  `subject_id` INT(20) NOT NULL,
  `student_id` INT(20) NOT NULL,
  PRIMARY KEY (`total_grade_id`),
  INDEX `fk_total_grade_subject1_idx` (`subject_id` ASC),
  INDEX `fk_total_grade_student1_idx` (`student_id` ASC),
  CONSTRAINT `fk_total_grade_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `engineering`.`subject` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_total_grade_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `engineering`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`lecturer_attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`lecturer_attendance` (
  `lecturer_attendance_id` INT(50) NOT NULL,
  `lecturer_attendance_date` INT(20) NOT NULL,
  `lecturer_id` INT(20) NOT NULL,
  `offering_id` INT(20) NOT NULL,
  `schedule_id` INT(20) NOT NULL,
  PRIMARY KEY (`lecturer_attendance_id`),
  INDEX `fk_lecturer_attendance_lecturer1_idx` (`lecturer_id` ASC),
  INDEX `fk_lecturer_attendance_offering1_idx` (`offering_id` ASC),
  INDEX `fk_lecturer_attendance_schedule1_idx` (`schedule_id` ASC),
  CONSTRAINT `fk_lecturer_attendance_lecturer1`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `engineering`.`lecturer` (`lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_attendance_offering1`
    FOREIGN KEY (`offering_id`)
    REFERENCES `engineering`.`offering` (`offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_attendance_schedule1`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `engineering`.`schedule` (`schedule_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`attendance_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`attendance_in` (
  `attendance_in_id` INT(20) NOT NULL,
  `attendance_in_time` INT(20) NOT NULL,
  `lecturer_attendance_id` INT(50) NOT NULL,
  PRIMARY KEY (`attendance_in_id`),
  INDEX `fk_attendance_in_lecturer_attendance1_idx` (`lecturer_attendance_id` ASC),
  CONSTRAINT `fk_attendance_in_lecturer_attendance1`
    FOREIGN KEY (`lecturer_attendance_id`)
    REFERENCES `engineering`.`lecturer_attendance` (`lecturer_attendance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`attendance_out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`attendance_out` (
  `attendance_out_id` INT(20) NOT NULL,
  `attendance_out_time` INT(20) NOT NULL,
  `lecturer_attendance_id` INT(50) NOT NULL,
  PRIMARY KEY (`attendance_out_id`),
  INDEX `fk_attendance_out_lecturer_attendance1_idx` (`lecturer_attendance_id` ASC),
  CONSTRAINT `fk_attendance_out_lecturer_attendance1`
    FOREIGN KEY (`lecturer_attendance_id`)
    REFERENCES `engineering`.`lecturer_attendance` (`lecturer_attendance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`subject_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`subject_list` (
  `subject_list_id` INT(20) NOT NULL AUTO_INCREMENT,
  `subject_list_name` VARCHAR(100) NOT NULL,
  `subject_list_department` VARCHAR(5) NOT NULL,
  `subject_list_is_active` TINYINT(1) NOT NULL,
  `year_level_id` INT(20) NOT NULL,
  PRIMARY KEY (`subject_list_id`),
  INDEX `fk_subject_list_year_level1_idx` (`year_level_id` ASC),
  CONSTRAINT `fk_subject_list_year_level1`
    FOREIGN KEY (`year_level_id`)
    REFERENCES `engineering`.`year_level` (`year_level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`topic_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`topic_list` (
  `topic_list_id` INT(20) NOT NULL AUTO_INCREMENT,
  `topic_list_name` VARCHAR(100) NOT NULL,
  `topic_list_is_active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`topic_list_id`),
  UNIQUE INDEX `topic_list_name_UNIQUE` (`topic_list_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`subject_list_has_topic_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`subject_list_has_topic_list` (
  `subject_list_id` INT(20) NOT NULL,
  `topic_list_id` INT(20) NOT NULL,
  PRIMARY KEY (`subject_list_id`, `topic_list_id`),
  INDEX `fk_subject_list_has_topic_list_topic_list1_idx` (`topic_list_id` ASC),
  INDEX `fk_subject_list_has_topic_list_subject_list1_idx` (`subject_list_id` ASC),
  CONSTRAINT `fk_subject_list_has_topic_list_subject_list1`
    FOREIGN KEY (`subject_list_id`)
    REFERENCES `engineering`.`subject_list` (`subject_list_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_list_has_topic_list_topic_list1`
    FOREIGN KEY (`topic_list_id`)
    REFERENCES `engineering`.`topic_list` (`topic_list_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`data_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`data_scores` (
  `data_scores_id` INT(20) NOT NULL AUTO_INCREMENT,
  `data_scores_type` TINYINT(1) NOT NULL,
  `data_scores_score` INT(45) NOT NULL,
  `data_scores_passing` INT(45) NOT NULL,
  PRIMARY KEY (`data_scores_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`student_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`student_scores` (
  `student_scores_id` INT(20) NOT NULL AUTO_INCREMENT,
  `student_scores_is_failed` TINYINT(1) NOT NULL,
  `student_scores_score` INT(45) NOT NULL,
  `student_scores_stud_num` INT(10) NOT NULL,
  `topic_topic_id` INT(20) NOT NULL,
  `course_id` INT(20) NOT NULL,
  `data_scores_id` INT(20) NOT NULL,
  PRIMARY KEY (`student_scores_id`),
  INDEX `fk_student_scores_topic1_idx` (`topic_topic_id` ASC),
  INDEX `fk_student_scores_course1_idx` (`course_id` ASC),
  INDEX `fk_student_scores_data_scores1_idx` (`data_scores_id` ASC),
  CONSTRAINT `fk_student_scores_topic1`
    FOREIGN KEY (`topic_topic_id`)
    REFERENCES `engineering`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_scores_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `engineering`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_scores_data_scores1`
    FOREIGN KEY (`data_scores_id`)
    REFERENCES `engineering`.`data_scores` (`data_scores_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`student_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`student_answer` (
  `student_answer_id` INT NOT NULL AUTO_INCREMENT,
  `courseware_question_id` INT(20) NOT NULL,
  `choice_id` INT(20) NOT NULL,
  `student_id` INT(20) NOT NULL,
  PRIMARY KEY (`student_answer_id`),
  INDEX `fk_student_answer_courseware_question1_idx` (`courseware_question_id` ASC),
  INDEX `fk_student_answer_choice1_idx` (`choice_id` ASC),
  INDEX `fk_student_answer_student1_idx` (`student_id` ASC),
  CONSTRAINT `fk_student_answer_courseware_question1`
    FOREIGN KEY (`courseware_question_id`)
    REFERENCES `engineering`.`courseware_question` (`courseware_question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_answer_choice1`
    FOREIGN KEY (`choice_id`)
    REFERENCES `engineering`.`choice` (`choice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_answer_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `engineering`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engineering`.`courseware_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engineering`.`courseware_time` (
  `courseware_time_id` INT(20) NOT NULL AUTO_INCREMENT,
  `courseware_time_time` INT(10) NOT NULL,
  `grade_assessment_id` INT(20) NOT NULL,
  PRIMARY KEY (`courseware_time_id`),
  INDEX `fk_courseware_time_grade_assessment1_idx` (`grade_assessment_id` ASC),
  CONSTRAINT `fk_courseware_time_grade_assessment1`
    FOREIGN KEY (`grade_assessment_id`)
    REFERENCES `engineering`.`grade_assessment` (`grade_assessment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
