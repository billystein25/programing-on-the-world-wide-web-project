-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2025 at 05:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesis_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `thesis_id` int(30) DEFAULT NULL,
  `filename` varchar(245) NOT NULL,
  `filepath` varchar(257) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `thesis_id`, `filename`, `filepath`) VALUES
(15, 3, 13, 'example.pdf', 'uploads/3/'),
(16, 3, 14, 'report_template.pdf', 'uploads/3/'),
(17, 4, 15, 'example.pdf', 'uploads/4/'),
(18, 1, 15, 'example.pdf', 'uploads/1/'),
(19, 6, 16, 'example.pdf', 'uploads/6/');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(30) NOT NULL,
  `relation_id` int(30) NOT NULL,
  `teach_email` varchar(63) NOT NULL,
  `status` enum('pending','declined','accepted','slots_complete') DEFAULT 'pending',
  `request_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `reply_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `relation_id`, `teach_email`, `status`, `request_datetime`, `reply_datetime`) VALUES
(1, 2, 'teach1@upnet.gr', 'accepted', '2025-09-12 01:29:44', '0000-00-00 00:00:00'),
(2, 2, 'teach3@upnet.gr', 'declined', '2025-09-12 02:30:14', '0000-00-00 00:00:00'),
(3, 2, 'teach4@upnet.gr', 'accepted', '2025-09-12 05:20:05', '0000-00-00 00:00:00'),
(4, 3, 'teach4@upnet.gr', 'slots_complete', '2025-09-12 05:47:41', '2025-09-12 05:48:16'),
(5, 3, 'teach2@webmail.gr', 'accepted', '2025-09-12 05:47:43', '0000-00-00 00:00:00'),
(6, 3, 'teach1@upnet.gr', 'accepted', '2025-09-12 05:47:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `secretary`
--

CREATE TABLE `secretary` (
  `email` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secretary`
--

INSERT INTO `secretary` (`email`) VALUES
('sec1@webmail.gr');

-- --------------------------------------------------------

--
-- Table structure for table `sql_logs`
--

CREATE TABLE `sql_logs` (
  `id` int(30) NOT NULL,
  `sql_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sql_logs`
--

INSERT INTO `sql_logs` (`id`, `sql_text`) VALUES
(1, 'INSERT INTO user VALUES (DEFAULT, \'stu1@upnet.gr\', \'$2y$10$Sg5YtOVdTJh3DHel7hKyJukOf3zNbgqtN9i0pBWnfqSPPl49Bf0C.\', \'stu1\', \'ser1\', \'student\', DEFAULT)'),
(2, 'INSERT INTO student VALUES(\'stu1@upnet.gr\', \'1097439\', \'street\', \'10\', \'Patras\', \'26558\', \'Dim\',  \'6940000000\', \'2100000000\')'),
(3, 'INSERT INTO user VALUES (DEFAULT, \'sec1@webmail.gr\', \'$2y$10$7akrNEriyVRJi2QKaG2pW.O0gLPJGv4X7Cz3yAazjwNpwQYpsce/2\', \'sec1\', \'sursec1\', \'secretary\', DEFAULT)'),
(4, 'INSERT INTO secretary VALUES(\'sec1@webmail.gr\')'),
(5, 'INSERT INTO user VALUES (DEFAULT, \'teach1@upnet.gr\', \'$2y$10$ogpd7VD7Lk3dgxGxe2PVBeikxvwp.C6m.j5Z0.L6HgyJU81ogUq/q\', \'teach1\', \'surteach1\', \'teacher\', DEFAULT)'),
(6, 'INSERT INTO teacher VALUES(\'teach1@upnet.gr\', \'Programming\', \'2260000000\', \'6930000000\', \'CEID\', \'Patras\')'),
(7, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teacher 1 thesis 1 title\', \'teacher 1 thesis 1 desc\')'),
(8, 'file name: example.pdf'),
(9, 'INSERT INTO files VALUES (DEFAULT, 3, 1, \'example.pdf\', \'uploads/3/\')'),
(10, 'heading to assign student page with student email: stu1@upnet.gr'),
(11, 'set student email to: stu1@upnet.gr'),
(12, 'set student email to: stu1@upnet.gr'),
(13, 'set student email to: stu1@upnet.gr'),
(14, 'set student email to: stu1@upnet.gr'),
(15, 'set student email to: stu1@upnet.gr'),
(16, 'heading to assign student page with student email: stu1@upnet.gr'),
(17, 'set student email to: stu1@upnet.gr'),
(18, 'set student email to: stu1@upnet.gr'),
(19, 'set student email to: stu1@upnet.gr'),
(20, 'set student email to: stu1@upnet.gr'),
(21, 'set student email to: stu1@upnet.gr'),
(22, 'heading to assign student page with student email: stu1@upnet.gr'),
(23, 'set student email to: stu1@upnet.gr'),
(24, 'set student email to: stu1@upnet.gr'),
(25, 'INSERT INTO student_thesis_relation VALUES(DEFAULT, \'stu1@upnet.gr\', \'1\', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)'),
(26, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teacher 1 thesis 2 title\', \'teacher 1 thesis 2 desc\')'),
(27, 'file name: example.pdf'),
(28, 'INSERT INTO files VALUES (DEFAULT, 3, 2, \'example.pdf\', \'uploads/3/\')'),
(29, 'UPDATE thesis SET title = \'teacher 1 thesis 2 title edited\' WHERE id = \'2\''),
(30, 'UPDATE thesis SET description = \'teacher 1 thesis 2 desc edited\' WHERE id = \'2\''),
(31, 'file name: example.pdf'),
(32, 'file name: report_template.pdf'),
(33, 'INSERT INTO files VALUES (DEFAULT, 3, 2, \'report_template.pdf\', \'uploads/3/\')'),
(34, 'DELETE FROM files WHERE id = 2'),
(35, 'file name: example.pdf'),
(36, 'INSERT INTO files VALUES (DEFAULT, 3, 2, \'example.pdf\', \'uploads/3/\')'),
(37, 'DELETE FROM files WHERE id = 3'),
(38, 'file name: example.pdf'),
(39, 'file name: example.pdf'),
(40, 'DELETE FROM files WHERE id = 1'),
(41, 'INSERT INTO files VALUES (DEFAULT, 3, 1, \'example.pdf\', \'uploads/3/\')'),
(42, 'DELETE FROM files WHERE id = 1'),
(43, 'file name: example.pdf'),
(44, 'INSERT INTO files VALUES (DEFAULT, 3, 1, \'example.pdf\', \'uploads/3/\')'),
(45, 'DELETE FROM files WHERE id = 5'),
(46, 'file name: example.pdf'),
(47, 'INSERT INTO files VALUES (DEFAULT, 3, 1, \'example.pdf\', \'uploads/3/\')'),
(48, 'DELETE FROM files WHERE id = 7'),
(49, 'file name: example.pdf'),
(50, 'INSERT INTO files VALUES (DEFAULT, 3, 1, \'example.pdf\', \'uploads/3/\')'),
(51, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'new\', \'new\')'),
(52, 'file name: example.pdf'),
(53, 'DELETE FROM thesis WHERE id = \'1\''),
(54, 'DELETE FROM thesis WHERE id = \'2\''),
(55, 'DELETE FROM thesis WHERE id = \'3\''),
(56, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teacher 1 thesis 1 title\', \'teacher 1 thesis 1 desc\')'),
(57, 'file name: example.pdf'),
(58, 'DELETE FROM thesis WHERE id = \'4\''),
(59, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teach 1 thesis 1 title\', \'teach 1 thesis 1 desc\')'),
(60, 'file name: example.pdf'),
(61, 'DELETE FROM thesis WHERE id = \'5\''),
(62, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teach 1 thesis 1 title\', \'teach 1 thesis 1 desc\')'),
(63, 'file name: example.pdf'),
(64, 'INSERT INTO files VALUES (DEFAULT, 3, 6, \'example.pdf\', \'uploads/3/\')'),
(65, 'DELETE FROM thesis WHERE id = \'6\''),
(66, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'test\', \'test\')'),
(67, 'file name: example.pdf'),
(68, 'INSERT INTO files VALUES (DEFAULT, 3, 7, \'example.pdf\', \'uploads/3/\')'),
(69, 'DELETE FROM thesis WHERE id = \'7\''),
(70, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'tea\', \'tea\')'),
(71, 'file name: example.pdf'),
(72, 'DELETE FROM thesis WHERE id = \'8\''),
(73, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'fad\', \'fdas\')'),
(74, 'file name: example.pdf'),
(75, 'INSERT INTO files VALUES (DEFAULT, 3, 9, \'example.pdf\', \'uploads/3/\')'),
(76, 'DELETE FROM thesis WHERE id = \'9\''),
(77, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'fasd\', \'fasd\')'),
(78, 'file name: example.pdf'),
(79, 'INSERT INTO files VALUES (DEFAULT, 3, 10, \'example.pdf\', \'uploads/3/\')'),
(80, 'DELETE FROM thesis WHERE id = \'10\''),
(81, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'fads\', \'fasd\')'),
(82, 'file name: example.pdf'),
(83, 'INSERT INTO files VALUES (DEFAULT, 3, 11, \'example.pdf\', \'uploads/3/\')'),
(84, 'DELETE FROM thesis WHERE id = \'11\''),
(85, 'DELETE FROM files WHERE id = '),
(86, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'fda\', \'fa\')'),
(87, 'file name: example.pdf'),
(88, 'INSERT INTO files VALUES (DEFAULT, 3, 12, \'example.pdf\', \'uploads/3/\')'),
(89, 'DELETE FROM files WHERE id = 14'),
(90, 'DELETE FROM thesis WHERE id = \'12\''),
(91, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teacher 1 thesis 1 title\', \'teacher 1 thesis 1 desc\')'),
(92, 'file name: example.pdf'),
(93, 'INSERT INTO files VALUES (DEFAULT, 3, 13, \'example.pdf\', \'uploads/3/\')'),
(94, 'INSERT INTO thesis VALUES(DEFAULT, \'teach1@upnet.gr\', \'teacher 1 thesis 2 title\', \'teacher 1 thesis 2 desc\')'),
(95, 'file name: example.pdf'),
(96, 'UPDATE thesis SET title = \'teacher 1 thesis 2 title edited\' WHERE id = \'14\''),
(97, 'UPDATE thesis SET description = \'teacher 1 thesis 2 desc edited\' WHERE id = \'14\''),
(98, 'file name: report_template.pdf'),
(99, 'INSERT INTO files VALUES (DEFAULT, 3, 14, \'report_template.pdf\', \'uploads/3/\')'),
(100, 'INSERT INTO user VALUES (DEFAULT, \'teach2@webmail.gr\', \'$2y$10$W8Mv2CloWnb1WciOfrMEHe4eE4ziWgs8Ceo.aCwxus6.nvr5NzkSa\', \'teach2\', \'teach2sur\', \'teacher\', DEFAULT)'),
(101, 'INSERT INTO teacher VALUES(\'teach2@webmail.gr\', \'Topic\', \'2260000001\', \'6930000001\', \'CEID\', \'Patras\')'),
(102, 'INSERT INTO thesis VALUES(DEFAULT, \'teach2@webmail.gr\', \'teach 2 thesis 1\', \'teach 2 thesis 1 desc\')'),
(103, 'file name: example.pdf'),
(104, 'INSERT INTO files VALUES (DEFAULT, 4, 15, \'example.pdf\', \'uploads/4/\')'),
(105, 'heading to assign student page with student email: stu1@upnet.gr'),
(106, 'set student email to: stu1@upnet.gr'),
(107, 'set student email to: stu1@upnet.gr'),
(108, 'INSERT INTO student_thesis_relation VALUES(DEFAULT, \'stu1@upnet.gr\', \'15\', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)'),
(109, 'INSERT INTO request VALUES(DEFAULT, 2, \'teach1@upnet.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(110, 'UPDATE request SET status = \'accepted\' WHERE id = 1'),
(111, 'UPDATE request SET reply_datetime = \'CURRENT_TIMESTAMP()\' WHERE id = 1'),
(112, 'UPDATE student_thesis_relation SET teach1_email = \'teach1@upnet.gr\' WHERE id = 2'),
(113, 'INSERT INTO thesis_notes VALUES (DEFAULT, 15, \'teach2@webmail.gr\', \'teacher 2 note on teacher 2 thesis 1\')'),
(114, 'INSERT INTO thesis_notes VALUES (DEFAULT, 15, \'teach2@webmail.gr\', \'teacher 2 second note on teacher 2 thesis 1\')'),
(115, 'INSERT INTO user VALUES (DEFAULT, \'stu2@upnet.gr\', \'$2y$10$i3GOv0ZHsDNFEpAHwKOWiu2me9vb2ilXRE8PiuwGjm.lJLYxljbGu\', \'stu2\', \'stu2sur\', \'student\', DEFAULT)'),
(116, 'INSERT INTO student VALUES(\'stu2@upnet.gr\', \'11000005\', \'street\', \'56\', \'patras\', \'26000\', \'jonathan\',  \'6957852446\', \'2105544889\')'),
(117, 'heading to assign student page with student email: stu2@upnet.gr'),
(118, 'set student email to: stu2@upnet.gr'),
(119, 'set student email to: stu2@upnet.gr'),
(120, 'set student email to: stu2@upnet.gr'),
(121, 'set student email to: stu2@upnet.gr'),
(122, 'forced to change to list page'),
(123, 'heading to assign student page with student email: stu2@upnet.gr'),
(124, 'set student email to: stu2@upnet.gr'),
(125, 'forced to change to list page'),
(126, 'heading to assign student page with student email: stu2@upnet.gr'),
(127, 'set student email to: stu2@upnet.gr'),
(128, 'heading to assign student page with student email: stu2@upnet.gr'),
(129, 'set student email to: stu2@upnet.gr'),
(130, 'heading to assign student page with student email: stu2@upnet.gr'),
(131, 'set student email to: stu2@upnet.gr'),
(132, 'set student email to: stu2@upnet.gr'),
(133, 'INSERT INTO user VALUES (DEFAULT, \'teach3@upnet.gr\', \'$2y$10$Nvvr1sc1CpJ0jlSY5jwzU.txugI81Dt6akN55uiiwS.i.8/iFY6PG\', \'teach3\', \'teach3sur\', \'teacher\', DEFAULT)'),
(134, 'INSERT INTO teacher VALUES(\'teach3@upnet.gr\', \'topic\', \'2262244555\', \'6934444555\', \'CEID\', \'Patras\')'),
(135, 'INSERT INTO request VALUES(DEFAULT, 2, \'teach3@upnet.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(136, 'UPDATE request SET status = \'declined\' WHERE id = 2'),
(137, 'UPDATE request SET reply_datetime = \'CURRENT_TIMESTAMP()\' WHERE id = 2'),
(138, 'INSERT INTO user VALUES (DEFAULT, \'teach4@upnet.gr\', \'$2y$10$xT42C5UiDGJaKbKBo73PTehZVgAuN7HZuqNYwJhtde3SDpmyvgpwS\', \'teach4\', \'teach4sur\', \'teacher\', DEFAULT)'),
(139, 'INSERT INTO teacher VALUES(\'teach4@upnet.gr\', \'Topic\', \'2104466778\', \'6948899542\', \'CEID\', \'Patras\')'),
(140, 'INSERT INTO request VALUES(DEFAULT, 2, \'teach4@upnet.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(141, 'UPDATE request SET status = \'accepted\' WHERE id = 3'),
(142, 'UPDATE request SET reply_datetime = \'CURRENT_TIMESTAMP()\' WHERE id = 3'),
(143, 'UPDATE student_thesis_relation SET teach2_email = \'teach4@upnet.gr\' WHERE id = 2'),
(144, 'UPDATE student_thesis_relation SET status = \'active\', activated_datetime = CURRENT_TIMESTAMP() WHERE id = 2'),
(145, 'UPDATE request SET status = \'slots_complete\', reply_datetime = CURRENT_TIMESTAMP() WHERE relation_id = 2 AND status = \'pending\''),
(146, 'file name: example.pdf'),
(147, 'INSERT INTO files VALUES (DEFAULT, 1, 15, \'example.pdf\', \'uploads/1/\')'),
(148, 'UPDATE student_thesis_relation SET nemetreslink = \'https://nemertes.library.upatras.gr\' WHERE id = \'2\''),
(149, 'relation id: 2 creator:  exam1:  exam2: '),
(150, 'UPDATE student_thesis_relation SET status = \'being_examined\' WHERE id = 2'),
(151, 'INSERT INTO thesis_notes VALUES (DEFAULT, 15, \'teach4@upnet.gr\', \'teacher 3 note on teacher 2 thesis 1\')'),
(152, 'UPDATE student_thesis_relation SET grade_exam2 = 19 WHERE id = 2'),
(153, 'relation id: 2 creator:  exam1:  exam2: 19'),
(154, 'UPDATE student_thesis_relation SET grade_exam1 = 18 WHERE id = 2'),
(155, 'UPDATE student_thesis_relation SET grade_creator = 15 WHERE id = 2'),
(156, 'relation id: 2 creator: 15 exam1: 18 exam2: 19'),
(157, 'UPDATE student_thesis_relation SET status = \'finished\' WHERE id = 2'),
(158, 'relation id: 2 creator: 15 exam1: 18 exam2: 19'),
(159, 'INSERT INTO thesis VALUES(DEFAULT, \'teach3@upnet.gr\', \'teacher 3 thesis 1 title\', \'teacher 3 thesis 1 desc\')'),
(160, 'file name: example.pdf'),
(161, 'INSERT INTO files VALUES (DEFAULT, 6, 16, \'example.pdf\', \'uploads/6/\')'),
(162, 'heading to assign student page with student email: stu2@upnet.gr'),
(163, 'set student email to: stu2@upnet.gr'),
(164, 'set student email to: stu2@upnet.gr'),
(165, 'INSERT INTO student_thesis_relation VALUES(DEFAULT, \'stu2@upnet.gr\', \'16\', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)'),
(166, 'INSERT INTO request VALUES(DEFAULT, 3, \'teach4@upnet.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(167, 'INSERT INTO request VALUES(DEFAULT, 3, \'teach2@webmail.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(168, 'INSERT INTO request VALUES(DEFAULT, 3, \'teach1@upnet.gr\', DEFAULT, CURRENT_TIMESTAMP(), DEFAULT)'),
(169, 'UPDATE request SET status = \'accepted\' WHERE id = 6'),
(170, 'UPDATE request SET reply_datetime = \'CURRENT_TIMESTAMP()\' WHERE id = 6'),
(171, 'UPDATE student_thesis_relation SET teach1_email = \'teach1@upnet.gr\' WHERE id = 3'),
(172, 'UPDATE request SET status = \'accepted\' WHERE id = 5'),
(173, 'UPDATE request SET reply_datetime = \'CURRENT_TIMESTAMP()\' WHERE id = 5'),
(174, 'UPDATE student_thesis_relation SET teach2_email = \'teach2@webmail.gr\' WHERE id = 3'),
(175, 'UPDATE student_thesis_relation SET status = \'active\', activated_datetime = CURRENT_TIMESTAMP() WHERE id = 3'),
(176, 'UPDATE request SET status = \'slots_complete\', reply_datetime = CURRENT_TIMESTAMP() WHERE relation_id = 3 AND status = \'pending\''),
(177, 'relation id: 3 creator:  exam1:  exam2: '),
(178, 'relation id: 3 creator:  exam1:  exam2: '),
(179, 'file name: export.php.json'),
(180, 'INSERT INTO user VALUES (DEFAULT, \'104333999@students.upatras.gr\', \'$2y$10$IS8923w1LuoExpY5otSCmeaVE.q4OwVDF7wxmf819bRTtbUnQYXW.\', \'Makis\', \'Makopoulos\', \'student\', DEFAULT)'),
(181, 'INSERT INTO student VALUES(\'104333999@students.upatras.gr\', \'10433999\', \'test street\', \'45\', \'test city\', \'39955\', \'Orestis\',  \'6939096979\', \'2610333000\')'),
(182, 'INSERT INTO user VALUES (DEFAULT, \'st10434000@upnet.gr\', \'$2y$10$KNLAnL5QMx7f5ZDu1kVebOkxNByW1dy28.CRAwcRzmZyFAUsjSTTe\', \'John\', \'Lennon\', \'student\', DEFAULT)'),
(183, 'INSERT INTO student VALUES(\'st10434000@upnet.gr\', \'10434000\', \'Ermou\', \'18\', \'Athens\', \'10431\', \'George\',  \'6970001112\', \'2610123456\')'),
(184, 'INSERT INTO user VALUES (DEFAULT, \'st10434001@upnet.gr\', \'$2y$10$vHL6pEtXcIsTWXfrWJMDWuRjCjQ0MExfJ12Pp9gMXfHDiFTKtCX5G\', \'Petros\', \'Verikokos\', \'student\', DEFAULT)'),
(185, 'INSERT INTO student VALUES(\'st10434001@upnet.gr\', \'10434001\', \'Adrianou\', \'20\', \'Thessaloniki\', \'54248\', \'Giannis\',  \'6970001112\', \'2610778899\')'),
(186, 'INSERT INTO user VALUES (DEFAULT, \'st10434002@upnet.gr\', \'$2y$10$k1h4/HjAg/5JOCNzw4nTKuvZPXBqA/NRzhpW.Q6d2VmF/z60uod4.\', \'test\', \'name\', \'student\', DEFAULT)'),
(187, 'INSERT INTO student VALUES(\'st10434002@upnet.gr\', \'10434002\', \'str\', \'1\', \'patra\', \'26222\', \'father\',  \'6912345678\', \'2610123456\')'),
(188, 'INSERT INTO user VALUES (DEFAULT, \'st10434003@upnet.gr\', \'$2y$10$hkPMynwIpc5wnoax2DovE.epJqLO6ir36E3CVM1PWUZgUcuf/CM5y\', \'Robert\', \'Smith\', \'student\', DEFAULT)'),
(189, 'INSERT INTO student VALUES(\'st10434003@upnet.gr\', \'10434003\', \'Fascination\', \'17\', \'London\', \'1989\', \'Alex\',  \'6902051989\', \'2610251989\')'),
(190, 'INSERT INTO user VALUES (DEFAULT, \'st10434004@upnet.gr\', \'$2y$10$QAkTI.W3LxPGj7Nfs.2L1OTDKDwstVnSMCzGLQgyJ5j826ufRS89G\', \'Rex\', \'Tyrannosaurus\', \'student\', DEFAULT)'),
(191, 'INSERT INTO student VALUES(\'st10434004@upnet.gr\', \'10434004\', \'Cretaceous\', \'2\', \'Laramidia\', \'54321\', \'Daspletosaurus\',  \'6911231234\', \'2610432121\')'),
(192, 'INSERT INTO user VALUES (DEFAULT, \'st10434005@upnet.gr\', \'$2y$10$O8YieNJ5LQ7dusZIg.Mvx.GcNAf9y7EIhqRbqnkxnij8uLLGjsno6\', \'Paul\', \'Mescal \', \'student\', DEFAULT)'),
(193, 'INSERT INTO student VALUES(\'st10434005@upnet.gr\', \'10434005\', \'Smith Str.\', \'33\', \'New York \', \'59\', \'Paul\',  \'-\', \'-\')'),
(194, 'INSERT INTO user VALUES (DEFAULT, \'st10434006@upnet.gr\', \'$2y$10$JN/L7kl.QdcrE0yXM2X26eVr2Amchi1ADXueumlpjTPU0yyakCCku\', \'Pedro\', \'Pascal\', \'student\', DEFAULT)'),
(195, 'INSERT INTO student VALUES(\'st10434006@upnet.gr\', \'10434006\', \'Johnson\', \'90\', \'New York \', \'70\', \'José \',  \'-\', \'-\')'),
(196, 'INSERT INTO user VALUES (DEFAULT, \'st10434007@upnet.gr\', \'$2y$10$5QHx5Nvj1UvUuJvgnU17BOp/LSEbV5qSm.9aQUxfVk0Gs6QZ2OVUy\', \'David\', \'Gilmour\', \'student\', DEFAULT)'),
(197, 'INSERT INTO student VALUES(\'st10434007@upnet.gr\', \'10434007\', \'Sortef\', \'29\', \'New York\', \'26\', \'Douglas\',  \'-\', \'-\')'),
(198, 'INSERT INTO user VALUES (DEFAULT, \'st10434008@upnet.gr\', \'$2y$10$KvZEvbVVkFL.Zfnv3MzD4.oiePN8F.yORy0X5VNKFLJ0dlfn1f1S2\', \'Lana\', \'Del Rey \', \'student\', DEFAULT)'),
(199, 'INSERT INTO student VALUES(\'st10434008@upnet.gr\', \'10434008\', \'Groove Str.\', \'23\', \'Los Angeles\', \'1\', \'none\',  \'-\', \'-\')'),
(200, 'INSERT INTO user VALUES (DEFAULT, \'st10434009@upnet.gr\', \'$2y$10$2i5HM6obKnlZCrfqRVddl.uUI70cGsyKWdL3VHDW4NHRcNIzLkpd.\', \'Stevie\', \'Nicks\', \'student\', DEFAULT)'),
(201, 'INSERT INTO student VALUES(\'st10434009@upnet.gr\', \'10434009\', \'Magic Str. \', \'8\', \'New Orleans\', \'35\', \'Jess \',  \'67\', \'56\')'),
(202, 'INSERT INTO user VALUES (DEFAULT, \'st10434010@upnet.gr\', \'$2y$10$BEhXkx.9PFzpNqEjms.xGeKw0rM5QU3WoRSs3bXIJ5NpPam9zoIm.\', \'Margaret\', \'Qualley\', \'student\', DEFAULT)'),
(203, 'INSERT INTO student VALUES(\'st10434010@upnet.gr\', \'10434010\', \'Substance Str.\', \'25\', \'Los Angeles \', \'7\', \'Paul\',  \'90\', \'67\')'),
(204, 'INSERT INTO user VALUES (DEFAULT, \'st10434011@upnet.gr\', \'$2y$10$uUdyMXxsJx/m6lvBXA1MOeTBoyvJ3nkHiJFmPEm.HrH56r1isC/dC\', \'Mia\', \'Goth\', \'student\', DEFAULT)'),
(205, 'INSERT INTO student VALUES(\'st10434011@upnet.gr\', \'10434011\', \'Pearl Str. \', \'4\', \'Michigan\', \'8\', \'Lee\',  \'-\', \'-\')'),
(206, 'INSERT INTO user VALUES (DEFAULT, \'st10434012@upnet.gr\', \'$2y$10$1tDoxfmOvps/r0NHqczK..o1QQjDnYs0r8A17YmI6fP178DTZKwLK\', \'Florence \', \'Pugh\', \'student\', DEFAULT)'),
(207, 'INSERT INTO student VALUES(\'st10434012@upnet.gr\', \'10434012\', \'Midsommar Str. l\', \'1\', \'Away\', \'24\', \'-\',  \'2\', \'5\')'),
(208, 'INSERT INTO user VALUES (DEFAULT, \'st10434013@upnet.gr\', \'$2y$10$fL2g3URng/czY0/t9ThW9u2CRqiKqbA5b7MC/8Ma0rwMnC6IJwKHS\', \'PJ \', \'Harvey\', \'student\', DEFAULT)'),
(209, 'INSERT INTO student VALUES(\'st10434013@upnet.gr\', \'10434013\', \'Lonely Str.\', \'27\', \'Bridport\', \'-7\', \'Ray\',  \'43\', \'56\')'),
(210, 'INSERT INTO user VALUES (DEFAULT, \'st10434014@upnet.gr\', \'$2y$10$QCy3WcDdBojlC8uXlIMEi.V85AP.y/HmscrLm/akFE4Gw/akJLcxu\', \'Penélope\', \'Cruz\', \'student\', DEFAULT)'),
(211, 'INSERT INTO student VALUES(\'st10434014@upnet.gr\', \'10434014\', \'Almadovar\', \'55\', \'Madrid\', \'23\', \'Eduardo \',  \'4\', \'5\')'),
(212, 'INSERT INTO user VALUES (DEFAULT, \'st10434015@upnet.gr\', \'$2y$10$fMObRyNzgl8xjvaDma2VDeaUdKV2UnXRcp3AlYtfW35DfYLzCiseK\', \'Emma\', \'Stone\', \'student\', DEFAULT)'),
(213, 'INSERT INTO student VALUES(\'st10434015@upnet.gr\', \'10434015\', \'Poor Str.\', \'3\', \'Paris \', \'34\', \'none\',  \'4455555\', \'2333333\')'),
(214, 'INSERT INTO user VALUES (DEFAULT, \'st10434016@upnet.gr\', \'$2y$10$30kpja3VJLjl/2NI8ehqDu5aoJdmidbS9ENt5zsA6MSumVrBHJF1.\', \'Jenny\', \'Vanou\', \'student\', DEFAULT)'),
(215, 'INSERT INTO student VALUES(\'st10434016@upnet.gr\', \'10434016\', \'Mpouat Str.\', \'23\', \'Athens\', \'10\', \'Basil\',  \'45\', \'09\')'),
(216, 'INSERT INTO user VALUES (DEFAULT, \'st10434017@upnet.gr\', \'$2y$10$mhO0k4zR7yWgkIRtLG/U1.I69Aag.PtuTTmuo6BoTh/cdtyIpq9FG\', \'Salma \', \'Hayek\', \'student\', DEFAULT)'),
(217, 'INSERT INTO student VALUES(\'st10434017@upnet.gr\', \'10434017\', \'Desperado Str. \', \'24\', \'Madrid \', \'656\', \'Sami\',  \'221\', \'344\')'),
(218, 'INSERT INTO user VALUES (DEFAULT, \'st10434018@upnet.gr\', \'$2y$10$QnVEq/yC/G9xszkMa5Gdkeo97wk67Exs9Ooq12u1oWBuuHpNK41ia\', \'Julie \', \'Delpy\', \'student\', DEFAULT)'),
(219, 'INSERT INTO student VALUES(\'st10434018@upnet.gr\', \'10434018\', \'Before Str.\', \'36\', \'Paris\', \'567\', \'Kieślowski\',  \'3455\', \'1223\')'),
(220, 'INSERT INTO user VALUES (DEFAULT, \'st10434019@upnet.gr\', \'$2y$10$VXQsx4snKhmftKw9wOhx/e4zLmVv8zQtuwHdV6USZGIPGQwqsL3cm\', \'Giannis\', \'Aggelakas\', \'student\', DEFAULT)'),
(221, 'INSERT INTO student VALUES(\'st10434019@upnet.gr\', \'10434019\', \'Trypes Str.\', \'3\', \'Athens\', \'2354\', \'Theos\',  \'45\', \'23\')'),
(222, 'INSERT INTO user VALUES (DEFAULT, \'st10434020@upnet.gr\', \'$2y$10$hks7Q3MSyuaJJ3Be37xN9.KSz7/rBJkQiytfarfpKLlt6nMoeLUXK\', \'Eleutheria \', \'Arvanitaki\', \'student\', DEFAULT)'),
(223, 'INSERT INTO student VALUES(\'st10434020@upnet.gr\', \'10434020\', \'Entexno Str. \', \'2\', \'Athens\', \'345\', \'Kosmos\',  \'345\', \'657\')'),
(224, 'INSERT INTO user VALUES (DEFAULT, \'st10434021@upnet.gr\', \'$2y$10$ohwTYWO77mFRyo3oJkSYyejoP5mMrS8E1Ct.1C4xoj2aDaAbsi2He\', \'Marina\', \'Spanou\', \'student\', DEFAULT)'),
(225, 'INSERT INTO student VALUES(\'st10434021@upnet.gr\', \'10434021\', \'Pagkrati Str.\', \'25\', \'Athens\', \'2456\', \'Gates\',  \'354\', \'897\')'),
(226, 'INSERT INTO user VALUES (DEFAULT, \'st10434022@upnet.gr\', \'$2y$10$1M1DLi1TLrZZEGpMEgn8KeP/wa93.ZDezoSb.v.LnM0IwBtZ0Ee3W\', \'Rena\', \'Koumioti\', \'student\', DEFAULT)'),
(227, 'INSERT INTO student VALUES(\'st10434022@upnet.gr\', \'10434022\', \'Mpouat Str.\', \'24\', \'Athens\', \'5749\', \'Ellhniko\',  \'32453\', \'23557\')'),
(228, 'INSERT INTO user VALUES (DEFAULT, \'st10434023@upnet.gr\', \'$2y$10$XUNlFpFou9Z0hGyGHtRdyO2iNevE2kliP8GCuHAxOkXwmAax7UgdK\', \'Charlotte\', \'Aitchison\', \'student\', DEFAULT)'),
(229, 'INSERT INTO student VALUES(\'st10434023@upnet.gr\', \'10434023\', \'Boiler Room St\', \'365\', \'New York\', \'360\', \'Jon\',  \'693653365\', \'2610365365\')'),
(230, 'INSERT INTO user VALUES (DEFAULT, \'st10434024@upnet.gr\', \'$2y$10$dipMfwEm01xHJB8tflLGPONWF1VuGTE495WUjGWs1BDqLt6qcVDl2\', \'Rhaenyra\', \'Targaryen\', \'student\', DEFAULT)'),
(231, 'INSERT INTO student VALUES(\'st10434024@upnet.gr\', \'10434024\', \'Dragon St\', \'2021\', \'Kings Landing\', \'2021\', \'Viserys\',  \'6910101010\', \'2610101010\')'),
(232, 'INSERT INTO user VALUES (DEFAULT, \'st10434025@upnet.gr\', \'$2y$10$.OuhZHRW9BC7HefAHK/KgOmC9GKRkFPU3DlNphiSXIwRtVgwByTYW\', \'Ben\', \'Dover\', \'student\', DEFAULT)'),
(233, 'INSERT INTO student VALUES(\'st10434025@upnet.gr\', \'10434025\', \'Colon Str.\', \'124A\', \'NY\', \'11045\', \'Carlos\',  \'5841852384\', \'2584694587\')'),
(234, 'INSERT INTO user VALUES (DEFAULT, \'st10434026@upnet.gr\', \'$2y$10$N8GslBB7Y5NUrPhCiWW8RuEIt7oauZcCJrP/Nvpb.xRTSbabtV.Yu\', \'Marios\', \'Papadakis\', \'student\', DEFAULT)'),
(235, 'INSERT INTO student VALUES(\'st10434026@upnet.gr\', \'10434026\', \'Korinthou\', \'266\', \'Patras\', \'26223\', \'Ioannis\',  \'+306975562567\', \'+302105562567\')'),
(236, 'INSERT INTO user VALUES (DEFAULT, \'st10434027@upnet.gr\', \'$2y$10$xyoq784E9kNAE/B88nBMX.xNE0rQi5yeBMx2MLtVxQK3yWCVTAg1e\', \'Nicholas \', \'Hoult\', \'student\', DEFAULT)'),
(237, 'INSERT INTO student VALUES(\'st10434027@upnet.gr\', \'10434027\', \'Nosferatu Str.\', \'34\', \'London\', \'567\', \'Roger\',  \'46478\', \'436\')'),
(238, 'INSERT INTO user VALUES (DEFAULT, \'st10434028@upnet.gr\', \'$2y$10$IclFAhdYsC1S8k9qKOdsXOfgWbDh8iuxXDXpJ63gsnnMLCT/DtsE.\', \'Joo Hyuk\', \'Nam\', \'student\', DEFAULT)'),
(239, 'INSERT INTO student VALUES(\'st10434028@upnet.gr\', \'10434028\', \'Kanakari\', \'135\', \'Patra\', \'26440\', \'Baek Yi Jin\',  \'6978756432\', \'2610443568\')'),
(240, 'INSERT INTO user VALUES (DEFAULT, \'st10434029@upnet.gr\', \'$2y$10$irbOP5RRn4IIUG4y54hWlOXhFGRznl.WXxU5r9CW5fo1pqBkt5Dxe\', \'Nikos\', \'Peletie\', \'student\', DEFAULT)'),
(241, 'INSERT INTO student VALUES(\'st10434029@upnet.gr\', \'10434029\', \'Kolokotroni\', \'6\', \'Athens\', \'34754\', \'George\',  \'6987655433\', \'2104593844\')'),
(242, 'INSERT INTO user VALUES (DEFAULT, \'st10434030@upnet.gr\', \'$2y$10$BqssQT19uqGjTh5cE9fDh.zGPXJshCFo0CnKY6I8QgVXqQEKW4GWK\', \'Nikos\', \'Koukos\', \'student\', DEFAULT)'),
(243, 'INSERT INTO student VALUES(\'st10434030@upnet.gr\', \'10434030\', \'Triton\', \'12\', \'Salamina\', \'12216\', \'Giannis\',  \'6946901012\', \'210553985\')'),
(244, 'INSERT INTO user VALUES (DEFAULT, \'st10434031@upnet.gr\', \'$2y$10$JoSWZcH0y5OGaPcSg3T53.d.YXWUYPPyn5JpbHBsdVH6MeGcJRGcm\', \'Maria\', \'Fouseki\', \'student\', DEFAULT)'),
(245, 'INSERT INTO student VALUES(\'st10434031@upnet.gr\', \'10434031\', \'Jason \', \'33\', \'London\', \'44391\', \'Tasos\',  \'6923144642\', \'2109993719\')'),
(246, 'INSERT INTO user VALUES (DEFAULT, \'st10434032@upnet.gr\', \'$2y$10$aJNNv7VRe50kM0EKAJCg1OwfXF30FAlvCnNj8ijYL3eUXzLbryyxm\', \'Nikos \', \'Korobos\', \'student\', DEFAULT)'),
(247, 'INSERT INTO student VALUES(\'st10434032@upnet.gr\', \'10434032\', \'Masalias\', \'4\', \'Sparti\', \'32095\', \'Giannis\',  \'6948308576\', \'2279036758\')'),
(248, 'INSERT INTO user VALUES (DEFAULT, \'st10434033@upnet.gr\', \'$2y$10$X2C02UJQKKVBbgvERJBuSOXX1bBUHaKuSweFReMousBYToU7IvirC\', \'Maria\', \'Togia\', \'student\', DEFAULT)'),
(249, 'INSERT INTO student VALUES(\'st10434033@upnet.gr\', \'10434033\', \'Athinon\', \'4\', \'Athens\', \'28482\', \'Petros\',  \'6953782102\', \'2100393022\')'),
(250, 'INSERT INTO user VALUES (DEFAULT, \'st10434034@upnet.gr\', \'$2y$10$ZO1ByBktffI5Qcd6t9pSn.u3.iGrjGWKBTA.58C1gNyNKyVmqtUwu\', \'Giorgos\', \'Menegakis\', \'student\', DEFAULT)'),
(251, 'INSERT INTO student VALUES(\'st10434034@upnet.gr\', \'10434034\', \'korinthou\', \'56\', \'patras\', \'56892\', \'nikos\',  \'6934527125\', \'2610485796\')'),
(252, 'INSERT INTO user VALUES (DEFAULT, \'st10434035@upnet.gr\', \'$2y$10$vzCCLnPvIcImvTGG3iBf5.qs/Xzdkq33yzErq3WIG3bU613yGVBHu\', \'Trakis\', \'Giannakopoulos\', \'student\', DEFAULT)'),
(253, 'INSERT INTO student VALUES(\'st10434035@upnet.gr\', \'10434035\', \'Othonos kai Amalias \', \'100\', \'Patras\', \'26500\', \'None\',  \'6028371830\', \'2610381393\')'),
(254, 'INSERT INTO user VALUES (DEFAULT, \'st10434036@upnet.gr\', \'$2y$10$dEMJJTlIFokpaoq72mhUX.xVA1MBg3QiFXQvC6.3zth3ZqSY6UWsG\', \'Chris\', \'Kouvadis\', \'student\', DEFAULT)'),
(255, 'INSERT INTO student VALUES(\'st10434036@upnet.gr\', \'10434036\', \'vanizelou\', \'36\', \'Patras\', \'26500\', \'Pfloutsou\',  \'6947937524\', \'2610995999\')'),
(256, 'INSERT INTO user VALUES (DEFAULT, \'st10434037@upnet.gr\', \'$2y$10$FfekbyimcO0gvTbfbp.6lOJrlwq/XWTgFaLijZYkIxcMNvIfhfkkO\', \'pafloutsou\', \'kaskarai\', \'student\', DEFAULT)'),
(257, 'INSERT INTO student VALUES(\'st10434037@upnet.gr\', \'10434037\', \'kolokotroni\', \'12\', \'Patras\', \'26500\', \'mauragkas\',  \'6935729345\', \'2610978423\')'),
(258, 'INSERT INTO user VALUES (DEFAULT, \'st10434038@upnet.gr\', \'$2y$10$NiE6tDyTE739U/tX2usDOee3zQO6drc75cV/5CxSFivkIiDCGrqOS\', \'Billy\', \'Diesel\', \'student\', DEFAULT)'),
(259, 'INSERT INTO student VALUES(\'st10434038@upnet.gr\', \'10434038\', \'Alexandras Ave\', \'12\', \'Athens\', \'11521\', \'Iman\',  \'6912345678\', \'2101234567\')'),
(260, 'INSERT INTO user VALUES (DEFAULT, \'st10434039@upnet.gr\', \'$2y$10$TkOcH7rJR6xiS1Dzv57m8O6uqy4Wxit6fMX6bKcCg0ZLmvmLvdtve\', \'Tome\', \'of Madness\', \'student\', DEFAULT)'),
(261, 'INSERT INTO student VALUES(\'st10434039@upnet.gr\', \'10434039\', \'Panepisthmiou\', \'69\', \'Patras\', \'26441\', \'Prafit\',  \'6969966996\', \'2610654321\')'),
(262, 'INSERT INTO user VALUES (DEFAULT, \'st10434040@upnet.gr\', \'$2y$10$hKyWWL2MOiiyudfVkZbcNu4YXkphGjeykIt0buoyELMECTj6jZFX6\', \'fort\', \'nite\', \'student\', DEFAULT)'),
(263, 'INSERT INTO student VALUES(\'st10434040@upnet.gr\', \'10434040\', \'karaiskakis\', \'69\', \'tilted tower\', \'4747\', \'epic games\',  \'6988112233\', \'2610747474\')'),
(264, 'INSERT INTO user VALUES (DEFAULT, \'st10434041@upnet.gr\', \'$2y$10$LGbjhKvXcg8byPTGTz3yO.l0PgZ7OR4Gztx0Lol7EtEMZaKFRCKz6\', \'Zeus\', \'Ikosaleptos\', \'student\', DEFAULT)'),
(265, 'INSERT INTO student VALUES(\'st10434041@upnet.gr\', \'10434041\', \'Novi\', \'25\', \'Athens\', \'20033\', \'Kleft\',  \'6900008005\', \'2109090901\')'),
(266, 'INSERT INTO user VALUES (DEFAULT, \'st10434042@upnet.gr\', \'$2y$10$15t4Ks2Bs5fIyGmGLxZvxul0vzjMEQ8oCabSc5AzFxjg03gBz/B4e\', \'AG\', \'Cook\', \'student\', DEFAULT)'),
(267, 'INSERT INTO student VALUES(\'st10434042@upnet.gr\', \'10434042\', \'Britpop\', \'7G\', \'London\', \'2021\', \'PC Music\',  \'1212121212\', \'2121212121\')'),
(268, 'INSERT INTO user VALUES (DEFAULT, \'st10434043@upnet.gr\', \'$2y$10$R0iAEkP0d5/z762uAmTWeuhhS8EVW8iofSz.dLDFXTbGuUUlD0Y2G\', \'Maria\', \'Mahmood\', \'student\', DEFAULT)'),
(269, 'INSERT INTO student VALUES(\'st10434043@upnet.gr\', \'10434043\', \'Mouratidi\', \'4\', \'New York\', \'25486\', \'Paparizou\',  \'6980081351\', \'2108452666\')'),
(270, 'INSERT INTO user VALUES (DEFAULT, \'st10434044@upnet.gr\', \'$2y$10$.SGAW4mfJgpal9FpHqSiwetbFT9fJ89kjyrMsPlCM5MVnbIJ0ndai\', \'Kostas\', \'Poupis\', \'student\', DEFAULT)'),
(271, 'INSERT INTO student VALUES(\'st10434044@upnet.gr\', \'10434044\', \'Ag Kiriakis\', \'11\', \'Papaou\', \'50501\', \'Aelakis\',  \'698452154\', \'222609123\')'),
(272, 'INSERT INTO user VALUES (DEFAULT, \'st10434045@upnet.gr\', \'$2y$10$G4zfy6LZFtMj54AqqEV3eOQu7YSCjh4J55Nrv/gaXp9uCWq7obt3S\', \'Hugh\', \'Jass\', \'student\', DEFAULT)'),
(273, 'INSERT INTO student VALUES(\'st10434045@upnet.gr\', \'10434045\', \'Wall Street\', \'69\', \'Jerusalem\', \'478\', \'Mike Oxlong\',  \'696969420\', \'69696969\')'),
(274, 'INSERT INTO user VALUES (DEFAULT, \'st10434046@upnet.gr\', \'$2y$10$TGtoN6Dg092YzWiiFZP/BOX8sastXvx3F/sU/iC77DlMPesKMIko.\', \'Xontro \', \'Pigouinaki\', \'student\', DEFAULT)'),
(275, 'INSERT INTO student VALUES(\'st10434046@upnet.gr\', \'10434046\', \'Krasopotirou\', \'69\', \'Colarato\', \'14121\', \'Adolf Heisenberg\',  \'4747859625\', \'6913124205\')'),
(276, 'INSERT INTO user VALUES (DEFAULT, \'st10434047@upnet.gr\', \'$2y$10$MPtiZY5itFiKNgZuvYVhu.km2vjEj/1iXciJ8gfkIo70BB/GT/tLa\', \'Μaria\', \'Nikolaou\', \'student\', DEFAULT)'),
(277, 'INSERT INTO student VALUES(\'st10434047@upnet.gr\', \'10434047\', \'Achilleos\', \'21\', \'Athens\', \'10437\', \'Dimitris\',  \'6945533213\', \'2109278907\')'),
(278, 'INSERT INTO user VALUES (DEFAULT, \'st10434048@upnet.gr\', \'$2y$10$d7LBuU8cAOdwofFaYpHXbODXMROGFoCSei6b6iMcmQLML342wWdDS\', \'Eleni\', \'Fotiou\', \'student\', DEFAULT)'),
(279, 'INSERT INTO student VALUES(\'st10434048@upnet.gr\', \'10434048\', \'Adrianou \', \'65\', \'Athens\', \'10556\', \'Nikos\',  \'6978989000\', \'2108745645\')'),
(280, 'INSERT INTO user VALUES (DEFAULT, \'st10434049@upnet.gr\', \'$2y$10$lA3jMj5U7nkdyMM8F4FSvuT7rzEqnzSeKH2SmX/2KJ5RLgqxAOx8y\', \'Xara\', \'Fanouriou\', \'student\', DEFAULT)'),
(281, 'INSERT INTO student VALUES(\'st10434049@upnet.gr\', \'10434049\', \'Chaonias \', \'54\', \'Athens\', \'10441\', \'Petros\',  \'6945622222\', \'2108724324\')'),
(282, 'INSERT INTO user VALUES (DEFAULT, \'st10434050@upnet.gr\', \'$2y$10$vyRjGVB6BWVDOJ/AHlMkE.o8bRHA.VPvs/6sm3a/za5HMJhnSiTj6\', \'Nikos\', \'Panagiotou\', \'student\', DEFAULT)'),
(283, 'INSERT INTO student VALUES(\'st10434050@upnet.gr\', \'10434050\', \'Chomatianou\', \'32\', \'Athens\', \'10439\', \'Giorgos\',  \'6941133333\', \'2107655555\')'),
(284, 'INSERT INTO user VALUES (DEFAULT, \'st10434051@upnet.gr\', \'$2y$10$wi9mF3AWzx/VcYVqTC7g0.AAW4UBeDlIIMkKhCIU8sSz9Exjg51.O\', \'Petros\', \'Daidalos\', \'student\', DEFAULT)'),
(285, 'INSERT INTO student VALUES(\'st10434051@upnet.gr\', \'10434051\', \'Dafnidos\', \'4\', \'Athens\', \'11364\', \'Pavlos\',  \'6976644333\', \'2108534566\')'),
(286, 'INSERT INTO user VALUES (DEFAULT, \'st10434052@upnet.gr\', \'$2y$10$hI9oAxzKf6KF5Yur6XACSeLwQjkkQv9pqefwndZ50WbVTEbgkYdae\', \'Giannis\', \'Ioannou\', \'student\', DEFAULT)'),
(287, 'INSERT INTO student VALUES(\'st10434052@upnet.gr\', \'10434052\', \'Danais\', \'9\', \'Athens\', \'11631\', \'Kostas\',  \'6976565655\', \'2107644999\')'),
(288, 'INSERT INTO user VALUES (DEFAULT, \'st10434053@upnet.gr\', \'$2y$10$oL0QnxYUrLHdRqX4UPl3K.Q/ENVrNfQe12VtnvaoHucMmif1qmFly\', \'Tsili\', \'Doghouse\', \'student\', DEFAULT)'),
(289, 'INSERT INTO student VALUES(\'st10434053@upnet.gr\', \'10434053\', \'novi lane\', \'33\', \'Patras\', \'26478\', \'Stoiximan\',  \'6999999999\', \'2610420420\')'),
(290, 'INSERT INTO user VALUES (DEFAULT, \'st10434054@upnet.gr\', \'$2y$10$f9qyFJjxEbm7LXiD3SI7kOV/JSIyrNJ2vPJwGFCDqKEPrJB6Wf4Fa\', \'Marialena\', \'Antoniou\', \'student\', DEFAULT)'),
(291, 'INSERT INTO student VALUES(\'st10434054@upnet.gr\', \'10434054\', \'Ermou\', \'24\', \'Athens\', \'10563\', \'Nikolaos\',  \'693-5678901\', \'210-5678901\')'),
(292, 'INSERT INTO user VALUES (DEFAULT, \'st10434055@upnet.gr\', \'$2y$10$VmgjkEpXFsmZvDuwtyQ4veWccbfG1ZXjyTnqy1LS0vGnww2rxX6Ru\', \'Ioannis\', \'Panagiotou\', \'student\', DEFAULT)'),
(293, 'INSERT INTO student VALUES(\'st10434055@upnet.gr\', \'10434055\', \'Kyprou\', \'42\', \'Patra\', \'26441\', \'Kwstas\',  \'698-1234567\', \'2610-123456\')'),
(294, 'INSERT INTO user VALUES (DEFAULT, \'st10434056@upnet.gr\', \'$2y$10$cfj1w/QZeCMS2ZM25n7Bj.lzvph4ksqNGByR6e3AgwrfPLjEk5.Q2\', \'George\', \'Karamalis\', \'student\', DEFAULT)'),
(295, 'INSERT INTO student VALUES(\'st10434056@upnet.gr\', \'10434056\', \'Kolokotroni\', \'10\', \'Larissa\', \'41222\', \'Petros\',  \'697-4567890\', \'2410-456789\')'),
(296, 'INSERT INTO user VALUES (DEFAULT, \'st10434057@upnet.gr\', \'$2y$10$Nj.IKFDg4gcmqZO3xer/KukaRaDrFQsCJn/mf2Rn6ANoPXJd4kara\', \'Kyriakos\', \'Papapetrou\', \'student\', DEFAULT)'),
(297, 'INSERT INTO student VALUES(\'st10434057@upnet.gr\', \'10434057\', \'Zakunthou\', \'36\', \'Volos\', \'10654\', \'Apostolos\',  \'695-6789012\', \'210-6789012\')'),
(298, 'INSERT INTO user VALUES (DEFAULT, \'st10434058@upnet.gr\', \'$2y$10$UFvzoHFWikrqSk6AJRYiquftn.QVRb68/U7oYsJV7NFWPLs2LVfGe\', \'Maria\', \'Kp\', \'student\', DEFAULT)'),
(299, 'INSERT INTO student VALUES(\'st10434058@upnet.gr\', \'10434058\', \'pelopidas \', \'52\', \'patra\', \'28746\', \'george\',  \'6932323232\', \'2610555555\')'),
(300, 'INSERT INTO user VALUES (DEFAULT, \'st10434059@upnet.gr\', \'$2y$10$EC7KH4EMXIHWVAxDh8lZiuDGiX98B4I3mv.R4qGcrDYaLWzolYUlm\', \'Nikos\', \'papadopoulos\', \'student\', DEFAULT)'),
(301, 'INSERT INTO student VALUES(\'st10434059@upnet.gr\', \'10434059\', \'anapafseos\', \'34\', \'patra\', \'26503\', \'takis\',  \'69090909\', \'2691045092\')'),
(302, 'INSERT INTO user VALUES (DEFAULT, \'st10434060@upnet.gr\', \'$2y$10$5YRMpJQoJNvYgPjRYsCM7.GlRXQl3ZVT0ij2HBxQio.jwyVSCQJPK\', \'Giannis \', \'Molotof\', \'student\', DEFAULT)'),
(303, 'INSERT INTO student VALUES(\'st10434060@upnet.gr\', \'10434060\', \'Ermou\', \'34\', \'Patras\', \'29438\', \'Giorgos\',  \'6943126767\', \'2610254390\')'),
(304, 'INSERT INTO user VALUES (DEFAULT, \'st10434061@upnet.gr\', \'$2y$10$LpVuw.Cgww35gXsS6nJ2ZuykVHcW3FyalC6J1/tJri725z0FiOci2\', \'Sagdy\', \'Znuts\', \'student\', DEFAULT)'),
(305, 'INSERT INTO student VALUES(\'st10434061@upnet.gr\', \'10434061\', \'Grove\', \'12\', \'San Andreas\', \'123456\', \'NULL\',  \'123456789\', \'123456789\')'),
(306, 'INSERT INTO user VALUES (DEFAULT, \'st10434062@upnet.gr\', \'$2y$10$gulwUMkXtAI4iD3RiGiTEuT7syLAidhL9Ux4Hm/9RPOZTqErOQQR6\', \'Mary\', \'Poppins\', \'student\', DEFAULT)'),
(307, 'INSERT INTO student VALUES(\'st10434062@upnet.gr\', \'10434062\', \'Niktolouloudias \', \'123\', \'Chalkida\', \'23456\', \'George\',  \'6980987654\', \'2613456089\')'),
(308, 'INSERT INTO user VALUES (DEFAULT, \'st10434063@upnet.gr\', \'$2y$10$s024TQBwzHJPYO5Qu9BNLeuhgXfiaNwW0tZOiTcJhdNJ6eNXlcHy2\', \'Tinker\', \'Bell\', \'student\', DEFAULT)'),
(309, 'INSERT INTO student VALUES(\'st10434063@upnet.gr\', \'10434063\', \'Vatomourias\', \'55\', \'Pano Raxoula\', \'2345\', \'Mixail\',  \'6987543345\', \'2456034567\')'),
(310, 'INSERT INTO user VALUES (DEFAULT, \'st10434064@upnet.gr\', \'$2y$10$wEwK3UN3OQ92.Ha1gGMJJuGJRpcPrPSgNSKHnEH.ir8Vw8Y58BrdO\', \'Lilly\', \'Bloom\', \'student\', DEFAULT)'),
(311, 'INSERT INTO student VALUES(\'st10434064@upnet.gr\', \'10434064\', \'Patnanasis\', \'45\', \'Patra\', \'26440\', \'Menelaos\',  \'6987555433\', \'2610435988\')'),
(312, 'INSERT INTO user VALUES (DEFAULT, \'st10434065@upnet.gr\', \'$2y$10$6RhX6LX6k7fm/RKJFebh6.afZQaxrKZaTnxTi.JoFOIJ57m/rZiuK\', \'GIORGOS\', \'MASOURAS\', \'student\', DEFAULT)'),
(313, 'INSERT INTO student VALUES(\'st10434065@upnet.gr\', \'10434065\', \'AGIOU IOANNNI RENTI\', \'7\', \'PEIRAIAS\', \'47200\', \'PETROS\',  \'210583603\', \'694837204\')'),
(314, 'INSERT INTO user VALUES (DEFAULT, \'st10434066@upnet.gr\', \'$2y$10$HPmSJbsEUo4VUJiNmJ/27u.gFdTlYWqyTnY1EkOxp87KcWy/JzR6y\', \'KENDRICK\', \'NUNN\', \'student\', DEFAULT)'),
(315, 'INSERT INTO student VALUES(\'st10434066@upnet.gr\', \'10434066\', \'OAKA\', \'25\', \'ATHENS\', \'666\', \'GIANNAKOPOULOS\',  \'6906443321\', \'6982736199\')'),
(316, 'INSERT INTO user VALUES (DEFAULT, \'st10434067@upnet.gr\', \'$2y$10$YMFqhT3/6xT3Bd5JJ72NleLUnuq8TsVUNZQgpBHazxPsfvNbGgWiK\', \'Depeche\', \'Mode\', \'student\', DEFAULT)'),
(317, 'INSERT INTO student VALUES(\'st10434067@upnet.gr\', \'10434067\', \'Enjoy The Silence\', \'1990\', \'London\', \'1990\', \'Dave\',  \'1234567770\', \'1234567890\')'),
(318, 'INSERT INTO user VALUES (DEFAULT, \'st10434068@upnet.gr\', \'$2y$10$yKeWHVWNskymIpkbVHMWlOfSTBAgN92Cynjui0X3ollH1zuKqnf1m\', \'name\', \'surname\', \'student\', DEFAULT)'),
(319, 'INSERT INTO student VALUES(\'st10434068@upnet.gr\', \'10434068\', \'your\', \'69\', \'mom\', \'15584\', \'father\',  \'2223\', \'222\')'),
(320, 'INSERT INTO user VALUES (DEFAULT, \'st10434069@upnet.gr\', \'$2y$10$FhXwVJQnKc/XPpnW8B9K4OwDjNbt8xF0rPpKNYQTl9TO1rFA8wEXG\', \'Nikos\', \'Kosmopoulos\', \'student\', DEFAULT)'),
(321, 'INSERT INTO student VALUES(\'st10434069@upnet.gr\', \'10434069\', \'Araksou\', \'12\', \'Giotopoli\', \'69420\', \'Greg\',  \'6978722312\', \'210 9241993\')'),
(322, 'INSERT INTO user VALUES (DEFAULT, \'st10434070@upnet.gr\', \'$2y$10$rpppXVM7FOYz4Jeokt69ZueohCtJYtgD0uUm6DX9i0ej.15w7wakO\', \'Aris\', \'Poupis\', \'student\', DEFAULT)'),
(323, 'INSERT INTO student VALUES(\'st10434070@upnet.gr\', \'10434070\', \'Mpofa\', \'10\', \'Kolonia\', \'12345\', \'Mpamias\',  \'6935358553\', \'2105858858\')'),
(324, 'INSERT INTO user VALUES (DEFAULT, \'st10434071@upnet.gr\', \'$2y$10$gz2pv0Ny5vysRFt/jSw77.OLOwx2eeilkEQOMKYbxLjPHC6XC..jC\', \'gerry\', \'banana\', \'student\', DEFAULT)'),
(325, 'INSERT INTO student VALUES(\'st10434071@upnet.gr\', \'10434071\', \'lootlake\', \'12\', \'tilted\', \'26500\', \'johnesy\',  \'2610987632\', \'6947830287\')'),
(326, 'INSERT INTO user VALUES (DEFAULT, \'st10434072@upnet.gr\', \'$2y$10$Wepzhgs43gdVJ66ocKUUBuI.tOqXMg2ZL03prNwxr3OiFEPBsFEiq\', \'grekotsi\', \'parthenios\', \'student\', DEFAULT)'),
(327, 'INSERT INTO student VALUES(\'st10434072@upnet.gr\', \'10434072\', \'kokmotou\', \'69\', \'thessaloniki\', \'20972\', \'mourlo\',  \'2610810763\', \'6947910234\')'),
(328, 'INSERT INTO user VALUES (DEFAULT, \'st10434073@upnet.gr\', \'$2y$10$/kgJ.hAVmIqb2AWF.sJ87uZgIyzF1btZqMYE7sJT1Gk9RqL9CYiWC\', \'Mochi\', \'Mon\', \'student\', DEFAULT)'),
(329, 'INSERT INTO student VALUES(\'st10434073@upnet.gr\', \'10434073\', \'Novi\', \'55\', \'Maxxwin\', \'99999\', \'Drake\',  \'6967486832\', \'2610550406\')'),
(330, 'INSERT INTO user VALUES (DEFAULT, \'st10434074@upnet.gr\', \'$2y$10$Q.w21gR2Lnb09lk.Ro6Ls.mKrz5UGa5DVtpca08UKgXkgJpYSPgV2\', \'Nikolaos\', \'Serraios\', \'student\', DEFAULT)'),
(331, 'INSERT INTO student VALUES(\'st10434074@upnet.gr\', \'10434074\', \'Papaflessa\', \'12\', \'Patra\', \'26222\', \'Georgios\',  \'6975849305\', \'2610456632\')'),
(332, 'INSERT INTO user VALUES (DEFAULT, \'st10434075@upnet.gr\', \'$2y$10$bgTswpAZOjhbqTaPjiE/qe7pZcgkZElN0tgh2xha0Ii3r4LIRhaAi\', \'Xaralampos\', \'Mparmaksizoglou\', \'student\', DEFAULT)'),
(333, 'INSERT INTO student VALUES(\'st10434075@upnet.gr\', \'10434075\', \'Konstantinoupoleos\', \'32\', \'Athens\', \'16524\', \'Eugenios\',  \'6912345678\', \'2109995555\')'),
(334, 'INSERT INTO user VALUES (DEFAULT, \'st10434076@upnet.gr\', \'$2y$10$9K0pLLspk0y4KfobcHzCwOLiw5wcOvgFbU2qv09mLKpwqo0Ncccta\', \'kyriakos\', \'pareena\', \'student\', DEFAULT)'),
(335, 'INSERT INTO student VALUES(\'st10434076@upnet.gr\', \'10434076\', \'karaiskaki\', \'23\', \'patras\', \'23444\', \'lebron\',  \'6972861212\', \'2214567809\')'),
(336, 'INSERT INTO user VALUES (DEFAULT, \'st10434077@upnet.gr\', \'$2y$10$UkayTC.a0iojMsC71X7PwuwVGr0xgEHqV0WOTjGF/1LHzuoAkT/0a\', \'Tortelino\', \'Diagrafino\', \'student\', DEFAULT)'),
(337, 'INSERT INTO student VALUES(\'st10434077@upnet.gr\', \'10434077\', \'emp\', \'69\', \'empa\', \'5432\', \'kaae\',  \'6913121312\', \'2101312000\')'),
(338, 'INSERT INTO user VALUES (DEFAULT, \'st10434078@upnet.gr\', \'$2y$10$atVlERQQbXdbDBCv3SBQeOAwbf0iMWuqxAN7LqWoYFdFAH/ue8Ady\', \'Maria\', \'Db\', \'student\', DEFAULT)'),
(339, 'INSERT INTO student VALUES(\'st10434078@upnet.gr\', \'10434078\', \'Spiti sou\', \'3\', \'Patras\', \'26441\', \'sql\',  \'6912345678\', \'2610 123456\')'),
(340, 'INSERT INTO user VALUES (DEFAULT, \'st10434079@upnet.gr\', \'$2y$10$T7i0lnLj/TGrCqxv/B/khOMnab.B/ft7CWjKnM3MxJIr4SDNRdZuq\', \'Bombardriro\', \'Crocodilo\', \'student\', DEFAULT)'),
(341, 'INSERT INTO student VALUES(\'st10434079@upnet.gr\', \'10434079\', \'Pony Peponi\', \'69\', \'Athens\', \'15344\', \'Lirili Larila\',  \'6909876543\', \'26810 12345\')'),
(342, 'INSERT INTO user VALUES (DEFAULT, \'st10434080@upnet.gr\', \'$2y$10$fGGST5EqSTdnmvX4..b45OfAKHLB3s7aNyuYFEvu.KkARwJuTyj/u\', \'Balerinna \', \'Cappucinna\', \'student\', DEFAULT)'),
(343, 'INSERT INTO student VALUES(\'st10434080@upnet.gr\', \'10434080\', \'mimimimi\', \'4\', \'lalalala\', \'23861\', \'balerinno lololo\',  \'6983615882\', \'2610729878\')'),
(344, 'INSERT INTO user VALUES (DEFAULT, \'st10434081@upnet.gr\', \'$2y$10$N0NOaBK55PRGPnxZ1cInzesZZ0EXpKXJPa6SJPbkVKVv8NUvTRrCe\', \'Ntinos\', \'Konstantinos\', \'student\', DEFAULT)'),
(345, 'INSERT INTO student VALUES(\'st10434081@upnet.gr\', \'10434081\', \'Valaoritou\', \'1\', \'patras\', \'26225\', \'Nikolaos\',  \'6988888888\', \'2610222222\')'),
(346, 'INSERT INTO user VALUES (DEFAULT, \'st10434082@upnet.gr\', \'$2y$10$YJTVqA6DKzeIT3i3mD8Q2ONw0o7YbrwPZiP6/FwSKTf6mO8SFLnfe\', \'Xara\', \'Georgiou\', \'student\', DEFAULT)'),
(347, 'INSERT INTO student VALUES(\'st10434082@upnet.gr\', \'10434082\', \'Psilalonia\', \'12\', \'Patras\', \'26225\', \'Giorgos\',  \'6933333333\', \'261000000\')'),
(348, 'INSERT INTO user VALUES (DEFAULT, \'st10434083@upnet.gr\', \'$2y$10$anWztpSgE2/7/4Tpy.oQ.OYGyMeOgidnAxAPORx9oCSfsfPjhY1La\', \'Marios\', \'Konstantinou\', \'student\', DEFAULT)'),
(349, 'INSERT INTO student VALUES(\'st10434083@upnet.gr\', \'10434083\', \'Kanakari\', \'1\', \'Patras\', \'26225\', \'Foivos\',  \'6944444444\', \'2610777777\')'),
(350, 'INSERT INTO user VALUES (DEFAULT, \'st10434084@upnet.gr\', \'$2y$10$ubekT7ppJXWF6HtO.IyhYuhPEUl2uw4E55hp2ZCD87sW.tN7cuPrq\', \'Mina\', \'Minopoulou\', \'student\', DEFAULT)'),
(351, 'INSERT INTO student VALUES(\'st10434084@upnet.gr\', \'10434084\', \'patra\', \'13\', \'patras\', \'12345\', \'makis\',  \'699999999\', \'261044444\')'),
(352, 'INSERT INTO user VALUES (DEFAULT, \'st10434085@upnet.gr\', \'$2y$10$8sqxgckAQPPGcK8hZI5tTe8Od0cmUY8WDSfTMJjXeY1GspT6hmoPq\', \'Sakis\', \'Rouvas\', \'student\', DEFAULT)'),
(353, 'INSERT INTO student VALUES(\'st10434085@upnet.gr\', \'10434085\', \'Raftel\', \'45\', \'Piece\', \'123\', \'Gol\',  \'66666666\', \'66666666\')'),
(354, 'INSERT INTO user VALUES (DEFAULT, \'st10434086@upnet.gr\', \'$2y$10$PqZMcMrCs20xGBKsnxZfJOhFA4R3GpymdyMu0novJHaq6vlvz5XzK\', \'Shinji\', \'Ikari\', \'student\', DEFAULT)'),
(355, 'INSERT INTO student VALUES(\'st10434086@upnet.gr\', \'10434086\', \'	NERV Boulevard\', \'	4\', \'	Tokyo-3\', \'192\', \'Gendo Ikari\',  \'	08012345678\', \'	0366666666\')'),
(356, 'INSERT INTO user VALUES (DEFAULT, \'st10434087@upnet.gr\', \'$2y$10$Sda0CyN.QDaVYZyWPNilLOXr4BP5wnsJbiZs1qY57jD3qxip15Ufq\', \'Alexis\', \'tsipras\', \'student\', DEFAULT)'),
(357, 'INSERT INTO student VALUES(\'st10434087@upnet.gr\', \'10434087\', \'Kilkis\', \'13\', \'patra\', \'26441\', \'Kostaw\',  \'6978215130\', \'6978215130\')'),
(358, 'INSERT INTO user VALUES (DEFAULT, \'st10434088@upnet.gr\', \'$2y$10$ncCUDz/8P96zN4PvpO6y9.TTi2IXkSo4krQy6MdNvxAf/F0xIrgP2\', \'Tasos\', \'kolokotronhs\', \'student\', DEFAULT)'),
(359, 'INSERT INTO student VALUES(\'st10434088@upnet.gr\', \'10434088\', \'alitheias\', \'69\', \'Igoumenitsa\', \'24463\', \'Theodoros\',  \'6978584575\', \'26578953\')'),
(360, 'INSERT INTO user VALUES (DEFAULT, \'st10434089@upnet.gr\', \'$2y$10$T2AMQ1mQ7eF.1HF3HzaFLeNhTjtIzhDAky31GUqZP/HhD4N2SdxAC\', \'Minas \', \'Minaroglou\', \'student\', DEFAULT)'),
(361, 'INSERT INTO student VALUES(\'st10434089@upnet.gr\', \'10434089\', \'ksefotou\', \'36\', \'Moon city\', \'245643\', \'Manolis\',  \'698713245\', \'465352358\')'),
(362, 'INSERT INTO user VALUES (DEFAULT, \'st10434090@upnet.gr\', \'$2y$10$F2G6CYdGi3q/WEMU8dOtBuXbfY/NuvKTFOqwY4T0CRdUXMHY8UGk2\', \'La\', \'Polizia\', \'student\', DEFAULT)'),
(363, 'INSERT INTO student VALUES(\'st10434090@upnet.gr\', \'10434090\', \'Mpatsenou\', \'46\', \'Sideria\', \'164542\', \'Klavdios\',  \'55464852\', \'4673596\')'),
(364, 'INSERT INTO user VALUES (DEFAULT, \'st10434091@upnet.gr\', \'$2y$10$bFO6h1JkDyMXJ7A2IKiDluGDHdJU2NM/Ag968kffF51TVPUlXMJoK\', \'manousos\', \'Dlabiras\', \'student\', DEFAULT)'),
(365, 'INSERT INTO student VALUES(\'st10434091@upnet.gr\', \'10434091\', \'giannitson\', \'47\', \'Tripoli\', \'23100\', \'Georgios\',  \'24242424\', \'23242424\')'),
(366, 'INSERT INTO user VALUES (DEFAULT, \'st10434092@upnet.gr\', \'$2y$10$bi8.R0HYgEa.0WxY.pqWautme2lyWgcTSYJG9YAxsVDLGHRtUsXUC\', \'Nick\', \'Calathes\', \'student\', DEFAULT)'),
(367, 'INSERT INTO student VALUES(\'st10434092@upnet.gr\', \'10434092\', \'Ermou\', \'28\', \'Athens\', \'10551\', \'Giorgos\',  \'6945218947\', \'2105863247\')'),
(368, 'INSERT INTO user VALUES (DEFAULT, \'st10434093@upnet.gr\', \'$2y$10$D.TZc2JB2pfkv1RQb9Nueu4cClp21VcSbuhfQ836s5l6RT5DEe8uO\', \'Donald\', \'Trump\', \'student\', DEFAULT)'),
(369, 'INSERT INTO student VALUES(\'st10434093@upnet.gr\', \'10434093\', \'White House\', \'911\', \'Washington \', \'2049\', \'Fred\',  \'2024561414\', \'2024561111\')'),
(370, 'INSERT INTO user VALUES (DEFAULT, \'st10434094@upnet.gr\', \'$2y$10$I3AUbRGM9AMeP/xVl8yRjuZR5e4ybyEXJJutDvxfdmovCljB3Qkbi\', \'Pelina\', \'Anastasopoulou\', \'student\', DEFAULT)'),
(371, 'INSERT INTO student VALUES(\'st10434094@upnet.gr\', \'10434094\', \'poseidon\', \'20\', \'patras\', \'26332\', \'andreas\',  \'6949396780\', \'2610324567\')'),
(372, 'INSERT INTO user VALUES (DEFAULT, \'st10434095@upnet.gr\', \'$2y$10$aO75ADKMAZYiYMPlhM2jIu9UhXkxuH0kgkq6KZ2Na60mTurT6s2Kq\', \'Andriana\', \'Kapogiannopoulou\', \'student\', DEFAULT)'),
(373, 'INSERT INTO student VALUES(\'st10434095@upnet.gr\', \'10434095\', \'poseidon\', \'12\', \'patras\', \'26332\', \'George\',  \'6949396731\', \'2610321456\')'),
(374, 'INSERT INTO user VALUES (DEFAULT, \'st10434096@upnet.gr\', \'$2y$10$QlmFBELZVspDkQY6pgZ16ef7FEiahERaOPhxi17a58YtiB0DasHWa\', \'Rixardos\', \'Leodokardos\', \'student\', DEFAULT)'),
(375, 'INSERT INTO student VALUES(\'st10434096@upnet.gr\', \'10434096\', \'Patissia\', \'69\', \'Athens\', \'26312\', \'Apostolos\',  \'6969696969\', \'2106969420\')'),
(376, 'INSERT INTO user VALUES (DEFAULT, \'st10434097@upnet.gr\', \'$2y$10$KnqCvzOASuicz8tNcZan5ueQC/H2eEjgAEVvIWKS2XDOsWJjcVCLi\', \'Makis\', \'Savvas\', \'student\', DEFAULT)'),
(377, 'INSERT INTO student VALUES(\'st10434097@upnet.gr\', \'10434097\', \'Kiprou\', \'1\', \'Patra\', \'26441\', \'Sakis\',  \'6986756734\', \'2646045768\')'),
(378, 'INSERT INTO user VALUES (DEFAULT, \'st10434098@upnet.gr\', \'$2y$10$fKigdY0ZyQYMfsl80R3gIeqfklrTh2.1jzp/dQB3A3DR/Bgnb58Rm\', \'Nikos\', \'Stratomitros\', \'student\', DEFAULT)'),
(379, 'INSERT INTO student VALUES(\'st10434098@upnet.gr\', \'10434098\', \'Eolidos\', \'12\', \'Athens\', \'11853\', \'Vaggelis\',  \'6978846758\', \'2103478465\')'),
(380, 'INSERT INTO user VALUES (DEFAULT, \'st10434099@upnet.gr\', \'$2y$10$XbVinBY53rQIgERd.gk3SujLXnk/qn/C1OuhFM.xF8DiZbWmvgPri\', \'Lucifer\', \'Morningstar\', \'student\', DEFAULT)'),
(381, 'INSERT INTO student VALUES(\'st10434099@upnet.gr\', \'10434099\', \'Hell\', \'666\', \'Los Angeles\', \'66666\', \'God\',  \'6660000006\', \'2100000666\')'),
(382, 'INSERT INTO user VALUES (DEFAULT, \'st10434100@upnet.gr\', \'$2y$10$2LUovGkplXZvdFKveNAt2Olw8Qaak.l6TNFqwB6sFSJRYvbmUlQJO\', \'Natasha \', \'Romanoff\', \'student\', DEFAULT)'),
(383, 'INSERT INTO student VALUES(\'st10434100@upnet.gr\', \'10434100\', \'Avengers Tower\', \'1\', \'New York\', \'10110\', \'Alexei Shostakov\',  \'6970000008\', \'2100000888\')'),
(384, 'INSERT INTO user VALUES (DEFAULT, \'akomninos@ceid.upatras.gr\', \'$2y$10$TKdzhoAk0VJXUzTtqRXCZuD3iVq4kV/DFMEnrFYOXFyzgrjfpy3Me\', \'Andreas\', \'Komninos\', \'teacher\', DEFAULT)'),
(385, 'INSERT INTO teacher VALUES(\'akomninos@ceid.upatras.gr\', \'Network-centric systems\', \'2610996915\', \'6977998877\', \'CEID\', \'\')'),
(386, 'INSERT INTO user VALUES (DEFAULT, \'vasfou@ceid.upatras.gr\', \'$2y$10$qrptQsxHX2/DWBPTQ2RW1e8S8qAGFccHsTOwiyV8QIrp1BFMqvlrO\', \'Vasilis\', \'Foukaras\', \'teacher\', DEFAULT)'),
(387, 'INSERT INTO teacher VALUES(\'vasfou@ceid.upatras.gr\', \'Integrated Systems\', \'2610885511\', \'6988812345\', \'CEID\', \'\')'),
(388, 'INSERT INTO user VALUES (DEFAULT, \'karras@nterti.com\', \'$2y$10$YpIzaifAD0Gw/gSh/FmfheHUol2RKiYG.6syEGByi/eJRRUcYBqJu\', \'Basilis\', \'Karras\', \'teacher\', DEFAULT)'),
(389, 'INSERT INTO teacher VALUES(\'karras@nterti.com\', \'Artificial Intelligence\', \'23\', \'545\', \'CEID\', \'\')'),
(390, 'INSERT INTO user VALUES (DEFAULT, \'eleni@ceid.gr\', \'$2y$10$/X3t0pcTsItv1JzwO9siLe89vRFRefQ1B7KsoEhmMIR48sBoNrl7m\', \'Eleni\', \'Voyiatzaki\', \'teacher\', DEFAULT)'),
(391, 'INSERT INTO teacher VALUES(\'eleni@ceid.gr\', \'WEB\', \'34\', \'245\', \'CEID\', \'\')'),
(392, 'INSERT INTO user VALUES (DEFAULT, \'hozier@ceid.upatras.gr\', \'$2y$10$.uzr83mQk9uypdrJlUEmsODxWVPIP.s6dYDMCPRhn7ljaO.JjRAIW\', \'Andrew\', \'Hozier Byrne\', \'teacher\', DEFAULT)'),
(393, 'INSERT INTO teacher VALUES(\'hozier@ceid.upatras.gr\', \'Artificial Intelligence\', \'2610170390\', \'6917031990\', \'CEID\', \'\')');
INSERT INTO `sql_logs` (`id`, `sql_text`) VALUES
(394, 'INSERT INTO user VALUES (DEFAULT, \'nikos.korobos12@gmail.com\', \'$2y$10$/vaPcsWfeP5GxCyoDku9Le22w2B12NS2kAxa9ZlYz7QYePCYTClsW\', \'Nikos\', \'Korobos\', \'teacher\', DEFAULT)'),
(395, 'INSERT INTO teacher VALUES(\'nikos.korobos12@gmail.com\', \'Data Engineering\', \'2610324365\', \'6978530352\', \'IT\', \'\')'),
(396, 'INSERT INTO user VALUES (DEFAULT, \'kostkaranik@gmail.com\', \'$2y$10$biGNweZ.4FHgCBABLw7GVe9crRORDuyfSgQ.U/jv2ZpbbMkWJgmpq\', \'Kostas\', \'Karanikolos\', \'teacher\', DEFAULT)'),
(397, 'INSERT INTO teacher VALUES(\'kostkaranik@gmail.com\', \'informatics\', \'2610324242\', \'6934539920\', \'CEID\', \'\')'),
(398, 'INSERT INTO user VALUES (DEFAULT, \'mpampis123@gmail.com\', \'$2y$10$Luj8HNV5RPs.DApcLbweoeZS4x36uU3ooBHgherWoBcloDxpes/ZS\', \'Mpampis\', \'Sougias\', \'teacher\', DEFAULT)'),
(399, 'INSERT INTO teacher VALUES(\'mpampis123@gmail.com\', \'Arxeologia\', \'2610945934\', \'6947845334\', \'Arxeologias\', \'\')'),
(400, 'INSERT INTO user VALUES (DEFAULT, \'makavelibet@gmail.com\', \'$2y$10$WVb7Uz5phbr7padjoNIZPuLX/cND4Rip.65GvMiZyYvhM9ZA8pNZ6\', \'Daskalos\', \'Makaveli\', \'teacher\', DEFAULT)'),
(401, 'INSERT INTO teacher VALUES(\'makavelibet@gmail.com\', \'Business\', \'2310231023\', \'6929349285\', \'Economics\', \'\')'),
(402, 'INSERT INTO user VALUES (DEFAULT, \'palam@upatras.gr\', \'$2y$10$F30UWhAo6y0Ye9xOb86zSe37PLnfT5ThwzzFyFXNP8VewkFr/TQ7K\', \'Maria\', \'Palami\', \'teacher\', DEFAULT)'),
(403, 'INSERT INTO teacher VALUES(\'palam@upatras.gr\', \'SQL injections\', \'1234567890\', \'6988223322\', \'Engineering\', \'\')'),
(404, 'INSERT INTO user VALUES (DEFAULT, \'meniT@upatras.gr\', \'$2y$10$trJfzg36cCKmePeQUj/IP.cpHrFbwmkBU0CMdrYpZt1M3UNkiXehW\', \'Meni\', \'Talaiporimeni\', \'teacher\', DEFAULT)'),
(405, 'INSERT INTO teacher VALUES(\'meniT@upatras.gr\', \'t\', \'2610333999\', \'6999990999\', \'CEID\', \'\')'),
(406, 'INSERT INTO user VALUES (DEFAULT, \'tzouli.ax@upatras.gr\', \'$2y$10$8dVHIDXRFJAUiWEECuKGnuKPouyjkhk4OXBnNqfMFamW3PvVNJ2DW\', \'Tzouli\', \'Alexandratou\', \'teacher\', DEFAULT)'),
(407, 'INSERT INTO teacher VALUES(\'tzouli.ax@upatras.gr\', \'Big Data\', \'2264587412\', \'6996116921\', \'CEID\', \'\')'),
(408, 'INSERT INTO user VALUES (DEFAULT, \'karikhs@yahoo.gr\', \'$2y$10$Pmdx/xosFVc3gBMIwXAiiOIpxg847VZtCz4sTNMS7gLVud/6CLnsC\', \'Karikhs\', \'Raftel\', \'teacher\', DEFAULT)'),
(409, 'INSERT INTO teacher VALUES(\'karikhs@yahoo.gr\', \'Pharmaceutical Drugs\', \'69\', \'6945258923\', \'Chemistry\', \'\')'),
(410, 'INSERT INTO user VALUES (DEFAULT, \'toxrusoftiari@funerals.gr\', \'$2y$10$35hg/qFPo7rC3AUCs1kFP.NJh6LUgqTteXX8TXa8eyMp6WJxSCaTa\', \'Vlasis\', \'Restas\', \'teacher\', DEFAULT)'),
(411, 'INSERT INTO teacher VALUES(\'toxrusoftiari@funerals.gr\', \'Nekro8aftiki\', \'78696910\', \'69696964\', \'Nekro8aftikis\', \'\')'),
(412, 'INSERT INTO user VALUES (DEFAULT, \'fatbanker@kapitalas.gr\', \'$2y$10$9jPQ3iFwgUqPoxehrMD7EetlEfqo7lPtD8fKiyxmeeAWyMkiFIJuq\', \'Fat \', \'Banker\', \'teacher\', DEFAULT)'),
(413, 'INSERT INTO teacher VALUES(\'fatbanker@kapitalas.gr\', \'kippah\', \'6942014121\', \'6969784205\', \'Froutemporiki\', \'\')'),
(414, 'INSERT INTO user VALUES (DEFAULT, \'info@hamzat.gr\', \'$2y$10$HFVzsQM/7OGEagaW/fVe1.8ounyZx/vbuo7ohRyGloQkkRo7RiS5u\', \'Hamze\', \'Mohamed\', \'teacher\', DEFAULT)'),
(415, 'INSERT INTO teacher VALUES(\'info@hamzat.gr\', \'Logistics\', \'1245789513\', \'1456983270\', \'Social Rehabitation\', \'\')'),
(416, 'INSERT INTO user VALUES (DEFAULT, \'snikolaou@upatras.gr\', \'$2y$10$Fd026XGkwtTEWc7iOBObhu1D/fTQzOb6Yaa9KzHI7jSF5gVCR00eG\', \'Stefania\', \'Nikolaou\', \'teacher\', DEFAULT)'),
(417, 'INSERT INTO teacher VALUES(\'snikolaou@upatras.gr\', \'Information Theory\', \'2106723456\', \'6942323452\', \'ECE\', \'\')'),
(418, 'INSERT INTO user VALUES (DEFAULT, \'pdanezis@upatras.gr\', \'$2y$10$K1euySQDSPYhBLczIhewTuTcKyT.IDpzu12tKau4JGI0/BC3g8ctu\', \'Petros\', \'Danezis\', \'teacher\', DEFAULT)'),
(419, 'INSERT INTO teacher VALUES(\'pdanezis@upatras.gr\', \'Telecommunication Electronics\', \'2610908888\', \'6971142424\', \'ECE\', \'\')'),
(420, 'INSERT INTO user VALUES (DEFAULT, \'eustratiospap@gmail.com\', \'$2y$10$N/1IZOlUdSVzxoKY0AoYD.wW4f0f3ymv7H6OVSNITTw/cxrBT7Dei\', \'Papadopoulos \', \'Eustathios\', \'teacher\', DEFAULT)'),
(421, 'INSERT INTO teacher VALUES(\'eustratiospap@gmail.com\', \'Physics\', \'210-1234567\', \'690-1234567\', \'Physics\', \'\')'),
(422, 'INSERT INTO user VALUES (DEFAULT, \'mariakon@gmail.com\', \'$2y$10$BLWmIsJSVpqsKSPe39NunezpvFTLPW38sNxWbGEQOyagXYAi0v4bS\', \'Konstantinou\', \'Maria\', \'teacher\', DEFAULT)'),
(423, 'INSERT INTO teacher VALUES(\'mariakon@gmail.com\', \'Statistics and Probability\', \'2310-7654321\', \'694-7654321\', \'Mathematics\', \'\')'),
(424, 'INSERT INTO user VALUES (DEFAULT, \'jimnik@gmail.com\', \'$2y$10$vHr3MmJb335tVr0Sf8Hyle.tUb8QWhOPuLS8nHjkP/yL2ltYFtT0i\', \'Jim\', \'Nikolaou\', \'teacher\', DEFAULT)'),
(425, 'INSERT INTO teacher VALUES(\'jimnik@gmail.com\', \'Artificial Intelligence\', \'2610-9876543\', \'697-9876543\', \'Computer Science\', \'\')'),
(426, 'INSERT INTO user VALUES (DEFAULT, \'sophiamich@gmail.com\', \'$2y$10$TiVTPNK2xDC8YNAyG8N4NeCFw7nwO2fo3zpfVIyhhUG6Zp.O8lexa\', \'Sophia\', \'Michailidi\', \'teacher\', DEFAULT)'),
(427, 'INSERT INTO teacher VALUES(\'sophiamich@gmail.com\', \'Economic Theory\', \'2310-5432109\', \'698-5432109\', \'Economics\', \'\')'),
(428, 'INSERT INTO user VALUES (DEFAULT, \'michaelpap@gmail.com\', \'$2y$10$KsD9XDm6dBjyO5g3Npm8bOrjyBfwSil5UWDNj/g8DcOM9Lslu7L8e\', \'Michael \', \'Papadreou\', \'teacher\', DEFAULT)'),
(429, 'INSERT INTO teacher VALUES(\'michaelpap@gmail.com\', \'Renewable Energy Systems\', \'2610-4455667\', \'697-4455667\', \'Electrical Engineering\', \'\')'),
(430, 'INSERT INTO user VALUES (DEFAULT, \'elonmusk@gmail.com\', \'$2y$10$SK5NoCUgEj3SsTQzkGA1RuUXY2S/1PzhpFfBYSpHhn5oidbqDwwmi\', \'Elon\', \'Musk\', \'teacher\', DEFAULT)'),
(431, 'INSERT INTO teacher VALUES(\'elonmusk@gmail.com\', \'Electric Vehicles\', \'1-888-518-3752\', \'Null\', \'Department of Physics\', \'\')'),
(432, 'INSERT INTO user VALUES (DEFAULT, \'abcdef@example.com\', \'$2y$10$EEygR7znip5TnDTvrZ4t6.K0MDfozgmMYm679qbakOK5cznx5AKCe\', \'Kostas\', \'Kalantas\', \'teacher\', DEFAULT)'),
(433, 'INSERT INTO teacher VALUES(\'abcdef@example.com\', \'AI\', \'2610121212\', \'6912121212\', \'department\', \'\')'),
(434, 'INSERT INTO user VALUES (DEFAULT, \'abcdefg@example.com\', \'$2y$10$QmeIUpyCHgPbGtADSLhNnOPPjljIGBQRtQO2ZmKUwSTR0uiggrgJW\', \'Giorgis\', \'Fousekis\', \'teacher\', DEFAULT)'),
(435, 'INSERT INTO teacher VALUES(\'abcdefg@example.com\', \'topic\', \'land\', \'mob\', \'dep\', \'\')'),
(436, 'INSERT INTO user VALUES (DEFAULT, \'exxample@example.com\', \'$2y$10$nmtGFPuJ5Tk216uye9xljel485OmHwcl3eCmBlSbV2cziOMCqJYh.\', \'Nikos\', \'Koukos\', \'teacher\', DEFAULT)'),
(437, 'INSERT INTO teacher VALUES(\'exxample@example.com\', \'top\', \'la\', \'mo\', \'de\', \'\')'),
(438, 'INSERT INTO user VALUES (DEFAULT, \'patric@xrusopsaros.com\', \'$2y$10$VmELYmsbswV3Q1jasiA6/OY3EdmrQmrVO9SIxNLiWc3.FS1tcIneC\', \'patrick\', \'xrusopsaros\', \'teacher\', DEFAULT)'),
(439, 'INSERT INTO teacher VALUES(\'patric@xrusopsaros.com\', \'thalasioi ipopotamoi\', \'2610567917\', \'6952852742\', \'Solomos\', \'\')'),
(440, 'INSERT INTO user VALUES (DEFAULT, \'paraskevas@kobres.ath\', \'$2y$10$YaTIj8L4sWWNUCr8Wva2Cu74uOb.7DVwLVDDSwMhCpK3Tm3OaFaJu\', \'Paraskevas\', \'koutsikos\', \'teacher\', DEFAULT)'),
(441, 'INSERT INTO teacher VALUES(\'paraskevas@kobres.ath\', \'Provata\', \'2298042035\', \'6969696969\', \'Ktinotrofia\', \'\')'),
(442, 'INSERT INTO user VALUES (DEFAULT, \'masterassassin@upatras.ceid.gr\', \'$2y$10$0wNvSrZb8IpUfV.HhEOZMus3yFZ18tJw6J5anE51XSYwO4LPh0AVm\', \'Ezio\', \'Auditore da Firenze\', \'teacher\', DEFAULT)'),
(443, 'INSERT INTO teacher VALUES(\'masterassassin@upatras.ceid.gr\', \'assassinations\', \'null\', \'null\', \'Monterigioni\', \'\')'),
(444, 'INSERT INTO user VALUES (DEFAULT, \'spana@hotmail.com\', \'$2y$10$ndARK7e7QoZY71Ms6PoN4OkIqrlG0yByQlrnhvwdPlxFSFowHQrey\', \'Sotiris\', \'Panaikas\', \'teacher\', DEFAULT)'),
(445, 'INSERT INTO teacher VALUES(\'spana@hotmail.com\', \'Bet Predictions\', \'1235654899\', \'2310521010\', \'opap\', \'\')'),
(446, 'INSERT INTO user VALUES (DEFAULT, \'anittamaxwynn@cashmoney.com\', \'$2y$10$JNlY2cpD.isMJ4skhhPOf.cz7l1azBoupTJJ4aGRBokyHZekaQNVS\', \'Anitta\', \'Wynn\', \'teacher\', DEFAULT)'),
(447, 'INSERT INTO teacher VALUES(\'anittamaxwynn@cashmoney.com\', \'Probability\', \'2610486396\', \'698888884\', \'Computer Engineering\', \'\')'),
(448, 'INSERT INTO user VALUES (DEFAULT, \'goatmanager@thrylos.gr\', \'$2y$10$9LKuxTZBPUKzSUKGcWZQXO.em2oHvKf/ZOlhCPOrJsXn2Y/6Gi6wa\', \'Jose Luis\', \'Mendilibar\', \'teacher\', DEFAULT)'),
(449, 'INSERT INTO teacher VALUES(\'goatmanager@thrylos.gr\', \'Sentres\', \'2105555555\', \'6922222222\', \'Conference League\', \'\')'),
(450, 'INSERT INTO user VALUES (DEFAULT, \'liampayne@ceid.upatras.gr\', \'$2y$10$qf.ncJ7ivBFHL8P8PXJXLugIne7QmFEt0pmn8PAlqe1J6rh9PucAC\', \'Liam\', \'Payne\', \'teacher\', DEFAULT)'),
(451, 'INSERT INTO teacher VALUES(\'liampayne@ceid.upatras.gr\', \'Cryptography\', \'2462311345\', \'6980847234\', \'CEID\', \'\')'),
(452, 'INSERT INTO user VALUES (DEFAULT, \'zaynmalik@gmail.com\', \'$2y$10$KrvWZEFgaDgsRSjEHh75RuxJQorDhzrg68BZ6SKvM5oR3OShR4BvO\', \'Zayn\', \'Malik\', \'teacher\', DEFAULT)'),
(453, 'INSERT INTO teacher VALUES(\'zaynmalik@gmail.com\', \'Oriented programing\', \'2310221234\', \'6971006355\', \'CEID\', \'\')'),
(454, 'INSERT INTO user VALUES (DEFAULT, \'papas2@yahoo.gr\', \'$2y$10$ZEp95TH3xLboN3fslhPfMe93vjiW5KSAdt23s0XCT6h/eiUXCbWx2\', \'Nikos \', \'Papas\', \'teacher\', DEFAULT)'),
(455, 'INSERT INTO teacher VALUES(\'papas2@yahoo.gr\', \'manas\', \'spiti\', \'69854512\', \'Hastle\', \'\')'),
(456, 'INSERT INTO user VALUES (DEFAULT, \'mavros@bbs.af\', \'$2y$10$SjO29KOv4788QTY3P.pP3us6ywu/lHTTwZCEGj/m2Vwm6pT3MiKdi\', \'Oikoumenikos\', \'Prasinos\', \'teacher\', DEFAULT)'),
(457, 'INSERT INTO teacher VALUES(\'mavros@bbs.af\', \'Nikolakos\', \'987546123\', \'69 6 9 69\', \'Ougantiani Filosofia\', \'\')'),
(458, 'INSERT INTO user VALUES (DEFAULT, \'ihatepotter@hocusmail.com\', \'$2y$10$7xa10o9TvxUNIvcZGfdGE.yd4mXkF0GFp/01xa2zefGVIcZg2F96y\', \'Severus\', \'Snape\', \'teacher\', DEFAULT)'),
(459, 'INSERT INTO teacher VALUES(\'ihatepotter@hocusmail.com\', \'math 2\', \'26210 26441\', \'6926626226\', \'ceid\', \'\')'),
(460, 'INSERT INTO user VALUES (DEFAULT, \'tungtungtung@itbr.com\', \'$2y$10$5H3415xrPWwBZPcsOhV0eOQq3TjBZW.vZzrpL4Y2M4yws/jYYEur2\', \'Tung Tung\', \'Sahur\', \'teacher\', DEFAULT)'),
(461, 'INSERT INTO teacher VALUES(\'tungtungtung@itbr.com\', \'Graphs\', \'210 1425735\', \'69434619363\', \'CEID\', \'\')'),
(462, 'INSERT INTO user VALUES (DEFAULT, \'up1084561@ac.upatras.gr\', \'$2y$10$BALkNtbfa419vNSnstUNpOnzaj5UgOPTJc9SWcizeqYToTN58qYca\', \'Maria\', \'Papadopoulou\', \'teacher\', DEFAULT)'),
(463, 'INSERT INTO teacher VALUES(\'up1084561@ac.upatras.gr\', \'Computer science\', \'2610123456\', \'6912345678\', \'CEID\', \'\')'),
(464, 'INSERT INTO user VALUES (DEFAULT, \'up1234567@ac.upatras.gr\', \'$2y$10$N89BhMsbMKBmV418I77uDeOZzjvooLXboco2Dn.HcopCAUTJTm3Pq\', \'Nikos\', \'Georgiou\', \'teacher\', DEFAULT)'),
(465, 'INSERT INTO teacher VALUES(\'up1234567@ac.upatras.gr\', \'Physics\', \'2610111111\', \'6911111111\', \'CEID\', \'\')'),
(466, 'INSERT INTO user VALUES (DEFAULT, \'mari-bro@beast.com\', \'$2y$10$94M9EzhbbwbncBXCcABqTu3pvp9M81yYZ50Q/iBW.Q0kryNW6VKyi\', \'MARI\', \'BRO\', \'teacher\', DEFAULT)'),
(467, 'INSERT INTO teacher VALUES(\'mari-bro@beast.com\', \'Life\', \'666\', \'666\', \'no\', \'\')'),
(468, 'INSERT INTO user VALUES (DEFAULT, \'goat@messi.cr\', \'$2y$10$qK65SNm3Il7c3WIf/hiT1ekYHTPjdbT81nJYR2YJkEXsl9jZMuPjm\', \'<a href=\"https://www.youtube.com\">G</a>\', \'Goat\', \'teacher\', DEFAULT)'),
(469, 'INSERT INTO teacher VALUES(\'goat@messi.cr\', \'no\', \'666\', \'666\', \'No\', \'\')'),
(470, 'INSERT INTO user VALUES (DEFAULT, \'capucapu@ccino.assassino\', \'$2y$10$iavCbyZAGb0yafkwcJjJu.easJRimBir1rDSCfrbVxkWT5Bc24lSO\', \'Brain\', \'Rot\', \'teacher\', DEFAULT)'),
(471, 'INSERT INTO teacher VALUES(\'capucapu@ccino.assassino\', \'no\', \'9\', \'6\', \'Brainrot\', \'\')'),
(472, 'INSERT INTO user VALUES (DEFAULT, \'johnusins@upatras.gr\', \'$2y$10$AF3XcZiRbl41YMzwjFPiTe5uxHpA.TVZUuym9E7/PJF/nN4RlQBrS\', \'Giannis \', \'Sinsidis\', \'teacher\', DEFAULT)'),
(473, 'INSERT INTO teacher VALUES(\'johnusins@upatras.gr\', \'Ypsiloikardiakoipalmoi\', \'2610645698\', \'697878787\', \'Palindromikis kiniseos\', \'\')'),
(474, 'INSERT INTO user VALUES (DEFAULT, \'georgeNofragka@utsipis.gr\', \'$2y$10$pK/rk1FpIjk9mfnxPF3oPe2OZ35cxtT3fpHUIg6iSSIUYoaqe.dXC\', \'Giorgos\', \'Fragkofonias\', \'teacher\', DEFAULT)'),
(475, 'INSERT INTO teacher VALUES(\'georgeNofragka@utsipis.gr\', \'oikonomia tou tsipi\', \'2610546132\', \'697878787\', \'Real Economics \', \'\')'),
(476, 'INSERT INTO user VALUES (DEFAULT, \'tsilis@tsilliuniversity.gr\', \'$2y$10$FRWvZ3fcCDR1oucntDzXDuLCyrlgf95IYXcBRByuGxSzQpkoWUNXi\', \'Ioannis\', \'Tsilis\', \'teacher\', DEFAULT)'),
(477, 'INSERT INTO teacher VALUES(\'tsilis@tsilliuniversity.gr\', \'Iliopoulos to fainomeno\', \'2610212121\', \'6921212121\', \'Tsili Kafeneio\', \'\')'),
(478, 'INSERT INTO user VALUES (DEFAULT, \'prasinosfrouros@gmail.com\', \'$2y$10$GuIf0msH4oG7iJg4aRkhB.CSAQb.BuMKhjVIlxHPnB2AtOXaOMY32\', \'Prasinos \', \'Frouros\', \'teacher\', DEFAULT)'),
(479, 'INSERT INTO teacher VALUES(\'prasinosfrouros@gmail.com\', \'alafouzo poula\', \'261056458\', \'698778788\', \'Panathinaiki agwgh\', \'\')'),
(480, 'INSERT INTO user VALUES (DEFAULT, \'Gbonassera@gmail.com\', \'$2y$10$YC1gFTQEKncWxR9Gvfm4K.Wr33rIWoXKIJeGKB3ShXvDVxnipkcZ2\', \'Giorgio \', \'Bonassera\', \'teacher\', DEFAULT)'),
(481, 'INSERT INTO teacher VALUES(\'Gbonassera@gmail.com\', \'spagetti aldente\', \'23131131\', \'6575754\', \'cuccina italiana\', \'\')'),
(482, 'INSERT INTO user VALUES (DEFAULT, \'GBar@gmail.com\', \'$2y$10$1edvSZqCEI72UE7wAnZST.Y8S1SJxr1Y4U/d.IkqfPbQ9Y5vwzpvy\', \'Giorgos\', \'Bartzokas\', \'teacher\', DEFAULT)'),
(483, 'INSERT INTO teacher VALUES(\'GBar@gmail.com\', \'Basketball Strategy\', \'2108743265\', \'6932178542\', \'SEF\', \'\')'),
(484, 'INSERT INTO user VALUES (DEFAULT, \'apan@upatras.gr\', \'$2y$10$XMOFR8BbvbHe5/y9f5ku/ugw96Zq0HwDdouXwMJavQ9jKrmQpJkcS\', \'Aristeidis\', \'Panopoulos\', \'teacher\', DEFAULT)'),
(485, 'INSERT INTO teacher VALUES(\'apan@upatras.gr\', \'Data\', \'2645023475\', \'6987863645\', \'CEID\', \'\')'),
(486, 'INSERT INTO user VALUES (DEFAULT, \'panari@upatras.gr\', \'$2y$10$o62KilpkkJDtIBJmYTZqv.BrT9vJUad/1kuT/.rlbEOC.9NcGdzlm\', \'Panagiotis\', \'Aristopoulos\', \'teacher\', DEFAULT)'),
(487, 'INSERT INTO teacher VALUES(\'panari@upatras.gr\', \'PLA\', \'2657481902\', \'6974568973\', \'CEID\', \'\')'),
(488, 'INSERT INTO user VALUES (DEFAULT, \'billieeilish@upatras.gr\', \'$2y$10$N/0PP9L7Ql0Oq/1v71itB.J.9oUtCYqynbVFk9YP22yTL5PqhYN1a\', \'Billie \', \'Eilish\', \'teacher\', DEFAULT)'),
(489, 'INSERT INTO teacher VALUES(\'billieeilish@upatras.gr\', \'Sound Engineering\', \'2100000011\', \'6930000011\', \'CEID\', \'\')'),
(490, 'INSERT INTO user VALUES (DEFAULT, \'girokomeio@upatras.gr\', \'$2y$10$pSZuk/OHynHg2QH2/eM6U.5ojanMH9zmDikyaQDRXKI5FnUzoLAvS\', \'Hlias\', \'Psinakis\', \'teacher\', DEFAULT)'),
(491, 'INSERT INTO teacher VALUES(\'girokomeio@upatras.gr\', \'Management\', \'2100000444\', \'6930000088\', \'CEID\', \'\')'),
(492, 'relation id: 3 creator:  exam1:  exam2: '),
(493, 'relation id: 3 creator:  exam1:  exam2: '),
(494, 'relation id: 3 creator:  exam1:  exam2: '),
(495, 'UPDATE student_thesis_relation SET status = \'canceled\' WHERE id = 3'),
(496, 'relation id: 3 creator:  exam1:  exam2: ');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `email` varchar(63) NOT NULL,
  `am` int(21) NOT NULL,
  `street` text NOT NULL,
  `number` int(11) NOT NULL,
  `city` text NOT NULL,
  `postcode` int(11) NOT NULL,
  `father_name` text NOT NULL,
  `cellphone` varchar(10) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`email`, `am`, `street`, `number`, `city`, `postcode`, `father_name`, `cellphone`, `phone`) VALUES
('104333999@students.upatras.gr', 10433999, 'test street', 45, 'test city', 39955, 'Orestis', '6939096979', '2610333000'),
('st10434000@upnet.gr', 10434000, 'Ermou', 18, 'Athens', 10431, 'George', '6970001112', '2610123456'),
('st10434001@upnet.gr', 10434001, 'Adrianou', 20, 'Thessaloniki', 54248, 'Giannis', '6970001112', '2610778899'),
('st10434002@upnet.gr', 10434002, 'str', 1, 'patra', 26222, 'father', '6912345678', '2610123456'),
('st10434003@upnet.gr', 10434003, 'Fascination', 17, 'London', 1989, 'Alex', '6902051989', '2610251989'),
('st10434004@upnet.gr', 10434004, 'Cretaceous', 2, 'Laramidia', 54321, 'Daspletosaurus', '6911231234', '2610432121'),
('st10434005@upnet.gr', 10434005, 'Smith Str.', 33, 'New York ', 59, 'Paul', '-', '-'),
('st10434006@upnet.gr', 10434006, 'Johnson', 90, 'New York ', 70, 'José ', '-', '-'),
('st10434007@upnet.gr', 10434007, 'Sortef', 29, 'New York', 26, 'Douglas', '-', '-'),
('st10434008@upnet.gr', 10434008, 'Groove Str.', 23, 'Los Angeles', 1, 'none', '-', '-'),
('st10434009@upnet.gr', 10434009, 'Magic Str. ', 8, 'New Orleans', 35, 'Jess ', '67', '56'),
('st10434010@upnet.gr', 10434010, 'Substance Str.', 25, 'Los Angeles ', 7, 'Paul', '90', '67'),
('st10434011@upnet.gr', 10434011, 'Pearl Str. ', 4, 'Michigan', 8, 'Lee', '-', '-'),
('st10434012@upnet.gr', 10434012, 'Midsommar Str. l', 1, 'Away', 24, '-', '2', '5'),
('st10434013@upnet.gr', 10434013, 'Lonely Str.', 27, 'Bridport', -7, 'Ray', '43', '56'),
('st10434014@upnet.gr', 10434014, 'Almadovar', 55, 'Madrid', 23, 'Eduardo ', '4', '5'),
('st10434015@upnet.gr', 10434015, 'Poor Str.', 3, 'Paris ', 34, 'none', '4455555', '2333333'),
('st10434016@upnet.gr', 10434016, 'Mpouat Str.', 23, 'Athens', 10, 'Basil', '45', '09'),
('st10434017@upnet.gr', 10434017, 'Desperado Str. ', 24, 'Madrid ', 656, 'Sami', '221', '344'),
('st10434018@upnet.gr', 10434018, 'Before Str.', 36, 'Paris', 567, 'Kieślowski', '3455', '1223'),
('st10434019@upnet.gr', 10434019, 'Trypes Str.', 3, 'Athens', 2354, 'Theos', '45', '23'),
('st10434020@upnet.gr', 10434020, 'Entexno Str. ', 2, 'Athens', 345, 'Kosmos', '345', '657'),
('st10434021@upnet.gr', 10434021, 'Pagkrati Str.', 25, 'Athens', 2456, 'Gates', '354', '897'),
('st10434022@upnet.gr', 10434022, 'Mpouat Str.', 24, 'Athens', 5749, 'Ellhniko', '32453', '23557'),
('st10434023@upnet.gr', 10434023, 'Boiler Room St', 365, 'New York', 360, 'Jon', '693653365', '2610365365'),
('st10434024@upnet.gr', 10434024, 'Dragon St', 2021, 'Kings Landing', 2021, 'Viserys', '6910101010', '2610101010'),
('st10434025@upnet.gr', 10434025, 'Colon Str.', 124, 'NY', 11045, 'Carlos', '5841852384', '2584694587'),
('st10434026@upnet.gr', 10434026, 'Korinthou', 266, 'Patras', 26223, 'Ioannis', '+306975562', '+302105562'),
('st10434027@upnet.gr', 10434027, 'Nosferatu Str.', 34, 'London', 567, 'Roger', '46478', '436'),
('st10434028@upnet.gr', 10434028, 'Kanakari', 135, 'Patra', 26440, 'Baek Yi Jin', '6978756432', '2610443568'),
('st10434029@upnet.gr', 10434029, 'Kolokotroni', 6, 'Athens', 34754, 'George', '6987655433', '2104593844'),
('st10434030@upnet.gr', 10434030, 'Triton', 12, 'Salamina', 12216, 'Giannis', '6946901012', '210553985'),
('st10434031@upnet.gr', 10434031, 'Jason ', 33, 'London', 44391, 'Tasos', '6923144642', '2109993719'),
('st10434032@upnet.gr', 10434032, 'Masalias', 4, 'Sparti', 32095, 'Giannis', '6948308576', '2279036758'),
('st10434033@upnet.gr', 10434033, 'Athinon', 4, 'Athens', 28482, 'Petros', '6953782102', '2100393022'),
('st10434034@upnet.gr', 10434034, 'korinthou', 56, 'patras', 56892, 'nikos', '6934527125', '2610485796'),
('st10434035@upnet.gr', 10434035, 'Othonos kai Amalias ', 100, 'Patras', 26500, 'None', '6028371830', '2610381393'),
('st10434036@upnet.gr', 10434036, 'vanizelou', 36, 'Patras', 26500, 'Pfloutsou', '6947937524', '2610995999'),
('st10434037@upnet.gr', 10434037, 'kolokotroni', 12, 'Patras', 26500, 'mauragkas', '6935729345', '2610978423'),
('st10434038@upnet.gr', 10434038, 'Alexandras Ave', 12, 'Athens', 11521, 'Iman', '6912345678', '2101234567'),
('st10434039@upnet.gr', 10434039, 'Panepisthmiou', 69, 'Patras', 26441, 'Prafit', '6969966996', '2610654321'),
('st10434040@upnet.gr', 10434040, 'karaiskakis', 69, 'tilted tower', 4747, 'epic games', '6988112233', '2610747474'),
('st10434041@upnet.gr', 10434041, 'Novi', 25, 'Athens', 20033, 'Kleft', '6900008005', '2109090901'),
('st10434042@upnet.gr', 10434042, 'Britpop', 7, 'London', 2021, 'PC Music', '1212121212', '2121212121'),
('st10434043@upnet.gr', 10434043, 'Mouratidi', 4, 'New York', 25486, 'Paparizou', '6980081351', '2108452666'),
('st10434044@upnet.gr', 10434044, 'Ag Kiriakis', 11, 'Papaou', 50501, 'Aelakis', '698452154', '222609123'),
('st10434045@upnet.gr', 10434045, 'Wall Street', 69, 'Jerusalem', 478, 'Mike Oxlong', '696969420', '69696969'),
('st10434046@upnet.gr', 10434046, 'Krasopotirou', 69, 'Colarato', 14121, 'Adolf Heisenberg', '4747859625', '6913124205'),
('st10434047@upnet.gr', 10434047, 'Achilleos', 21, 'Athens', 10437, 'Dimitris', '6945533213', '2109278907'),
('st10434048@upnet.gr', 10434048, 'Adrianou ', 65, 'Athens', 10556, 'Nikos', '6978989000', '2108745645'),
('st10434049@upnet.gr', 10434049, 'Chaonias ', 54, 'Athens', 10441, 'Petros', '6945622222', '2108724324'),
('st10434050@upnet.gr', 10434050, 'Chomatianou', 32, 'Athens', 10439, 'Giorgos', '6941133333', '2107655555'),
('st10434051@upnet.gr', 10434051, 'Dafnidos', 4, 'Athens', 11364, 'Pavlos', '6976644333', '2108534566'),
('st10434052@upnet.gr', 10434052, 'Danais', 9, 'Athens', 11631, 'Kostas', '6976565655', '2107644999'),
('st10434053@upnet.gr', 10434053, 'novi lane', 33, 'Patras', 26478, 'Stoiximan', '6999999999', '2610420420'),
('st10434054@upnet.gr', 10434054, 'Ermou', 24, 'Athens', 10563, 'Nikolaos', '693-567890', '210-567890'),
('st10434055@upnet.gr', 10434055, 'Kyprou', 42, 'Patra', 26441, 'Kwstas', '698-123456', '2610-12345'),
('st10434056@upnet.gr', 10434056, 'Kolokotroni', 10, 'Larissa', 41222, 'Petros', '697-456789', '2410-45678'),
('st10434057@upnet.gr', 10434057, 'Zakunthou', 36, 'Volos', 10654, 'Apostolos', '695-678901', '210-678901'),
('st10434058@upnet.gr', 10434058, 'pelopidas ', 52, 'patra', 28746, 'george', '6932323232', '2610555555'),
('st10434059@upnet.gr', 10434059, 'anapafseos', 34, 'patra', 26503, 'takis', '69090909', '2691045092'),
('st10434060@upnet.gr', 10434060, 'Ermou', 34, 'Patras', 29438, 'Giorgos', '6943126767', '2610254390'),
('st10434061@upnet.gr', 10434061, 'Grove', 12, 'San Andreas', 123456, 'NULL', '123456789', '123456789'),
('st10434062@upnet.gr', 10434062, 'Niktolouloudias ', 123, 'Chalkida', 23456, 'George', '6980987654', '2613456089'),
('st10434063@upnet.gr', 10434063, 'Vatomourias', 55, 'Pano Raxoula', 2345, 'Mixail', '6987543345', '2456034567'),
('st10434064@upnet.gr', 10434064, 'Patnanasis', 45, 'Patra', 26440, 'Menelaos', '6987555433', '2610435988'),
('st10434065@upnet.gr', 10434065, 'AGIOU IOANNNI RENTI', 7, 'PEIRAIAS', 47200, 'PETROS', '210583603', '694837204'),
('st10434066@upnet.gr', 10434066, 'OAKA', 25, 'ATHENS', 666, 'GIANNAKOPOULOS', '6906443321', '6982736199'),
('st10434067@upnet.gr', 10434067, 'Enjoy The Silence', 1990, 'London', 1990, 'Dave', '1234567770', '1234567890'),
('st10434068@upnet.gr', 10434068, 'your', 69, 'mom', 15584, 'father', '2223', '222'),
('st10434069@upnet.gr', 10434069, 'Araksou', 12, 'Giotopoli', 69420, 'Greg', '6978722312', '210 924199'),
('st10434070@upnet.gr', 10434070, 'Mpofa', 10, 'Kolonia', 12345, 'Mpamias', '6935358553', '2105858858'),
('st10434071@upnet.gr', 10434071, 'lootlake', 12, 'tilted', 26500, 'johnesy', '2610987632', '6947830287'),
('st10434072@upnet.gr', 10434072, 'kokmotou', 69, 'thessaloniki', 20972, 'mourlo', '2610810763', '6947910234'),
('st10434073@upnet.gr', 10434073, 'Novi', 55, 'Maxxwin', 99999, 'Drake', '6967486832', '2610550406'),
('st10434074@upnet.gr', 10434074, 'Papaflessa', 12, 'Patra', 26222, 'Georgios', '6975849305', '2610456632'),
('st10434075@upnet.gr', 10434075, 'Konstantinoupoleos', 32, 'Athens', 16524, 'Eugenios', '6912345678', '2109995555'),
('st10434076@upnet.gr', 10434076, 'karaiskaki', 23, 'patras', 23444, 'lebron', '6972861212', '2214567809'),
('st10434077@upnet.gr', 10434077, 'emp', 69, 'empa', 5432, 'kaae', '6913121312', '2101312000'),
('st10434078@upnet.gr', 10434078, 'Spiti sou', 3, 'Patras', 26441, 'sql', '6912345678', '2610 12345'),
('st10434079@upnet.gr', 10434079, 'Pony Peponi', 69, 'Athens', 15344, 'Lirili Larila', '6909876543', '26810 1234'),
('st10434080@upnet.gr', 10434080, 'mimimimi', 4, 'lalalala', 23861, 'balerinno lololo', '6983615882', '2610729878'),
('st10434081@upnet.gr', 10434081, 'Valaoritou', 1, 'patras', 26225, 'Nikolaos', '6988888888', '2610222222'),
('st10434082@upnet.gr', 10434082, 'Psilalonia', 12, 'Patras', 26225, 'Giorgos', '6933333333', '261000000'),
('st10434083@upnet.gr', 10434083, 'Kanakari', 1, 'Patras', 26225, 'Foivos', '6944444444', '2610777777'),
('st10434084@upnet.gr', 10434084, 'patra', 13, 'patras', 12345, 'makis', '699999999', '261044444'),
('st10434085@upnet.gr', 10434085, 'Raftel', 45, 'Piece', 123, 'Gol', '66666666', '66666666'),
('st10434086@upnet.gr', 10434086, '	NERV Boulevard', 4, '	Tokyo-3', 192, 'Gendo Ikari', '	080123456', '	036666666'),
('st10434087@upnet.gr', 10434087, 'Kilkis', 13, 'patra', 26441, 'Kostaw', '6978215130', '6978215130'),
('st10434088@upnet.gr', 10434088, 'alitheias', 69, 'Igoumenitsa', 24463, 'Theodoros', '6978584575', '26578953'),
('st10434089@upnet.gr', 10434089, 'ksefotou', 36, 'Moon city', 245643, 'Manolis', '698713245', '465352358'),
('st10434090@upnet.gr', 10434090, 'Mpatsenou', 46, 'Sideria', 164542, 'Klavdios', '55464852', '4673596'),
('st10434091@upnet.gr', 10434091, 'giannitson', 47, 'Tripoli', 23100, 'Georgios', '24242424', '23242424'),
('st10434092@upnet.gr', 10434092, 'Ermou', 28, 'Athens', 10551, 'Giorgos', '6945218947', '2105863247'),
('st10434093@upnet.gr', 10434093, 'White House', 911, 'Washington ', 2049, 'Fred', '2024561414', '2024561111'),
('st10434094@upnet.gr', 10434094, 'poseidon', 20, 'patras', 26332, 'andreas', '6949396780', '2610324567'),
('st10434095@upnet.gr', 10434095, 'poseidon', 12, 'patras', 26332, 'George', '6949396731', '2610321456'),
('st10434096@upnet.gr', 10434096, 'Patissia', 69, 'Athens', 26312, 'Apostolos', '6969696969', '2106969420'),
('st10434097@upnet.gr', 10434097, 'Kiprou', 1, 'Patra', 26441, 'Sakis', '6986756734', '2646045768'),
('st10434098@upnet.gr', 10434098, 'Eolidos', 12, 'Athens', 11853, 'Vaggelis', '6978846758', '2103478465'),
('st10434099@upnet.gr', 10434099, 'Hell', 666, 'Los Angeles', 66666, 'God', '6660000006', '2100000666'),
('st10434100@upnet.gr', 10434100, 'Avengers Tower', 1, 'New York', 10110, 'Alexei Shostakov', '6970000008', '2100000888'),
('stu1@upnet.gr', 1097439, 'street', 10, 'Patras', 26558, 'Dim', '6940000000', '2100000000'),
('stu2@upnet.gr', 11000005, 'street', 56, 'patras', 26000, 'jonathan', '6957852446', '2105544889');

-- --------------------------------------------------------

--
-- Table structure for table `student_thesis_relation`
--

CREATE TABLE `student_thesis_relation` (
  `id` int(30) NOT NULL,
  `stu_email` varchar(63) NOT NULL,
  `thesis_id` int(30) NOT NULL,
  `teach1_email` varchar(63) DEFAULT NULL,
  `teach2_email` varchar(63) DEFAULT NULL,
  `status` enum('pending_assignment','active','being_examined','finished','canceled') DEFAULT 'pending_assignment',
  `drivelink` varchar(511) DEFAULT NULL,
  `nemetreslink` varchar(511) DEFAULT NULL,
  `grade_creator` float DEFAULT NULL,
  `grade_exam1` float DEFAULT NULL,
  `grade_exam2` float DEFAULT NULL,
  `grade1` float DEFAULT 0,
  `grade2` float DEFAULT 0,
  `grade3` float DEFAULT 0,
  `pending_assignment_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `activated_datetime` datetime DEFAULT NULL,
  `decided_examination_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_thesis_relation`
--

INSERT INTO `student_thesis_relation` (`id`, `stu_email`, `thesis_id`, `teach1_email`, `teach2_email`, `status`, `drivelink`, `nemetreslink`, `grade_creator`, `grade_exam1`, `grade_exam2`, `grade1`, `grade2`, `grade3`, `pending_assignment_datetime`, `activated_datetime`, `decided_examination_datetime`) VALUES
(2, 'stu1@upnet.gr', 15, 'teach1@upnet.gr', 'teach4@upnet.gr', 'finished', NULL, 'https://nemertes.library.upatras.gr', 15, 18, 19, 0, 0, 0, '2025-09-12 01:29:11', '2025-09-12 05:20:53', NULL),
(3, 'stu2@upnet.gr', 16, 'teach1@upnet.gr', 'teach2@webmail.gr', 'canceled', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2025-09-12 05:47:08', '2025-09-12 05:48:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `email` varchar(63) NOT NULL,
  `topic` text NOT NULL,
  `landline` varchar(63) NOT NULL,
  `mobile` varchar(63) NOT NULL,
  `department` text NOT NULL,
  `university` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`email`, `topic`, `landline`, `mobile`, `department`, `university`) VALUES
('abcdef@example.com', 'AI', '2610121212', '6912121212', 'department', ''),
('abcdefg@example.com', 'topic', 'land', 'mob', 'dep', ''),
('akomninos@ceid.upatras.gr', 'Network-centric systems', '2610996915', '6977998877', 'CEID', ''),
('anittamaxwynn@cashmoney.com', 'Probability', '2610486396', '698888884', 'Computer Engineering', ''),
('apan@upatras.gr', 'Data', '2645023475', '6987863645', 'CEID', ''),
('billieeilish@upatras.gr', 'Sound Engineering', '2100000011', '6930000011', 'CEID', ''),
('capucapu@ccino.assassino', 'no', '9', '6', 'Brainrot', ''),
('eleni@ceid.gr', 'WEB', '34', '245', 'CEID', ''),
('elonmusk@gmail.com', 'Electric Vehicles', '1-888-518-3752', 'Null', 'Department of Physics', ''),
('eustratiospap@gmail.com', 'Physics', '210-1234567', '690-1234567', 'Physics', ''),
('exxample@example.com', 'top', 'la', 'mo', 'de', ''),
('fatbanker@kapitalas.gr', 'kippah', '6942014121', '6969784205', 'Froutemporiki', ''),
('GBar@gmail.com', 'Basketball Strategy', '2108743265', '6932178542', 'SEF', ''),
('Gbonassera@gmail.com', 'spagetti aldente', '23131131', '6575754', 'cuccina italiana', ''),
('georgeNofragka@utsipis.gr', 'oikonomia tou tsipi', '2610546132', '697878787', 'Real Economics ', ''),
('girokomeio@upatras.gr', 'Management', '2100000444', '6930000088', 'CEID', ''),
('goat@messi.cr', 'no', '666', '666', 'No', ''),
('goatmanager@thrylos.gr', 'Sentres', '2105555555', '6922222222', 'Conference League', ''),
('hozier@ceid.upatras.gr', 'Artificial Intelligence', '2610170390', '6917031990', 'CEID', ''),
('ihatepotter@hocusmail.com', 'math 2', '26210 26441', '6926626226', 'ceid', ''),
('info@hamzat.gr', 'Logistics', '1245789513', '1456983270', 'Social Rehabitation', ''),
('jimnik@gmail.com', 'Artificial Intelligence', '2610-9876543', '697-9876543', 'Computer Science', ''),
('johnusins@upatras.gr', 'Ypsiloikardiakoipalmoi', '2610645698', '697878787', 'Palindromikis kiniseos', ''),
('karikhs@yahoo.gr', 'Pharmaceutical Drugs', '69', '6945258923', 'Chemistry', ''),
('karras@nterti.com', 'Artificial Intelligence', '23', '545', 'CEID', ''),
('kostkaranik@gmail.com', 'informatics', '2610324242', '6934539920', 'CEID', ''),
('liampayne@ceid.upatras.gr', 'Cryptography', '2462311345', '6980847234', 'CEID', ''),
('makavelibet@gmail.com', 'Business', '2310231023', '6929349285', 'Economics', ''),
('mari-bro@beast.com', 'Life', '666', '666', 'no', ''),
('mariakon@gmail.com', 'Statistics and Probability', '2310-7654321', '694-7654321', 'Mathematics', ''),
('masterassassin@upatras.ceid.gr', 'assassinations', 'null', 'null', 'Monterigioni', ''),
('mavros@bbs.af', 'Nikolakos', '987546123', '69 6 9 69', 'Ougantiani Filosofia', ''),
('meniT@upatras.gr', 't', '2610333999', '6999990999', 'CEID', ''),
('michaelpap@gmail.com', 'Renewable Energy Systems', '2610-4455667', '697-4455667', 'Electrical Engineering', ''),
('mpampis123@gmail.com', 'Arxeologia', '2610945934', '6947845334', 'Arxeologias', ''),
('nikos.korobos12@gmail.com', 'Data Engineering', '2610324365', '6978530352', 'IT', ''),
('palam@upatras.gr', 'SQL injections', '1234567890', '6988223322', 'Engineering', ''),
('panari@upatras.gr', 'PLA', '2657481902', '6974568973', 'CEID', ''),
('papas2@yahoo.gr', 'manas', 'spiti', '69854512', 'Hastle', ''),
('paraskevas@kobres.ath', 'Provata', '2298042035', '6969696969', 'Ktinotrofia', ''),
('patric@xrusopsaros.com', 'thalasioi ipopotamoi', '2610567917', '6952852742', 'Solomos', ''),
('pdanezis@upatras.gr', 'Telecommunication Electronics', '2610908888', '6971142424', 'ECE', ''),
('prasinosfrouros@gmail.com', 'alafouzo poula', '261056458', '698778788', 'Panathinaiki agwgh', ''),
('snikolaou@upatras.gr', 'Information Theory', '2106723456', '6942323452', 'ECE', ''),
('sophiamich@gmail.com', 'Economic Theory', '2310-5432109', '698-5432109', 'Economics', ''),
('spana@hotmail.com', 'Bet Predictions', '1235654899', '2310521010', 'opap', ''),
('teach1@upnet.gr', 'Programming', '2260000000', '6930000000', 'CEID', 'Patras'),
('teach2@webmail.gr', 'Topic', '2260000001', '6930000001', 'CEID', 'Patras'),
('teach3@upnet.gr', 'topic', '2262244555', '6934444555', 'CEID', 'Patras'),
('teach4@upnet.gr', 'Topic', '2104466778', '6948899542', 'CEID', 'Patras'),
('toxrusoftiari@funerals.gr', 'Nekro8aftiki', '78696910', '69696964', 'Nekro8aftikis', ''),
('tsilis@tsilliuniversity.gr', 'Iliopoulos to fainomeno', '2610212121', '6921212121', 'Tsili Kafeneio', ''),
('tungtungtung@itbr.com', 'Graphs', '210 1425735', '69434619363', 'CEID', ''),
('tzouli.ax@upatras.gr', 'Big Data', '2264587412', '6996116921', 'CEID', ''),
('up1084561@ac.upatras.gr', 'Computer science', '2610123456', '6912345678', 'CEID', ''),
('up1234567@ac.upatras.gr', 'Physics', '2610111111', '6911111111', 'CEID', ''),
('vasfou@ceid.upatras.gr', 'Integrated Systems', '2610885511', '6988812345', 'CEID', ''),
('zaynmalik@gmail.com', 'Oriented programing', '2310221234', '6971006355', 'CEID', '');

-- --------------------------------------------------------

--
-- Table structure for table `thesis`
--

CREATE TABLE `thesis` (
  `id` int(30) NOT NULL,
  `teacher` varchar(63) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thesis`
--

INSERT INTO `thesis` (`id`, `teacher`, `title`, `description`) VALUES
(13, 'teach1@upnet.gr', 'teacher 1 thesis 1 title', 'teacher 1 thesis 1 desc'),
(14, 'teach1@upnet.gr', 'teacher 1 thesis 2 title edited', 'teacher 1 thesis 2 desc edited'),
(15, 'teach2@webmail.gr', 'teach 2 thesis 1', 'teach 2 thesis 1 desc'),
(16, 'teach3@upnet.gr', 'teacher 3 thesis 1 title', 'teacher 3 thesis 1 desc');

-- --------------------------------------------------------

--
-- Table structure for table `thesis_notes`
--

CREATE TABLE `thesis_notes` (
  `note_id` int(30) NOT NULL,
  `thesis_id` int(30) NOT NULL,
  `teacher` varchar(63) NOT NULL,
  `note_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thesis_notes`
--

INSERT INTO `thesis_notes` (`note_id`, `thesis_id`, `teacher`, `note_text`) VALUES
(1, 15, 'teach2@webmail.gr', 'teacher 2 note on teacher 2 thesis 1'),
(2, 15, 'teach2@webmail.gr', 'teacher 2 second note on teacher 2 thesis 1'),
(3, 15, 'teach4@upnet.gr', 'teacher 3 note on teacher 2 thesis 1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(30) NOT NULL,
  `email` varchar(63) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `surname` varchar(63) DEFAULT NULL,
  `type` enum('student','teacher','secretary') DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `name`, `surname`, `type`, `reg_date`) VALUES
(8, '104333999@students.upatras.gr', '$2y$10$IS8923w1LuoExpY5otSCmeaVE.q4OwVDF7wxmf819bRTtbUnQYXW.', 'Makis', 'Makopoulos', 'student', '2025-09-12 05:58:13'),
(134, 'abcdef@example.com', '$2y$10$EEygR7znip5TnDTvrZ4t6.K0MDfozgmMYm679qbakOK5cznx5AKCe', 'Kostas', 'Kalantas', 'teacher', '2025-09-12 05:58:18'),
(135, 'abcdefg@example.com', '$2y$10$QmeIUpyCHgPbGtADSLhNnOPPjljIGBQRtQO2ZmKUwSTR0uiggrgJW', 'Giorgis', 'Fousekis', 'teacher', '2025-09-12 05:58:18'),
(110, 'akomninos@ceid.upatras.gr', '$2y$10$TKdzhoAk0VJXUzTtqRXCZuD3iVq4kV/DFMEnrFYOXFyzgrjfpy3Me', 'Andreas', 'Komninos', 'teacher', '2025-09-12 05:58:17'),
(141, 'anittamaxwynn@cashmoney.com', '$2y$10$JNlY2cpD.isMJ4skhhPOf.cz7l1azBoupTJJ4aGRBokyHZekaQNVS', 'Anitta', 'Wynn', 'teacher', '2025-09-12 05:58:18'),
(160, 'apan@upatras.gr', '$2y$10$XMOFR8BbvbHe5/y9f5ku/ugw96Zq0HwDdouXwMJavQ9jKrmQpJkcS', 'Aristeidis', 'Panopoulos', 'teacher', '2025-09-12 05:58:19'),
(162, 'billieeilish@upatras.gr', '$2y$10$N/0PP9L7Ql0Oq/1v71itB.J.9oUtCYqynbVFk9YP22yTL5PqhYN1a', 'Billie ', 'Eilish', 'teacher', '2025-09-12 05:58:19'),
(153, 'capucapu@ccino.assassino', '$2y$10$iavCbyZAGb0yafkwcJjJu.easJRimBir1rDSCfrbVxkWT5Bc24lSO', 'Brain', 'Rot', 'teacher', '2025-09-12 05:58:19'),
(113, 'eleni@ceid.gr', '$2y$10$/X3t0pcTsItv1JzwO9siLe89vRFRefQ1B7KsoEhmMIR48sBoNrl7m', 'Eleni', 'Voyiatzaki', 'teacher', '2025-09-12 05:58:17'),
(133, 'elonmusk@gmail.com', '$2y$10$SK5NoCUgEj3SsTQzkGA1RuUXY2S/1PzhpFfBYSpHhn5oidbqDwwmi', 'Elon', 'Musk', 'teacher', '2025-09-12 05:58:18'),
(128, 'eustratiospap@gmail.com', '$2y$10$N/1IZOlUdSVzxoKY0AoYD.wW4f0f3ymv7H6OVSNITTw/cxrBT7Dei', 'Papadopoulos ', 'Eustathios', 'teacher', '2025-09-12 05:58:18'),
(136, 'exxample@example.com', '$2y$10$nmtGFPuJ5Tk216uye9xljel485OmHwcl3eCmBlSbV2cziOMCqJYh.', 'Nikos', 'Koukos', 'teacher', '2025-09-12 05:58:18'),
(124, 'fatbanker@kapitalas.gr', '$2y$10$9jPQ3iFwgUqPoxehrMD7EetlEfqo7lPtD8fKiyxmeeAWyMkiFIJuq', 'Fat ', 'Banker', 'teacher', '2025-09-12 05:58:18'),
(159, 'GBar@gmail.com', '$2y$10$1edvSZqCEI72UE7wAnZST.Y8S1SJxr1Y4U/d.IkqfPbQ9Y5vwzpvy', 'Giorgos', 'Bartzokas', 'teacher', '2025-09-12 05:58:19'),
(158, 'Gbonassera@gmail.com', '$2y$10$YC1gFTQEKncWxR9Gvfm4K.Wr33rIWoXKIJeGKB3ShXvDVxnipkcZ2', 'Giorgio ', 'Bonassera', 'teacher', '2025-09-12 05:58:19'),
(155, 'georgeNofragka@utsipis.gr', '$2y$10$pK/rk1FpIjk9mfnxPF3oPe2OZ35cxtT3fpHUIg6iSSIUYoaqe.dXC', 'Giorgos', 'Fragkofonias', 'teacher', '2025-09-12 05:58:19'),
(163, 'girokomeio@upatras.gr', '$2y$10$pSZuk/OHynHg2QH2/eM6U.5ojanMH9zmDikyaQDRXKI5FnUzoLAvS', 'Hlias', 'Psinakis', 'teacher', '2025-09-12 05:58:19'),
(152, 'goat@messi.cr', '$2y$10$qK65SNm3Il7c3WIf/hiT1ekYHTPjdbT81nJYR2YJkEXsl9jZMuPjm', '<a href=\"https://www.youtube.com\">G</a>', 'Goat', 'teacher', '2025-09-12 05:58:19'),
(142, 'goatmanager@thrylos.gr', '$2y$10$9LKuxTZBPUKzSUKGcWZQXO.em2oHvKf/ZOlhCPOrJsXn2Y/6Gi6wa', 'Jose Luis', 'Mendilibar', 'teacher', '2025-09-12 05:58:18'),
(114, 'hozier@ceid.upatras.gr', '$2y$10$.uzr83mQk9uypdrJlUEmsODxWVPIP.s6dYDMCPRhn7ljaO.JjRAIW', 'Andrew', 'Hozier Byrne', 'teacher', '2025-09-12 05:58:17'),
(147, 'ihatepotter@hocusmail.com', '$2y$10$7xa10o9TvxUNIvcZGfdGE.yd4mXkF0GFp/01xa2zefGVIcZg2F96y', 'Severus', 'Snape', 'teacher', '2025-09-12 05:58:19'),
(125, 'info@hamzat.gr', '$2y$10$HFVzsQM/7OGEagaW/fVe1.8ounyZx/vbuo7ohRyGloQkkRo7RiS5u', 'Hamze', 'Mohamed', 'teacher', '2025-09-12 05:58:18'),
(130, 'jimnik@gmail.com', '$2y$10$vHr3MmJb335tVr0Sf8Hyle.tUb8QWhOPuLS8nHjkP/yL2ltYFtT0i', 'Jim', 'Nikolaou', 'teacher', '2025-09-12 05:58:18'),
(154, 'johnusins@upatras.gr', '$2y$10$AF3XcZiRbl41YMzwjFPiTe5uxHpA.TVZUuym9E7/PJF/nN4RlQBrS', 'Giannis ', 'Sinsidis', 'teacher', '2025-09-12 05:58:19'),
(122, 'karikhs@yahoo.gr', '$2y$10$Pmdx/xosFVc3gBMIwXAiiOIpxg847VZtCz4sTNMS7gLVud/6CLnsC', 'Karikhs', 'Raftel', 'teacher', '2025-09-12 05:58:17'),
(112, 'karras@nterti.com', '$2y$10$YpIzaifAD0Gw/gSh/FmfheHUol2RKiYG.6syEGByi/eJRRUcYBqJu', 'Basilis', 'Karras', 'teacher', '2025-09-12 05:58:17'),
(116, 'kostkaranik@gmail.com', '$2y$10$biGNweZ.4FHgCBABLw7GVe9crRORDuyfSgQ.U/jv2ZpbbMkWJgmpq', 'Kostas', 'Karanikolos', 'teacher', '2025-09-12 05:58:17'),
(143, 'liampayne@ceid.upatras.gr', '$2y$10$qf.ncJ7ivBFHL8P8PXJXLugIne7QmFEt0pmn8PAlqe1J6rh9PucAC', 'Liam', 'Payne', 'teacher', '2025-09-12 05:58:18'),
(118, 'makavelibet@gmail.com', '$2y$10$WVb7Uz5phbr7padjoNIZPuLX/cND4Rip.65GvMiZyYvhM9ZA8pNZ6', 'Daskalos', 'Makaveli', 'teacher', '2025-09-12 05:58:17'),
(151, 'mari-bro@beast.com', '$2y$10$94M9EzhbbwbncBXCcABqTu3pvp9M81yYZ50Q/iBW.Q0kryNW6VKyi', 'MARI', 'BRO', 'teacher', '2025-09-12 05:58:19'),
(129, 'mariakon@gmail.com', '$2y$10$BLWmIsJSVpqsKSPe39NunezpvFTLPW38sNxWbGEQOyagXYAi0v4bS', 'Konstantinou', 'Maria', 'teacher', '2025-09-12 05:58:18'),
(139, 'masterassassin@upatras.ceid.gr', '$2y$10$0wNvSrZb8IpUfV.HhEOZMus3yFZ18tJw6J5anE51XSYwO4LPh0AVm', 'Ezio', 'Auditore da Firenze', 'teacher', '2025-09-12 05:58:18'),
(146, 'mavros@bbs.af', '$2y$10$SjO29KOv4788QTY3P.pP3us6ywu/lHTTwZCEGj/m2Vwm6pT3MiKdi', 'Oikoumenikos', 'Prasinos', 'teacher', '2025-09-12 05:58:18'),
(120, 'meniT@upatras.gr', '$2y$10$trJfzg36cCKmePeQUj/IP.cpHrFbwmkBU0CMdrYpZt1M3UNkiXehW', 'Meni', 'Talaiporimeni', 'teacher', '2025-09-12 05:58:17'),
(132, 'michaelpap@gmail.com', '$2y$10$KsD9XDm6dBjyO5g3Npm8bOrjyBfwSil5UWDNj/g8DcOM9Lslu7L8e', 'Michael ', 'Papadreou', 'teacher', '2025-09-12 05:58:18'),
(117, 'mpampis123@gmail.com', '$2y$10$Luj8HNV5RPs.DApcLbweoeZS4x36uU3ooBHgherWoBcloDxpes/ZS', 'Mpampis', 'Sougias', 'teacher', '2025-09-12 05:58:17'),
(115, 'nikos.korobos12@gmail.com', '$2y$10$/vaPcsWfeP5GxCyoDku9Le22w2B12NS2kAxa9ZlYz7QYePCYTClsW', 'Nikos', 'Korobos', 'teacher', '2025-09-12 05:58:17'),
(119, 'palam@upatras.gr', '$2y$10$F30UWhAo6y0Ye9xOb86zSe37PLnfT5ThwzzFyFXNP8VewkFr/TQ7K', 'Maria', 'Palami', 'teacher', '2025-09-12 05:58:17'),
(161, 'panari@upatras.gr', '$2y$10$o62KilpkkJDtIBJmYTZqv.BrT9vJUad/1kuT/.rlbEOC.9NcGdzlm', 'Panagiotis', 'Aristopoulos', 'teacher', '2025-09-12 05:58:19'),
(145, 'papas2@yahoo.gr', '$2y$10$ZEp95TH3xLboN3fslhPfMe93vjiW5KSAdt23s0XCT6h/eiUXCbWx2', 'Nikos ', 'Papas', 'teacher', '2025-09-12 05:58:18'),
(138, 'paraskevas@kobres.ath', '$2y$10$YaTIj8L4sWWNUCr8Wva2Cu74uOb.7DVwLVDDSwMhCpK3Tm3OaFaJu', 'Paraskevas', 'koutsikos', 'teacher', '2025-09-12 05:58:18'),
(137, 'patric@xrusopsaros.com', '$2y$10$VmELYmsbswV3Q1jasiA6/OY3EdmrQmrVO9SIxNLiWc3.FS1tcIneC', 'patrick', 'xrusopsaros', 'teacher', '2025-09-12 05:58:18'),
(127, 'pdanezis@upatras.gr', '$2y$10$K1euySQDSPYhBLczIhewTuTcKyT.IDpzu12tKau4JGI0/BC3g8ctu', 'Petros', 'Danezis', 'teacher', '2025-09-12 05:58:18'),
(157, 'prasinosfrouros@gmail.com', '$2y$10$GuIf0msH4oG7iJg4aRkhB.CSAQb.BuMKhjVIlxHPnB2AtOXaOMY32', 'Prasinos ', 'Frouros', 'teacher', '2025-09-12 05:58:19'),
(2, 'sec1@webmail.gr', '$2y$10$7akrNEriyVRJi2QKaG2pW.O0gLPJGv4X7Cz3yAazjwNpwQYpsce/2', 'sec1', 'sursec1', 'secretary', '2025-09-11 22:29:09'),
(126, 'snikolaou@upatras.gr', '$2y$10$Fd026XGkwtTEWc7iOBObhu1D/fTQzOb6Yaa9KzHI7jSF5gVCR00eG', 'Stefania', 'Nikolaou', 'teacher', '2025-09-12 05:58:18'),
(131, 'sophiamich@gmail.com', '$2y$10$TiVTPNK2xDC8YNAyG8N4NeCFw7nwO2fo3zpfVIyhhUG6Zp.O8lexa', 'Sophia', 'Michailidi', 'teacher', '2025-09-12 05:58:18'),
(140, 'spana@hotmail.com', '$2y$10$ndARK7e7QoZY71Ms6PoN4OkIqrlG0yByQlrnhvwdPlxFSFowHQrey', 'Sotiris', 'Panaikas', 'teacher', '2025-09-12 05:58:18'),
(9, 'st10434000@upnet.gr', '$2y$10$KNLAnL5QMx7f5ZDu1kVebOkxNByW1dy28.CRAwcRzmZyFAUsjSTTe', 'John', 'Lennon', 'student', '2025-09-12 05:58:13'),
(10, 'st10434001@upnet.gr', '$2y$10$vHL6pEtXcIsTWXfrWJMDWuRjCjQ0MExfJ12Pp9gMXfHDiFTKtCX5G', 'Petros', 'Verikokos', 'student', '2025-09-12 05:58:13'),
(11, 'st10434002@upnet.gr', '$2y$10$k1h4/HjAg/5JOCNzw4nTKuvZPXBqA/NRzhpW.Q6d2VmF/z60uod4.', 'test', 'name', 'student', '2025-09-12 05:58:13'),
(12, 'st10434003@upnet.gr', '$2y$10$hkPMynwIpc5wnoax2DovE.epJqLO6ir36E3CVM1PWUZgUcuf/CM5y', 'Robert', 'Smith', 'student', '2025-09-12 05:58:13'),
(13, 'st10434004@upnet.gr', '$2y$10$QAkTI.W3LxPGj7Nfs.2L1OTDKDwstVnSMCzGLQgyJ5j826ufRS89G', 'Rex', 'Tyrannosaurus', 'student', '2025-09-12 05:58:13'),
(14, 'st10434005@upnet.gr', '$2y$10$O8YieNJ5LQ7dusZIg.Mvx.GcNAf9y7EIhqRbqnkxnij8uLLGjsno6', 'Paul', 'Mescal ', 'student', '2025-09-12 05:58:13'),
(15, 'st10434006@upnet.gr', '$2y$10$JN/L7kl.QdcrE0yXM2X26eVr2Amchi1ADXueumlpjTPU0yyakCCku', 'Pedro', 'Pascal', 'student', '2025-09-12 05:58:13'),
(16, 'st10434007@upnet.gr', '$2y$10$5QHx5Nvj1UvUuJvgnU17BOp/LSEbV5qSm.9aQUxfVk0Gs6QZ2OVUy', 'David', 'Gilmour', 'student', '2025-09-12 05:58:13'),
(17, 'st10434008@upnet.gr', '$2y$10$KvZEvbVVkFL.Zfnv3MzD4.oiePN8F.yORy0X5VNKFLJ0dlfn1f1S2', 'Lana', 'Del Rey ', 'student', '2025-09-12 05:58:13'),
(18, 'st10434009@upnet.gr', '$2y$10$2i5HM6obKnlZCrfqRVddl.uUI70cGsyKWdL3VHDW4NHRcNIzLkpd.', 'Stevie', 'Nicks', 'student', '2025-09-12 05:58:13'),
(19, 'st10434010@upnet.gr', '$2y$10$BEhXkx.9PFzpNqEjms.xGeKw0rM5QU3WoRSs3bXIJ5NpPam9zoIm.', 'Margaret', 'Qualley', 'student', '2025-09-12 05:58:13'),
(20, 'st10434011@upnet.gr', '$2y$10$uUdyMXxsJx/m6lvBXA1MOeTBoyvJ3nkHiJFmPEm.HrH56r1isC/dC', 'Mia', 'Goth', 'student', '2025-09-12 05:58:13'),
(21, 'st10434012@upnet.gr', '$2y$10$1tDoxfmOvps/r0NHqczK..o1QQjDnYs0r8A17YmI6fP178DTZKwLK', 'Florence ', 'Pugh', 'student', '2025-09-12 05:58:13'),
(22, 'st10434013@upnet.gr', '$2y$10$fL2g3URng/czY0/t9ThW9u2CRqiKqbA5b7MC/8Ma0rwMnC6IJwKHS', 'PJ ', 'Harvey', 'student', '2025-09-12 05:58:13'),
(23, 'st10434014@upnet.gr', '$2y$10$QCy3WcDdBojlC8uXlIMEi.V85AP.y/HmscrLm/akFE4Gw/akJLcxu', 'Penélope', 'Cruz', 'student', '2025-09-12 05:58:13'),
(24, 'st10434015@upnet.gr', '$2y$10$fMObRyNzgl8xjvaDma2VDeaUdKV2UnXRcp3AlYtfW35DfYLzCiseK', 'Emma', 'Stone', 'student', '2025-09-12 05:58:13'),
(25, 'st10434016@upnet.gr', '$2y$10$30kpja3VJLjl/2NI8ehqDu5aoJdmidbS9ENt5zsA6MSumVrBHJF1.', 'Jenny', 'Vanou', 'student', '2025-09-12 05:58:13'),
(26, 'st10434017@upnet.gr', '$2y$10$mhO0k4zR7yWgkIRtLG/U1.I69Aag.PtuTTmuo6BoTh/cdtyIpq9FG', 'Salma ', 'Hayek', 'student', '2025-09-12 05:58:13'),
(27, 'st10434018@upnet.gr', '$2y$10$QnVEq/yC/G9xszkMa5Gdkeo97wk67Exs9Ooq12u1oWBuuHpNK41ia', 'Julie ', 'Delpy', 'student', '2025-09-12 05:58:13'),
(28, 'st10434019@upnet.gr', '$2y$10$VXQsx4snKhmftKw9wOhx/e4zLmVv8zQtuwHdV6USZGIPGQwqsL3cm', 'Giannis', 'Aggelakas', 'student', '2025-09-12 05:58:13'),
(29, 'st10434020@upnet.gr', '$2y$10$hks7Q3MSyuaJJ3Be37xN9.KSz7/rBJkQiytfarfpKLlt6nMoeLUXK', 'Eleutheria ', 'Arvanitaki', 'student', '2025-09-12 05:58:14'),
(30, 'st10434021@upnet.gr', '$2y$10$ohwTYWO77mFRyo3oJkSYyejoP5mMrS8E1Ct.1C4xoj2aDaAbsi2He', 'Marina', 'Spanou', 'student', '2025-09-12 05:58:14'),
(31, 'st10434022@upnet.gr', '$2y$10$1M1DLi1TLrZZEGpMEgn8KeP/wa93.ZDezoSb.v.LnM0IwBtZ0Ee3W', 'Rena', 'Koumioti', 'student', '2025-09-12 05:58:14'),
(32, 'st10434023@upnet.gr', '$2y$10$XUNlFpFou9Z0hGyGHtRdyO2iNevE2kliP8GCuHAxOkXwmAax7UgdK', 'Charlotte', 'Aitchison', 'student', '2025-09-12 05:58:14'),
(33, 'st10434024@upnet.gr', '$2y$10$dipMfwEm01xHJB8tflLGPONWF1VuGTE495WUjGWs1BDqLt6qcVDl2', 'Rhaenyra', 'Targaryen', 'student', '2025-09-12 05:58:14'),
(34, 'st10434025@upnet.gr', '$2y$10$.OuhZHRW9BC7HefAHK/KgOmC9GKRkFPU3DlNphiSXIwRtVgwByTYW', 'Ben', 'Dover', 'student', '2025-09-12 05:58:14'),
(35, 'st10434026@upnet.gr', '$2y$10$N8GslBB7Y5NUrPhCiWW8RuEIt7oauZcCJrP/Nvpb.xRTSbabtV.Yu', 'Marios', 'Papadakis', 'student', '2025-09-12 05:58:14'),
(36, 'st10434027@upnet.gr', '$2y$10$xyoq784E9kNAE/B88nBMX.xNE0rQi5yeBMx2MLtVxQK3yWCVTAg1e', 'Nicholas ', 'Hoult', 'student', '2025-09-12 05:58:14'),
(37, 'st10434028@upnet.gr', '$2y$10$IclFAhdYsC1S8k9qKOdsXOfgWbDh8iuxXDXpJ63gsnnMLCT/DtsE.', 'Joo Hyuk', 'Nam', 'student', '2025-09-12 05:58:14'),
(38, 'st10434029@upnet.gr', '$2y$10$irbOP5RRn4IIUG4y54hWlOXhFGRznl.WXxU5r9CW5fo1pqBkt5Dxe', 'Nikos', 'Peletie', 'student', '2025-09-12 05:58:14'),
(39, 'st10434030@upnet.gr', '$2y$10$BqssQT19uqGjTh5cE9fDh.zGPXJshCFo0CnKY6I8QgVXqQEKW4GWK', 'Nikos', 'Koukos', 'student', '2025-09-12 05:58:14'),
(40, 'st10434031@upnet.gr', '$2y$10$JoSWZcH0y5OGaPcSg3T53.d.YXWUYPPyn5JpbHBsdVH6MeGcJRGcm', 'Maria', 'Fouseki', 'student', '2025-09-12 05:58:14'),
(41, 'st10434032@upnet.gr', '$2y$10$aJNNv7VRe50kM0EKAJCg1OwfXF30FAlvCnNj8ijYL3eUXzLbryyxm', 'Nikos ', 'Korobos', 'student', '2025-09-12 05:58:14'),
(42, 'st10434033@upnet.gr', '$2y$10$X2C02UJQKKVBbgvERJBuSOXX1bBUHaKuSweFReMousBYToU7IvirC', 'Maria', 'Togia', 'student', '2025-09-12 05:58:14'),
(43, 'st10434034@upnet.gr', '$2y$10$ZO1ByBktffI5Qcd6t9pSn.u3.iGrjGWKBTA.58C1gNyNKyVmqtUwu', 'Giorgos', 'Menegakis', 'student', '2025-09-12 05:58:14'),
(44, 'st10434035@upnet.gr', '$2y$10$vzCCLnPvIcImvTGG3iBf5.qs/Xzdkq33yzErq3WIG3bU613yGVBHu', 'Trakis', 'Giannakopoulos', 'student', '2025-09-12 05:58:14'),
(45, 'st10434036@upnet.gr', '$2y$10$dEMJJTlIFokpaoq72mhUX.xVA1MBg3QiFXQvC6.3zth3ZqSY6UWsG', 'Chris', 'Kouvadis', 'student', '2025-09-12 05:58:14'),
(46, 'st10434037@upnet.gr', '$2y$10$FfekbyimcO0gvTbfbp.6lOJrlwq/XWTgFaLijZYkIxcMNvIfhfkkO', 'pafloutsou', 'kaskarai', 'student', '2025-09-12 05:58:14'),
(47, 'st10434038@upnet.gr', '$2y$10$NiE6tDyTE739U/tX2usDOee3zQO6drc75cV/5CxSFivkIiDCGrqOS', 'Billy', 'Diesel', 'student', '2025-09-12 05:58:14'),
(48, 'st10434039@upnet.gr', '$2y$10$TkOcH7rJR6xiS1Dzv57m8O6uqy4Wxit6fMX6bKcCg0ZLmvmLvdtve', 'Tome', 'of Madness', 'student', '2025-09-12 05:58:14'),
(49, 'st10434040@upnet.gr', '$2y$10$hKyWWL2MOiiyudfVkZbcNu4YXkphGjeykIt0buoyELMECTj6jZFX6', 'fort', 'nite', 'student', '2025-09-12 05:58:14'),
(50, 'st10434041@upnet.gr', '$2y$10$LGbjhKvXcg8byPTGTz3yO.l0PgZ7OR4Gztx0Lol7EtEMZaKFRCKz6', 'Zeus', 'Ikosaleptos', 'student', '2025-09-12 05:58:14'),
(51, 'st10434042@upnet.gr', '$2y$10$15t4Ks2Bs5fIyGmGLxZvxul0vzjMEQ8oCabSc5AzFxjg03gBz/B4e', 'AG', 'Cook', 'student', '2025-09-12 05:58:14'),
(52, 'st10434043@upnet.gr', '$2y$10$R0iAEkP0d5/z762uAmTWeuhhS8EVW8iofSz.dLDFXTbGuUUlD0Y2G', 'Maria', 'Mahmood', 'student', '2025-09-12 05:58:15'),
(53, 'st10434044@upnet.gr', '$2y$10$.SGAW4mfJgpal9FpHqSiwetbFT9fJ89kjyrMsPlCM5MVnbIJ0ndai', 'Kostas', 'Poupis', 'student', '2025-09-12 05:58:15'),
(54, 'st10434045@upnet.gr', '$2y$10$G4zfy6LZFtMj54AqqEV3eOQu7YSCjh4J55Nrv/gaXp9uCWq7obt3S', 'Hugh', 'Jass', 'student', '2025-09-12 05:58:15'),
(55, 'st10434046@upnet.gr', '$2y$10$TGtoN6Dg092YzWiiFZP/BOX8sastXvx3F/sU/iC77DlMPesKMIko.', 'Xontro ', 'Pigouinaki', 'student', '2025-09-12 05:58:15'),
(56, 'st10434047@upnet.gr', '$2y$10$MPtiZY5itFiKNgZuvYVhu.km2vjEj/1iXciJ8gfkIo70BB/GT/tLa', 'Μaria', 'Nikolaou', 'student', '2025-09-12 05:58:15'),
(57, 'st10434048@upnet.gr', '$2y$10$d7LBuU8cAOdwofFaYpHXbODXMROGFoCSei6b6iMcmQLML342wWdDS', 'Eleni', 'Fotiou', 'student', '2025-09-12 05:58:15'),
(58, 'st10434049@upnet.gr', '$2y$10$lA3jMj5U7nkdyMM8F4FSvuT7rzEqnzSeKH2SmX/2KJ5RLgqxAOx8y', 'Xara', 'Fanouriou', 'student', '2025-09-12 05:58:15'),
(59, 'st10434050@upnet.gr', '$2y$10$vyRjGVB6BWVDOJ/AHlMkE.o8bRHA.VPvs/6sm3a/za5HMJhnSiTj6', 'Nikos', 'Panagiotou', 'student', '2025-09-12 05:58:15'),
(60, 'st10434051@upnet.gr', '$2y$10$wi9mF3AWzx/VcYVqTC7g0.AAW4UBeDlIIMkKhCIU8sSz9Exjg51.O', 'Petros', 'Daidalos', 'student', '2025-09-12 05:58:15'),
(61, 'st10434052@upnet.gr', '$2y$10$hI9oAxzKf6KF5Yur6XACSeLwQjkkQv9pqefwndZ50WbVTEbgkYdae', 'Giannis', 'Ioannou', 'student', '2025-09-12 05:58:15'),
(62, 'st10434053@upnet.gr', '$2y$10$oL0QnxYUrLHdRqX4UPl3K.Q/ENVrNfQe12VtnvaoHucMmif1qmFly', 'Tsili', 'Doghouse', 'student', '2025-09-12 05:58:15'),
(63, 'st10434054@upnet.gr', '$2y$10$f9qyFJjxEbm7LXiD3SI7kOV/JSIyrNJ2vPJwGFCDqKEPrJB6Wf4Fa', 'Marialena', 'Antoniou', 'student', '2025-09-12 05:58:15'),
(64, 'st10434055@upnet.gr', '$2y$10$VmgjkEpXFsmZvDuwtyQ4veWccbfG1ZXjyTnqy1LS0vGnww2rxX6Ru', 'Ioannis', 'Panagiotou', 'student', '2025-09-12 05:58:15'),
(65, 'st10434056@upnet.gr', '$2y$10$cfj1w/QZeCMS2ZM25n7Bj.lzvph4ksqNGByR6e3AgwrfPLjEk5.Q2', 'George', 'Karamalis', 'student', '2025-09-12 05:58:15'),
(66, 'st10434057@upnet.gr', '$2y$10$Nj.IKFDg4gcmqZO3xer/KukaRaDrFQsCJn/mf2Rn6ANoPXJd4kara', 'Kyriakos', 'Papapetrou', 'student', '2025-09-12 05:58:15'),
(67, 'st10434058@upnet.gr', '$2y$10$UFvzoHFWikrqSk6AJRYiquftn.QVRb68/U7oYsJV7NFWPLs2LVfGe', 'Maria', 'Kp', 'student', '2025-09-12 05:58:15'),
(68, 'st10434059@upnet.gr', '$2y$10$EC7KH4EMXIHWVAxDh8lZiuDGiX98B4I3mv.R4qGcrDYaLWzolYUlm', 'Nikos', 'papadopoulos', 'student', '2025-09-12 05:58:15'),
(69, 'st10434060@upnet.gr', '$2y$10$5YRMpJQoJNvYgPjRYsCM7.GlRXQl3ZVT0ij2HBxQio.jwyVSCQJPK', 'Giannis ', 'Molotof', 'student', '2025-09-12 05:58:15'),
(70, 'st10434061@upnet.gr', '$2y$10$LpVuw.Cgww35gXsS6nJ2ZuykVHcW3FyalC6J1/tJri725z0FiOci2', 'Sagdy', 'Znuts', 'student', '2025-09-12 05:58:15'),
(71, 'st10434062@upnet.gr', '$2y$10$gulwUMkXtAI4iD3RiGiTEuT7syLAidhL9Ux4Hm/9RPOZTqErOQQR6', 'Mary', 'Poppins', 'student', '2025-09-12 05:58:15'),
(72, 'st10434063@upnet.gr', '$2y$10$s024TQBwzHJPYO5Qu9BNLeuhgXfiaNwW0tZOiTcJhdNJ6eNXlcHy2', 'Tinker', 'Bell', 'student', '2025-09-12 05:58:15'),
(73, 'st10434064@upnet.gr', '$2y$10$wEwK3UN3OQ92.Ha1gGMJJuGJRpcPrPSgNSKHnEH.ir8Vw8Y58BrdO', 'Lilly', 'Bloom', 'student', '2025-09-12 05:58:15'),
(74, 'st10434065@upnet.gr', '$2y$10$6RhX6LX6k7fm/RKJFebh6.afZQaxrKZaTnxTi.JoFOIJ57m/rZiuK', 'GIORGOS', 'MASOURAS', 'student', '2025-09-12 05:58:15'),
(75, 'st10434066@upnet.gr', '$2y$10$HPmSJbsEUo4VUJiNmJ/27u.gFdTlYWqyTnY1EkOxp87KcWy/JzR6y', 'KENDRICK', 'NUNN', 'student', '2025-09-12 05:58:15'),
(76, 'st10434067@upnet.gr', '$2y$10$YMFqhT3/6xT3Bd5JJ72NleLUnuq8TsVUNZQgpBHazxPsfvNbGgWiK', 'Depeche', 'Mode', 'student', '2025-09-12 05:58:16'),
(77, 'st10434068@upnet.gr', '$2y$10$yKeWHVWNskymIpkbVHMWlOfSTBAgN92Cynjui0X3ollH1zuKqnf1m', 'name', 'surname', 'student', '2025-09-12 05:58:16'),
(78, 'st10434069@upnet.gr', '$2y$10$FhXwVJQnKc/XPpnW8B9K4OwDjNbt8xF0rPpKNYQTl9TO1rFA8wEXG', 'Nikos', 'Kosmopoulos', 'student', '2025-09-12 05:58:16'),
(79, 'st10434070@upnet.gr', '$2y$10$rpppXVM7FOYz4Jeokt69ZueohCtJYtgD0uUm6DX9i0ej.15w7wakO', 'Aris', 'Poupis', 'student', '2025-09-12 05:58:16'),
(80, 'st10434071@upnet.gr', '$2y$10$gz2pv0Ny5vysRFt/jSw77.OLOwx2eeilkEQOMKYbxLjPHC6XC..jC', 'gerry', 'banana', 'student', '2025-09-12 05:58:16'),
(81, 'st10434072@upnet.gr', '$2y$10$Wepzhgs43gdVJ66ocKUUBuI.tOqXMg2ZL03prNwxr3OiFEPBsFEiq', 'grekotsi', 'parthenios', 'student', '2025-09-12 05:58:16'),
(82, 'st10434073@upnet.gr', '$2y$10$/kgJ.hAVmIqb2AWF.sJ87uZgIyzF1btZqMYE7sJT1Gk9RqL9CYiWC', 'Mochi', 'Mon', 'student', '2025-09-12 05:58:16'),
(83, 'st10434074@upnet.gr', '$2y$10$Q.w21gR2Lnb09lk.Ro6Ls.mKrz5UGa5DVtpca08UKgXkgJpYSPgV2', 'Nikolaos', 'Serraios', 'student', '2025-09-12 05:58:16'),
(84, 'st10434075@upnet.gr', '$2y$10$bgTswpAZOjhbqTaPjiE/qe7pZcgkZElN0tgh2xha0Ii3r4LIRhaAi', 'Xaralampos', 'Mparmaksizoglou', 'student', '2025-09-12 05:58:16'),
(85, 'st10434076@upnet.gr', '$2y$10$9K0pLLspk0y4KfobcHzCwOLiw5wcOvgFbU2qv09mLKpwqo0Ncccta', 'kyriakos', 'pareena', 'student', '2025-09-12 05:58:16'),
(86, 'st10434077@upnet.gr', '$2y$10$UkayTC.a0iojMsC71X7PwuwVGr0xgEHqV0WOTjGF/1LHzuoAkT/0a', 'Tortelino', 'Diagrafino', 'student', '2025-09-12 05:58:16'),
(87, 'st10434078@upnet.gr', '$2y$10$atVlERQQbXdbDBCv3SBQeOAwbf0iMWuqxAN7LqWoYFdFAH/ue8Ady', 'Maria', 'Db', 'student', '2025-09-12 05:58:16'),
(88, 'st10434079@upnet.gr', '$2y$10$T7i0lnLj/TGrCqxv/B/khOMnab.B/ft7CWjKnM3MxJIr4SDNRdZuq', 'Bombardriro', 'Crocodilo', 'student', '2025-09-12 05:58:16'),
(89, 'st10434080@upnet.gr', '$2y$10$fGGST5EqSTdnmvX4..b45OfAKHLB3s7aNyuYFEvu.KkARwJuTyj/u', 'Balerinna ', 'Cappucinna', 'student', '2025-09-12 05:58:16'),
(90, 'st10434081@upnet.gr', '$2y$10$N0NOaBK55PRGPnxZ1cInzesZZ0EXpKXJPa6SJPbkVKVv8NUvTRrCe', 'Ntinos', 'Konstantinos', 'student', '2025-09-12 05:58:16'),
(91, 'st10434082@upnet.gr', '$2y$10$YJTVqA6DKzeIT3i3mD8Q2ONw0o7YbrwPZiP6/FwSKTf6mO8SFLnfe', 'Xara', 'Georgiou', 'student', '2025-09-12 05:58:16'),
(92, 'st10434083@upnet.gr', '$2y$10$anWztpSgE2/7/4Tpy.oQ.OYGyMeOgidnAxAPORx9oCSfsfPjhY1La', 'Marios', 'Konstantinou', 'student', '2025-09-12 05:58:16'),
(93, 'st10434084@upnet.gr', '$2y$10$ubekT7ppJXWF6HtO.IyhYuhPEUl2uw4E55hp2ZCD87sW.tN7cuPrq', 'Mina', 'Minopoulou', 'student', '2025-09-12 05:58:16'),
(94, 'st10434085@upnet.gr', '$2y$10$8sqxgckAQPPGcK8hZI5tTe8Od0cmUY8WDSfTMJjXeY1GspT6hmoPq', 'Sakis', 'Rouvas', 'student', '2025-09-12 05:58:16'),
(95, 'st10434086@upnet.gr', '$2y$10$PqZMcMrCs20xGBKsnxZfJOhFA4R3GpymdyMu0novJHaq6vlvz5XzK', 'Shinji', 'Ikari', 'student', '2025-09-12 05:58:16'),
(96, 'st10434087@upnet.gr', '$2y$10$Sda0CyN.QDaVYZyWPNilLOXr4BP5wnsJbiZs1qY57jD3qxip15Ufq', 'Alexis', 'tsipras', 'student', '2025-09-12 05:58:16'),
(97, 'st10434088@upnet.gr', '$2y$10$ncCUDz/8P96zN4PvpO6y9.TTi2IXkSo4krQy6MdNvxAf/F0xIrgP2', 'Tasos', 'kolokotronhs', 'student', '2025-09-12 05:58:16'),
(98, 'st10434089@upnet.gr', '$2y$10$T2AMQ1mQ7eF.1HF3HzaFLeNhTjtIzhDAky31GUqZP/HhD4N2SdxAC', 'Minas ', 'Minaroglou', 'student', '2025-09-12 05:58:16'),
(99, 'st10434090@upnet.gr', '$2y$10$F2G6CYdGi3q/WEMU8dOtBuXbfY/NuvKTFOqwY4T0CRdUXMHY8UGk2', 'La', 'Polizia', 'student', '2025-09-12 05:58:16'),
(100, 'st10434091@upnet.gr', '$2y$10$bFO6h1JkDyMXJ7A2IKiDluGDHdJU2NM/Ag968kffF51TVPUlXMJoK', 'manousos', 'Dlabiras', 'student', '2025-09-12 05:58:17'),
(101, 'st10434092@upnet.gr', '$2y$10$bi8.R0HYgEa.0WxY.pqWautme2lyWgcTSYJG9YAxsVDLGHRtUsXUC', 'Nick', 'Calathes', 'student', '2025-09-12 05:58:17'),
(102, 'st10434093@upnet.gr', '$2y$10$D.TZc2JB2pfkv1RQb9Nueu4cClp21VcSbuhfQ836s5l6RT5DEe8uO', 'Donald', 'Trump', 'student', '2025-09-12 05:58:17'),
(103, 'st10434094@upnet.gr', '$2y$10$I3AUbRGM9AMeP/xVl8yRjuZR5e4ybyEXJJutDvxfdmovCljB3Qkbi', 'Pelina', 'Anastasopoulou', 'student', '2025-09-12 05:58:17'),
(104, 'st10434095@upnet.gr', '$2y$10$aO75ADKMAZYiYMPlhM2jIu9UhXkxuH0kgkq6KZ2Na60mTurT6s2Kq', 'Andriana', 'Kapogiannopoulou', 'student', '2025-09-12 05:58:17'),
(105, 'st10434096@upnet.gr', '$2y$10$QlmFBELZVspDkQY6pgZ16ef7FEiahERaOPhxi17a58YtiB0DasHWa', 'Rixardos', 'Leodokardos', 'student', '2025-09-12 05:58:17'),
(106, 'st10434097@upnet.gr', '$2y$10$KnqCvzOASuicz8tNcZan5ueQC/H2eEjgAEVvIWKS2XDOsWJjcVCLi', 'Makis', 'Savvas', 'student', '2025-09-12 05:58:17'),
(107, 'st10434098@upnet.gr', '$2y$10$fKigdY0ZyQYMfsl80R3gIeqfklrTh2.1jzp/dQB3A3DR/Bgnb58Rm', 'Nikos', 'Stratomitros', 'student', '2025-09-12 05:58:17'),
(108, 'st10434099@upnet.gr', '$2y$10$XbVinBY53rQIgERd.gk3SujLXnk/qn/C1OuhFM.xF8DiZbWmvgPri', 'Lucifer', 'Morningstar', 'student', '2025-09-12 05:58:17'),
(109, 'st10434100@upnet.gr', '$2y$10$2LUovGkplXZvdFKveNAt2Olw8Qaak.l6TNFqwB6sFSJRYvbmUlQJO', 'Natasha ', 'Romanoff', 'student', '2025-09-12 05:58:17'),
(1, 'stu1@upnet.gr', '$2y$10$Sg5YtOVdTJh3DHel7hKyJukOf3zNbgqtN9i0pBWnfqSPPl49Bf0C.', 'stu1', 'ser1', 'student', '2025-09-11 22:14:33'),
(5, 'stu2@upnet.gr', '$2y$10$i3GOv0ZHsDNFEpAHwKOWiu2me9vb2ilXRE8PiuwGjm.lJLYxljbGu', 'stu2', 'stu2sur', 'student', '2025-09-12 02:00:34'),
(3, 'teach1@upnet.gr', '$2y$10$ogpd7VD7Lk3dgxGxe2PVBeikxvwp.C6m.j5Z0.L6HgyJU81ogUq/q', 'teach1', 'surteach1', 'teacher', '2025-09-11 22:30:28'),
(4, 'teach2@webmail.gr', '$2y$10$W8Mv2CloWnb1WciOfrMEHe4eE4ziWgs8Ceo.aCwxus6.nvr5NzkSa', 'teach2', 'teach2sur', 'teacher', '2025-09-12 01:19:17'),
(6, 'teach3@upnet.gr', '$2y$10$Nvvr1sc1CpJ0jlSY5jwzU.txugI81Dt6akN55uiiwS.i.8/iFY6PG', 'teach3', 'teach3sur', 'teacher', '2025-09-12 02:29:36'),
(7, 'teach4@upnet.gr', '$2y$10$xT42C5UiDGJaKbKBo73PTehZVgAuN7HZuqNYwJhtde3SDpmyvgpwS', 'teach4', 'teach4sur', 'teacher', '2025-09-12 05:19:19'),
(123, 'toxrusoftiari@funerals.gr', '$2y$10$35hg/qFPo7rC3AUCs1kFP.NJh6LUgqTteXX8TXa8eyMp6WJxSCaTa', 'Vlasis', 'Restas', 'teacher', '2025-09-12 05:58:18'),
(156, 'tsilis@tsilliuniversity.gr', '$2y$10$FRWvZ3fcCDR1oucntDzXDuLCyrlgf95IYXcBRByuGxSzQpkoWUNXi', 'Ioannis', 'Tsilis', 'teacher', '2025-09-12 05:58:19'),
(148, 'tungtungtung@itbr.com', '$2y$10$5H3415xrPWwBZPcsOhV0eOQq3TjBZW.vZzrpL4Y2M4yws/jYYEur2', 'Tung Tung', 'Sahur', 'teacher', '2025-09-12 05:58:19'),
(121, 'tzouli.ax@upatras.gr', '$2y$10$8dVHIDXRFJAUiWEECuKGnuKPouyjkhk4OXBnNqfMFamW3PvVNJ2DW', 'Tzouli', 'Alexandratou', 'teacher', '2025-09-12 05:58:17'),
(149, 'up1084561@ac.upatras.gr', '$2y$10$BALkNtbfa419vNSnstUNpOnzaj5UgOPTJc9SWcizeqYToTN58qYca', 'Maria', 'Papadopoulou', 'teacher', '2025-09-12 05:58:19'),
(150, 'up1234567@ac.upatras.gr', '$2y$10$N89BhMsbMKBmV418I77uDeOZzjvooLXboco2Dn.HcopCAUTJTm3Pq', 'Nikos', 'Georgiou', 'teacher', '2025-09-12 05:58:19'),
(111, 'vasfou@ceid.upatras.gr', '$2y$10$qrptQsxHX2/DWBPTQ2RW1e8S8qAGFccHsTOwiyV8QIrp1BFMqvlrO', 'Vasilis', 'Foukaras', 'teacher', '2025-09-12 05:58:17'),
(144, 'zaynmalik@gmail.com', '$2y$10$KrvWZEFgaDgsRSjEHh75RuxJQorDhzrg68BZ6SKvM5oR3OShR4BvO', 'Zayn', 'Malik', 'teacher', '2025-09-12 05:58:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `relation_id` (`relation_id`),
  ADD KEY `teach_email` (`teach_email`);

--
-- Indexes for table `secretary`
--
ALTER TABLE `secretary`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sql_logs`
--
ALTER TABLE `sql_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `am` (`am`);

--
-- Indexes for table `student_thesis_relation`
--
ALTER TABLE `student_thesis_relation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `stu_email` (`stu_email`),
  ADD KEY `teach1_email` (`teach1_email`),
  ADD KEY `teach2_email` (`teach2_email`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `thesis`
--
ALTER TABLE `thesis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `teacher` (`teacher`);

--
-- Indexes for table `thesis_notes`
--
ALTER TABLE `thesis_notes`
  ADD PRIMARY KEY (`note_id`),
  ADD UNIQUE KEY `note_id` (`note_id`),
  ADD KEY `thesis_id` (`thesis_id`),
  ADD KEY `teacher` (`teacher`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sql_logs`
--
ALTER TABLE `sql_logs`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT for table `student_thesis_relation`
--
ALTER TABLE `student_thesis_relation`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thesis`
--
ALTER TABLE `thesis`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `thesis_notes`
--
ALTER TABLE `thesis_notes`
  MODIFY `note_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `thesis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `student_thesis_relation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`teach_email`) REFERENCES `teacher` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `secretary`
--
ALTER TABLE `secretary`
  ADD CONSTRAINT `secretary_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_thesis_relation`
--
ALTER TABLE `student_thesis_relation`
  ADD CONSTRAINT `student_thesis_relation_ibfk_1` FOREIGN KEY (`stu_email`) REFERENCES `student` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_thesis_relation_ibfk_2` FOREIGN KEY (`teach1_email`) REFERENCES `teacher` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_thesis_relation_ibfk_3` FOREIGN KEY (`teach2_email`) REFERENCES `teacher` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_thesis_relation_ibfk_4` FOREIGN KEY (`thesis_id`) REFERENCES `thesis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thesis`
--
ALTER TABLE `thesis`
  ADD CONSTRAINT `thesis_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thesis_notes`
--
ALTER TABLE `thesis_notes`
  ADD CONSTRAINT `thesis_notes_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `thesis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thesis_notes_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
