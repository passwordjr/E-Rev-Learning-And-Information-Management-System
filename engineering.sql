-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2018 at 02:36 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `engineering`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(20) NOT NULL,
  `activity_date_time` int(20) NOT NULL,
  `activity_venue` varchar(20) NOT NULL,
  `activity_status` tinyint(1) NOT NULL,
  `activity_description` varchar(500) NOT NULL,
  `activity_details_id` int(20) NOT NULL,
  `topic_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_date_time`, `activity_venue`, `activity_status`, `activity_description`, `activity_details_id`, `topic_id`) VALUES
(1, 1515640639, 't501', 1, 'This will be our first quiz for the first semester, be prepared!', 1, 1),
(2, 1515727219, 'f605', 1, 'First lecture of this semester, be sure to pack all your things and leave nothing behind! We\'re going to have an adventure!', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `activity_details`
--

CREATE TABLE `activity_details` (
  `activity_details_id` int(20) NOT NULL,
  `activity_details_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_details`
--

INSERT INTO `activity_details` (`activity_details_id`, `activity_details_name`) VALUES
(1, 'Lecture'),
(2, 'Seatwork'),
(3, 'Quiz');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(20) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `midname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `image_path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `firstname`, `midname`, `lastname`, `image_path`) VALUES
(202011111, 'Ange', 'Ecu', 'Gana', 'admin1', 'admin', 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg'),
(999999999, 'admin2', 'admin', 'admin', 'admin', 'admin', 'awdsawdsa');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int(20) NOT NULL,
  `announcement_title` varchar(100) NOT NULL,
  `announcement_content` varchar(800) NOT NULL,
  `announcement_created_at` int(20) NOT NULL,
  `announcement_edited_at` int(20) NOT NULL,
  `announcement_is_active` tinyint(1) NOT NULL,
  `announcement_audience` tinyint(1) NOT NULL,
  `announcement_announcer_id` int(20) NOT NULL,
  `announcement_identifier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcement_id`, `announcement_title`, `announcement_content`, `announcement_created_at`, `announcement_edited_at`, `announcement_is_active`, `announcement_audience`, `announcement_announcer_id`, `announcement_identifier`) VALUES
(1, 'This is an announcement', 'Et nulla magna dolore aute duis dolore ex ex sit ullamco consequat non in id id laborum duis ea aute dolor incididunt do labore nisi anim sed nisi dolor dolore labore ea dolor in incididunt aute esse enim sunt esse sit in laborum aute consequat esse velit consequat cupidatat id voluptate dolor excepteur incididunt anim reprehenderit cillum dolore consequat aute sunt esse minim in excepteur ut culpa pariatur nulla culpa excepteur nisi ut aute aute nulla ad deserunt excepteur amet ex eu ea do enim amet deserunt aliqua pariatur veniam adipisicing ullamco incididunt amet consectetur do amet esse pariatur mollit in qui veniam ex dolore eu id dolore sunt in in aute veniam eiusmod in exercitation mollit fugiat duis minim incididunt commodo veniam sint sit amet anim veniam pariatur ad sunt quis re', 1515589773, 1515589773, 1, 1, 202011111, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `choice`
--

CREATE TABLE `choice` (
  `choice_id` int(20) NOT NULL,
  `choice_content` varchar(500) NOT NULL,
  `choice_is_correct` int(1) NOT NULL,
  `courseware_question_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(20) NOT NULL,
  `comment_content` varchar(500) NOT NULL,
  `comment_user_id` int(20) NOT NULL,
  `courseware_question_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courseware_question`
--

CREATE TABLE `courseware_question` (
  `courseware_question_id` int(20) NOT NULL,
  `courseware_question_question` varchar(800) NOT NULL,
  `courseware_question_reference` varchar(800) DEFAULT NULL,
  `topic_id` int(20) NOT NULL,
  `grade_assessment_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_modules`
--

CREATE TABLE `course_modules` (
  `courseware_file_id` int(20) NOT NULL,
  `courseware_file_path` varchar(100) NOT NULL,
  `topic_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(20) NOT NULL,
  `enrollment_sy` varchar(20) NOT NULL,
  `enrollment_term` tinyint(1) NOT NULL,
  `enrollment_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `enrollment_sy`, `enrollment_term`, `enrollment_is_active`) VALUES
(1, '2017-2018', 2, 1),
(2, '2017-2018', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `grade_assessment`
--

CREATE TABLE `grade_assessment` (
  `grade_assessment_id` int(20) NOT NULL,
  `grade_assessment_score` int(10) NOT NULL,
  `grade_assessment_total` int(10) NOT NULL,
  `grade_assessment_percentage` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `lecturer_id` int(20) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `midname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `lecturer_expertise` varchar(300) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lecturer_email` varchar(50) NOT NULL,
  `lecturer_status` tinyint(1) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  `lecturer_is_confirm` tinyint(1) NOT NULL,
  `topic_id` int(20) NOT NULL,
  `schedule_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lecturer_id`, `firstname`, `midname`, `lastname`, `lecturer_expertise`, `username`, `password`, `lecturer_email`, `lecturer_status`, `image_path`, `lecturer_is_confirm`, `topic_id`, `schedule_id`) VALUES
(201011111, 'Ronald', 'Gatan', 'Babaran', 'ME graduate', 'rbbabaran', 'ronald', 'rbbabaran@gmail.com', 1, 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg', 1, 1, 1),
(201022222, 'Marivic', 'Gannaban', 'Gatan', 'Accountancy', 'mggatan', 'marivic', 'mggatan@gmail.com', 1, 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_attendance`
--

CREATE TABLE `lecturer_attendance` (
  `lecturer_attendance_id` int(20) NOT NULL,
  `lecturer_attendance_date` int(20) NOT NULL,
  `lecturer_attendance_in` int(20) DEFAULT NULL,
  `lecturer_attendance_out` int(20) DEFAULT NULL,
  `offering_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer_attendance`
--

INSERT INTO `lecturer_attendance` (`lecturer_attendance_id`, `lecturer_attendance_date`, `lecturer_attendance_in`, `lecturer_attendance_out`, `offering_id`) VALUES
(1, 1515455338, 1515455338, 1515476979, 1),
(2, 1515479755, 1515479755, 1515503216, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_feedback`
--

CREATE TABLE `lecturer_feedback` (
  `lecturer_feedback_id` int(20) NOT NULL,
  `lecturer_feedback_timedate` int(20) NOT NULL,
  `lecturer_feedback_comment` varchar(500) NOT NULL,
  `offering_id` int(20) NOT NULL,
  `student_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer_feedback`
--

INSERT INTO `lecturer_feedback` (`lecturer_feedback_id`, `lecturer_feedback_timedate`, `lecturer_feedback_comment`, `offering_id`, `student_id`) VALUES
(1, 1515455338, 'hey wassup this is comment', 1, 201511281);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(20) NOT NULL,
  `log_user_id` int(20) NOT NULL,
  `log_timedate` int(20) NOT NULL,
  `log_platform` tinyint(1) NOT NULL,
  `log_content_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_content`
--

CREATE TABLE `log_content` (
  `log_content_id` int(20) NOT NULL,
  `log_content_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offering`
--

CREATE TABLE `offering` (
  `offering_id` int(20) NOT NULL,
  `offering_course_code` varchar(20) NOT NULL,
  `offering_course_title` varchar(100) NOT NULL,
  `offering_program` varchar(10) NOT NULL,
  `offering_section` varchar(10) NOT NULL,
  `enrollment_id` int(20) NOT NULL,
  `professor_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offering`
--

INSERT INTO `offering` (`offering_id`, `offering_course_code`, `offering_course_title`, `offering_program`, `offering_section`, `enrollment_id`, `professor_id`) VALUES
(1, 'CORREL1', 'correl intro to solid mensuration', 'ECE', 'W31', 1, 201111112),
(2, 'CORREL2', 'intro to physics', 'CE', 'X31', 1, 201122222);

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(20) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `midname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `professor_department` varchar(30) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  `professor_email` varchar(50) NOT NULL,
  `image_path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `firstname`, `midname`, `lastname`, `professor_department`, `username`, `password`, `professor_email`, `image_path`) VALUES
(201111111, 'Allen', 'Pogi', 'Torres', 'ECE', 'aptorres@fit.edu.ph', 'aptorres', 'allen', 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg'),
(201111112, 'Juan Carlo', 'De Regla', 'Valencia', 'CE', 'jdvalencia@fit.edu.ph', 'jdvalencia', 'jc', 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg'),
(201122222, 'Angelo Markus', 'Buan', 'Zaguirre', 'ME', 'abzaguirre@fit.edu.ph', 'abzaguirre', 'markus', 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(20) NOT NULL,
  `schedule_start_time` int(20) NOT NULL,
  `schedule_end_time` int(20) NOT NULL,
  `schedule_venue` varchar(20) NOT NULL,
  `offering_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `schedule_start_time`, `schedule_end_time`, `schedule_venue`, `offering_id`) VALUES
(1, 1515325531, 1515411939, 'T807', 1),
(2, 1515629373, 1515640185, 'T706', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(20) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `midname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  `student_email` varchar(50) NOT NULL,
  `student_program` varchar(10) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  `offering_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `firstname`, `midname`, `lastname`, `username`, `password`, `student_email`, `student_program`, `image_path`, `offering_id`) VALUES
(201511281, 'Mark Denver', 'Gatan', 'Babaran', 'mgbabaran', 'mark', 'mgbabaran@fit.edu.ph', 'CE', 'D:/XAMPP/htdocs/Engineering/assets/img/profiles/profile.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(20) NOT NULL,
  `topic_name` varchar(100) NOT NULL,
  `topic_description` varchar(800) NOT NULL,
  `topic_done` int(11) NOT NULL,
  `offering_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`, `topic_description`, `topic_done`, `offering_id`) VALUES
(1, 'Trigonometry', 'Introduction to trigonometry', 0, 1),
(2, 'Solid Mensuration', 'I don\'t even know what are the topics that they\'re tackling in here', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `total_grade`
--

CREATE TABLE `total_grade` (
  `total_grade_id` int(11) NOT NULL,
  `total_grade_total` varchar(45) NOT NULL,
  `topic_topic_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_activity_activity_details1_idx` (`activity_details_id`),
  ADD KEY `fk_activity_topic1_idx` (`topic_id`);

--
-- Indexes for table `activity_details`
--
ALTER TABLE `activity_details`
  ADD PRIMARY KEY (`activity_details_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `choice`
--
ALTER TABLE `choice`
  ADD PRIMARY KEY (`choice_id`),
  ADD KEY `fk_choice_courseware_question1_idx` (`courseware_question_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comment_courseware_question1_idx` (`courseware_question_id`);

--
-- Indexes for table `courseware_question`
--
ALTER TABLE `courseware_question`
  ADD PRIMARY KEY (`courseware_question_id`),
  ADD KEY `fk_courseware_question_topic1_idx` (`topic_id`),
  ADD KEY `fk_courseware_question_grade_assessment1_idx` (`grade_assessment_id`);

--
-- Indexes for table `course_modules`
--
ALTER TABLE `course_modules`
  ADD PRIMARY KEY (`courseware_file_id`),
  ADD KEY `fk_courseware_file_topic1_idx` (`topic_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `grade_assessment`
--
ALTER TABLE `grade_assessment`
  ADD PRIMARY KEY (`grade_assessment_id`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`lecturer_id`),
  ADD KEY `fk_lecturer_topic1_idx` (`topic_id`),
  ADD KEY `fk_lecturer_schedule1_idx` (`schedule_id`);

--
-- Indexes for table `lecturer_attendance`
--
ALTER TABLE `lecturer_attendance`
  ADD PRIMARY KEY (`lecturer_attendance_id`),
  ADD KEY `fk_lecturer_attendance_offering_idx` (`offering_id`);

--
-- Indexes for table `lecturer_feedback`
--
ALTER TABLE `lecturer_feedback`
  ADD PRIMARY KEY (`lecturer_feedback_id`),
  ADD KEY `fk_lecturer_feedback_offering1_idx` (`offering_id`),
  ADD KEY `fk_lecturer_feedback_student1_idx` (`student_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_log_log_content1_idx` (`log_content_id`);

--
-- Indexes for table `log_content`
--
ALTER TABLE `log_content`
  ADD PRIMARY KEY (`log_content_id`);

--
-- Indexes for table `offering`
--
ALTER TABLE `offering`
  ADD PRIMARY KEY (`offering_id`),
  ADD KEY `fk_offering_enrollment1_idx` (`enrollment_id`),
  ADD KEY `fk_offering_professor1_idx` (`professor_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `fk_schedule_offering1_idx` (`offering_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_student_offering1_idx` (`offering_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `fk_topic_offering1_idx` (`offering_id`);

--
-- Indexes for table `total_grade`
--
ALTER TABLE `total_grade`
  ADD PRIMARY KEY (`total_grade_id`),
  ADD KEY `fk_total_grade_topic1_idx` (`topic_topic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `activity_details`
--
ALTER TABLE `activity_details`
  MODIFY `activity_details_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `choice`
--
ALTER TABLE `choice`
  MODIFY `choice_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courseware_question`
--
ALTER TABLE `courseware_question`
  MODIFY `courseware_question_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_modules`
--
ALTER TABLE `course_modules`
  MODIFY `courseware_file_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grade_assessment`
--
ALTER TABLE `grade_assessment`
  MODIFY `grade_assessment_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_content`
--
ALTER TABLE `log_content`
  MODIFY `log_content_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offering`
--
ALTER TABLE `offering`
  MODIFY `offering_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `total_grade`
--
ALTER TABLE `total_grade`
  MODIFY `total_grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_activity_activity_details1` FOREIGN KEY (`activity_details_id`) REFERENCES `activity_details` (`activity_details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activity_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `choice`
--
ALTER TABLE `choice`
  ADD CONSTRAINT `fk_choice_courseware_question1` FOREIGN KEY (`courseware_question_id`) REFERENCES `courseware_question` (`courseware_question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_courseware_question1` FOREIGN KEY (`courseware_question_id`) REFERENCES `courseware_question` (`courseware_question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `courseware_question`
--
ALTER TABLE `courseware_question`
  ADD CONSTRAINT `fk_courseware_question_grade_assessment1` FOREIGN KEY (`grade_assessment_id`) REFERENCES `grade_assessment` (`grade_assessment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_courseware_question_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course_modules`
--
ALTER TABLE `course_modules`
  ADD CONSTRAINT `fk_courseware_file_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `fk_lecturer_schedule1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lecturer_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lecturer_attendance`
--
ALTER TABLE `lecturer_attendance`
  ADD CONSTRAINT `fk_lecturer_attendance_offering` FOREIGN KEY (`offering_id`) REFERENCES `offering` (`offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lecturer_feedback`
--
ALTER TABLE `lecturer_feedback`
  ADD CONSTRAINT `fk_lecturer_feedback_offering1` FOREIGN KEY (`offering_id`) REFERENCES `offering` (`offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lecturer_feedback_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_log_content1` FOREIGN KEY (`log_content_id`) REFERENCES `log_content` (`log_content_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `offering`
--
ALTER TABLE `offering`
  ADD CONSTRAINT `fk_offering_enrollment1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_offering_professor1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fk_schedule_offering1` FOREIGN KEY (`offering_id`) REFERENCES `offering` (`offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_offering1` FOREIGN KEY (`offering_id`) REFERENCES `offering` (`offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `fk_topic_offering1` FOREIGN KEY (`offering_id`) REFERENCES `offering` (`offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `total_grade`
--
ALTER TABLE `total_grade`
  ADD CONSTRAINT `fk_total_grade_topic1` FOREIGN KEY (`topic_topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
