-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2019 at 04:13 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hockey`
--
CREATE DATABASE IF NOT EXISTS `hockey` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hockey`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `captain`
-- (See below for the actual view)
--
CREATE TABLE `captain` (
`TEAM` varchar(20)
,`NAME` varchar(51)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `green_card`
-- (See below for the actual view)
--
CREATE TABLE `green_card` (
`PLAYER` varchar(51)
,`TEAM` varchar(20)
,`NO_OF_GREEN_CARD` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `match_detail`
--

CREATE TABLE `match_detail` (
  `WINNING_TEAM` varchar(30) NOT NULL,
  `GOALS_FOR` int(3) NOT NULL,
  `GOALS_AGAINST` int(3) DEFAULT NULL,
  `MATCH_NUMBER` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match_detail`
--

INSERT INTO `match_detail` (`WINNING_TEAM`, `GOALS_FOR`, `GOALS_AGAINST`, `MATCH_NUMBER`) VALUES
('CHINA', 3, 1, 4),
('CHINA', 2, 0, 9),
('INDIA', 4, 1, 1),
('INDIA', 3, 1, 6),
('INDIA', 3, 2, 7),
('INDIA&KOREA', 1, 1, 10),
('KOREA', 3, 1, 2),
('KOREA', 3, 1, 8),
('KOREA&JAPAN', 1, 1, 3),
('MALAYSIA', 3, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `match_fixture`
--

CREATE TABLE `match_fixture` (
  `MATCH_NUMBER` int(3) NOT NULL,
  `TEAMS_PLAYING` varchar(30) NOT NULL,
  `VENUE` varchar(40) NOT NULL DEFAULT 'Donghae_City_Sunrise_Stadium_Soth_Korea',
  `MATCH_DATE` date NOT NULL,
  `MATCH_TIME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match_fixture`
--

INSERT INTO `match_fixture` (`MATCH_NUMBER`, `TEAMS_PLAYING`, `VENUE`, `MATCH_DATE`, `MATCH_TIME`) VALUES
(1, 'INDIA_VS_JAPAN', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-13', '14:30:00'),
(2, 'KOREA_VS_MALAYSIA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-13', '16:30:00'),
(3, 'KOREA_VS_JAPAN', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-14', '14:30:00'),
(4, 'CHINA_VS_MALAYSIA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-14', '16:30:00'),
(5, 'JAPAN_VS_MALAYSIA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-16', '14:30:00'),
(6, 'INDIA_VS_CHINA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-16', '16:30:00'),
(7, 'MALAYASIA_VS_INDIA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-17', '14:30:00'),
(8, 'KOREA_VS_CHINA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-17', '16:30:00'),
(9, 'CHINA_VS_JAPAN', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-19', '14:30:00'),
(10, 'INDIA_VS_KOREA', 'Donghae_City_Sunrise_Stadium_Soth_Korea', '2018-05-19', '16:30:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `match_winner`
-- (See below for the actual view)
--
CREATE TABLE `match_winner` (
`MATCH_NO` int(3)
,`TEAM1_VS_TEAM2` varchar(30)
,`WINNERS` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `no_of_players`
--

CREATE TABLE `no_of_players` (
  `team` varchar(20) DEFAULT NULL,
  `no_of_players` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `no_of_players`
--

INSERT INTO `no_of_players` (`team`, `no_of_players`) VALUES
('CHINA', 12),
('INDIA', 11),
('JAPAN', 11),
('MALAYSIA', 11),
('SOUTH_KOREA', 11);

-- --------------------------------------------------------

--
-- Table structure for table `play`
--

CREATE TABLE `play` (
  `MATCH_NUMBER` int(3) DEFAULT NULL,
  `TEAM_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `play`
--

INSERT INTO `play` (`MATCH_NUMBER`, `TEAM_NAME`) VALUES
(1, 'INDIA'),
(1, 'JAPAN'),
(2, 'SOUTH_KOREA'),
(2, 'MALAYSIA'),
(3, 'SOUTH_KOREA'),
(3, 'JAPAN'),
(4, 'CHINA'),
(4, 'MALAYSIA'),
(5, 'JAPAN'),
(5, 'MALAYSIA'),
(6, 'INDIA'),
(6, 'CHINA'),
(7, 'MALAYSIA'),
(7, 'INDIA'),
(8, 'SOUTH_KOREA'),
(8, 'CHINA'),
(9, 'CHINA'),
(9, 'JAPAN'),
(10, 'INDIA'),
(10, 'SOUTH_KOREA');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `PLAYER_ID` varchar(20) NOT NULL,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `jersey_no` int(11) DEFAULT NULL,
  `DOB` date NOT NULL,
  `START_YEAR` year(4) NOT NULL,
  `GOALS_SCORED` int(11) NOT NULL DEFAULT '0',
  `GREEN_CARD` int(11) NOT NULL DEFAULT '0',
  `TEAM` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`PLAYER_ID`, `FIRST_NAME`, `LAST_NAME`, `jersey_no`, `DOB`, `START_YEAR`, `GOALS_SCORED`, `GREEN_CARD`, `TEAM`) VALUES
('CHI301', 'Zhang', 'Jinrong ', 12, '1997-01-05', 2017, 1, 0, 'CHINA'),
('CHI302', 'Li', 'Hong', 12, '1995-02-05', 2004, 1, 0, 'CHINA'),
('CHI303', 'Cui', 'Qiuxia', 7, '1989-02-15', 2001, 1, 1, 'CHINA'),
('CHI304', 'Gu', 'Bingfeng(C)', 2, '1989-02-11', 2003, 1, 0, 'CHINA'),
('CHI305', 'Chen', 'Yi', 22, '1995-03-10', 2006, 0, 0, 'CHINA'),
('CHI306', 'Peng', 'Yang', 10, '1998-02-11', 2016, 0, 1, 'CHINA'),
('CHI307', 'Song', 'Xiaoming', 3, '1994-01-11', 2012, 1, 0, 'CHINA'),
('CHI308', 'Dan', 'Wen', 19, '1996-11-11', 2016, 1, 0, 'CHINA'),
('CHI309', 'Liu', 'Meng', 21, '1998-10-11', 2016, 0, 0, 'CHINA'),
('CHI310', 'Yong', 'Jing', 17, '1994-04-14', 2014, 0, 0, 'CHINA'),
('CHI311', 'Tu', 'Yidan', 27, '1996-05-15', 2015, 0, 0, 'CHINA'),
('IND101', 'Rajani', 'Etimarpu', 13, '1990-06-09', 2009, 0, 0, 'INDIA'),
('IND102', 'Sunita', 'Lakra', 26, '1991-06-11', 2009, 0, 0, 'INDIA'),
('IND103', 'Anupa', 'Barla', 18, '1994-05-06', 2013, 1, 1, 'INDIA'),
('IND104', 'Navneet', 'Kaur', 25, '1996-01-26', 2012, 3, 0, 'INDIA'),
('IND105', 'Vandana', ' Katariya', 16, '1993-04-15', 2010, 3, 0, 'INDIA'),
('IND106', 'Rani', 'Rampal(C)', 28, '1994-12-04', 2009, 0, 0, 'INDIA'),
('IND107', 'Gurjit', ' Kaur', 2, '1995-10-25', 2014, 2, 0, 'INDIA'),
('IND108', 'Lalremsiami', '', 20, '2000-03-30', 2017, 1, 0, 'INDIA'),
('IND109', 'Namita', 'Toppo', 19, '1995-06-04', 2012, 0, 1, 'INDIA'),
('IND110', 'Monika', ' Malik', 4, '1993-11-05', 2012, 0, 0, 'INDIA'),
('IND111', 'Deepika', 'Thakur', 17, '1987-02-07', 2006, 0, 0, 'INDIA'),
('JAP501', 'Naho', 'Ichitani', 9, '1993-09-12', 2008, 1, 0, 'JAPAN'),
('JAP502', 'Megumi', 'Kageyama', 1, '1995-09-02', 2010, 0, 0, 'JAPAN'),
('JAP503', 'Natsuki', 'Naito(C)', 2, '1991-06-02', 2008, 0, 0, 'JAPAN'),
('JAP504', 'Minami', 'Shimizu', 10, '1995-09-02', 2014, 1, 0, 'JAPAN'),
('JAP505', 'Yui', 'Ishibashi', 15, '1993-06-12', 2012, 1, 0, 'JAPAN'),
('JAP506', 'Mayumi', 'Ono', 3, '1996-08-10', 2011, 0, 1, 'JAPAN'),
('JAP507', 'Hazuki', 'Nagai', 7, '1989-01-11', 2009, 0, 2, 'JAPAN'),
('JAP508', 'Yuri', 'Nagai', 12, '1998-05-11', 2017, 0, 0, 'JAPAN'),
('JAP509', 'Motomi', 'Kawamura', 22, '1995-07-18', 2013, 0, 0, 'JAPAN'),
('JAP510', 'Miki', 'Kozuka', 13, '1990-07-18', 2008, 0, 1, 'JAPAN'),
('JAP511', 'Shihori', 'Oikawa', 16, '1998-10-15', 2017, 0, 0, 'JAPAN'),
('KOR201', 'CHOI', 'SU-JI', 2, '0993-06-14', 2018, 0, 1, 'SOUTH_KOREA'),
('KOR202', 'Kim', 'Young-ran(C)', 4, '1985-08-01', 2008, 0, 0, 'SOUTH_KOREA'),
('KOR203', 'Lee', 'Yu-ri', 23, '1994-09-06', 2018, 1, 1, 'SOUTH_KOREA'),
('KOR204', 'Kim', 'Bo-mi', 18, '1985-03-16', 2006, 1, 0, 'SOUTH_KOREA'),
('KOR205', 'Kim', 'Ok-ju', 17, '1993-09-15', 2012, 2, 1, 'SOUTH_KOREA'),
('KOR206', 'Lee', 'Yu-rim', 5, '1995-01-29', 2006, 2, 0, 'SOUTH_KOREA'),
('KOR207', 'Bae', 'So-ra', 6, '1989-03-09', 2002, 0, 0, 'SOUTH_KOREA'),
('KOR208', 'Cheon', 'Seul-ki', 16, '1998-10-15', 2017, 1, 0, 'SOUTH_KOREA'),
('KOR209', 'Park', 'Sung-a', 11, '1991-11-10', 2009, 0, 0, 'SOUTH_KOREA'),
('KOR210', 'Shin', 'Hye-jeong', 21, '1991-09-11', 2009, 0, 0, 'SOUTH_KOREA'),
('KOR211', 'Cho', 'Eun-ji', 13, '1990-09-05', 2006, 0, 0, 'SOUTH_KOREA'),
('MAL401', 'Farah', 'Yahya', 1, '1994-06-15', 2012, 0, 0, 'MALAYSIA'),
('MAL402', 'NorainI', 'Rashid', 2, '1990-07-17', 2009, 1, 0, 'MALAYSIA'),
('MAL403', 'Nuraslinda', 'Said', 3, '1989-08-07', 2004, 1, 1, 'MALAYSIA'),
('MAL404', 'Nurul', 'Mansur', 4, '1998-09-17', 2017, 1, 0, 'MALAYSIA'),
('MAL405', 'Siti', 'Ruhani(c)', 7, '1991-02-11', 2006, 0, 0, 'MALAYSIA'),
('MAL406', 'Hanis', 'Onn', 12, '1998-07-10', 2014, 2, 0, 'MALAYSIA'),
('MAL407', 'Mas', 'Aziz', 16, '1993-12-10', 2014, 1, 0, 'MALAYSIA'),
('MAL408', 'Fatin', 'Shukri', 21, '1997-12-11', 2015, 1, 1, 'MALAYSIA'),
('MAL409', 'Fazilla', 'Silin', 19, '1988-12-02', 2006, 0, 0, 'MALAYSIA'),
('MAL410', 'Norhasliza', 'Ali', 5, '1990-01-12', 2006, 0, 0, 'MALAYSIA'),
('MAL411', 'Juliani', 'Mohamad Din', 8, '1988-09-02', 2002, 0, 0, 'MALAYSIA');

--
-- Triggers `player`
--
DELIMITER $$
CREATE TRIGGER `ages` BEFORE INSERT ON `player` FOR EACH ROW begin if new.dob> '2000-12-31' then signal sqlstate '45000' set message_text=' INAPPROPRIATE AGE TO PARTICIPATE' ; end if; end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `t1` AFTER INSERT ON `player` FOR EACH ROW begin delete from no_of_players; insert into no_of_players select team, count(player_id) from player group by team; end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `t11` BEFORE DELETE ON `player` FOR EACH ROW begin delete from no_of_players; insert into no_of_players select team, count(player_id) from player group by team ; end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `refereed`
--

CREATE TABLE `refereed` (
  `MATCH_NUMBER` int(3) DEFAULT NULL,
  `REFREE_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refereed`
--

INSERT INTO `refereed` (`MATCH_NUMBER`, `REFREE_ID`) VALUES
(1, 'R02'),
(2, 'R03'),
(2, 'R04'),
(3, 'R05'),
(3, 'R02'),
(4, 'R06'),
(4, 'R07'),
(5, 'R04'),
(6, 'R05'),
(6, 'R06'),
(7, 'R03'),
(7, 'R07'),
(8, 'R05'),
(8, 'R02'),
(9, 'R05'),
(9, 'R07'),
(10, 'R03'),
(10, 'R06'),
(1, 'R01'),
(5, 'R01');

-- --------------------------------------------------------

--
-- Table structure for table `refree`
--

CREATE TABLE `refree` (
  `REFREE_ID` varchar(10) NOT NULL,
  `FIRST_NAME` varchar(30) NOT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `COUNTRY` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refree`
--

INSERT INTO `refree` (`REFREE_ID`, `FIRST_NAME`, `LAST_NAME`, `COUNTRY`) VALUES
('R01', 'Miao', 'Lin', 'CHINA'),
('R02', 'Ayu', 'Zainuddin ', 'MALAYSIA'),
('R03', 'Liu', 'Xiaoying', 'CHINA'),
('R04', 'Dahiya', 'Deepa', 'INDIA'),
('R05', 'Melissa', 'Trivi', 'AUSTRALIA'),
('R06', 'Emi', 'Yamada', 'JAPAN'),
('R07', 'Kim', 'Yoon-seon', 'SOUTH_KOREA');

--
-- Triggers `refree`
--
DELIMITER $$
CREATE TRIGGER `t2` BEFORE DELETE ON `refree` FOR EACH ROW begin insert into ref_removed select * from refree where refree_id = old.refree_id ; end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ref_removed`
--

CREATE TABLE `ref_removed` (
  `refree_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_removed`
--

INSERT INTO `ref_removed` (`refree_id`, `first_name`, `last_name`, `country`) VALUES
('R11', 'abc', 'dce', 'ind');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TEAM_NAME` varchar(20) NOT NULL,
  `CURRENT_WORLD_RANKING` int(11) NOT NULL,
  `PLAYED` int(11) NOT NULL DEFAULT '0',
  `WON` int(11) NOT NULL DEFAULT '0',
  `LOST` int(11) NOT NULL DEFAULT '0',
  `DRAW` int(11) NOT NULL DEFAULT '0',
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `COACH` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TEAM_NAME`, `CURRENT_WORLD_RANKING`, `PLAYED`, `WON`, `LOST`, `DRAW`, `POINTS`, `COACH`) VALUES
('CHINA', 11, 4, 2, 2, 0, 6, 'JAMILON_MULDERS'),
('INDIA', 9, 4, 3, 0, 1, 10, 'SJOERD_MARIJNE'),
('JAPAN', 14, 4, 0, 3, 1, 1, 'TAKESHI_YAMANAKA'),
('MALAYSIA', 22, 4, 1, 3, 0, 3, 'DHARMARAJ_ABDULLAH'),
('SOUTH_KOREA', 10, 4, 2, 0, 1, 8, 'HUH_SANG-YOUNG');

-- --------------------------------------------------------

--
-- Table structure for table `tot_goals`
--

CREATE TABLE `tot_goals` (
  `goal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`team` varchar(20)
,`captain` varchar(51)
);

-- --------------------------------------------------------

--
-- Structure for view `captain`
--
DROP TABLE IF EXISTS `captain`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `captain`  AS  select `t`.`TEAM_NAME` AS `TEAM`,concat(`p`.`FIRST_NAME`,' ',`p`.`LAST_NAME`) AS `NAME` from (`team` `t` join `player` `p`) where ((`t`.`TEAM_NAME` = `p`.`TEAM`) and (`p`.`LAST_NAME` like '%(C)')) ;

-- --------------------------------------------------------

--
-- Structure for view `green_card`
--
DROP TABLE IF EXISTS `green_card`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `green_card`  AS  select concat(`player`.`FIRST_NAME`,' ',`player`.`LAST_NAME`) AS `PLAYER`,`player`.`TEAM` AS `TEAM`,`player`.`GREEN_CARD` AS `NO_OF_GREEN_CARD` from `player` where (`player`.`GREEN_CARD` > 0) ;

-- --------------------------------------------------------

--
-- Structure for view `match_winner`
--
DROP TABLE IF EXISTS `match_winner`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `match_winner`  AS  select `mf`.`MATCH_NUMBER` AS `MATCH_NO`,`mf`.`TEAMS_PLAYING` AS `TEAM1_VS_TEAM2`,`md`.`WINNING_TEAM` AS `WINNERS` from (`match_fixture` `mf` join `match_detail` `md`) where (`mf`.`MATCH_NUMBER` = `md`.`MATCH_NUMBER`) ;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `team`.`TEAM_NAME` AS `team`,concat(`player`.`FIRST_NAME`,' ',`player`.`LAST_NAME`) AS `captain` from (`player` join `team`) where ((`team`.`TEAM_NAME` = `player`.`TEAM`) and (`player`.`LAST_NAME` like '%(C)')) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `match_detail`
--
ALTER TABLE `match_detail`
  ADD PRIMARY KEY (`WINNING_TEAM`,`MATCH_NUMBER`),
  ADD KEY `MFK` (`MATCH_NUMBER`);

--
-- Indexes for table `match_fixture`
--
ALTER TABLE `match_fixture`
  ADD PRIMARY KEY (`MATCH_NUMBER`);

--
-- Indexes for table `play`
--
ALTER TABLE `play`
  ADD KEY `PFK1` (`MATCH_NUMBER`),
  ADD KEY `PFK2` (`TEAM_NAME`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`PLAYER_ID`),
  ADD KEY `PFK` (`TEAM`);

--
-- Indexes for table `refereed`
--
ALTER TABLE `refereed`
  ADD KEY `RFK1` (`MATCH_NUMBER`),
  ADD KEY `RFK2` (`REFREE_ID`);

--
-- Indexes for table `refree`
--
ALTER TABLE `refree`
  ADD PRIMARY KEY (`REFREE_ID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TEAM_NAME`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `match_detail`
--
ALTER TABLE `match_detail`
  ADD CONSTRAINT `MFK` FOREIGN KEY (`MATCH_NUMBER`) REFERENCES `match_fixture` (`MATCH_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `play`
--
ALTER TABLE `play`
  ADD CONSTRAINT `PFK1` FOREIGN KEY (`MATCH_NUMBER`) REFERENCES `match_fixture` (`MATCH_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PFK2` FOREIGN KEY (`TEAM_NAME`) REFERENCES `team` (`TEAM_NAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `PFK` FOREIGN KEY (`TEAM`) REFERENCES `team` (`TEAM_NAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refereed`
--
ALTER TABLE `refereed`
  ADD CONSTRAINT `RFK1` FOREIGN KEY (`MATCH_NUMBER`) REFERENCES `match_fixture` (`MATCH_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RFK2` FOREIGN KEY (`REFREE_ID`) REFERENCES `refree` (`REFREE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `kt`
--
CREATE DATABASE IF NOT EXISTS `kt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kt`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `password`) VALUES
('sowmya', 'sowmya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`name`);
--
-- Database: `lol`
--
CREATE DATABASE IF NOT EXISTS `lol` DEFAULT CHARACTER SET utf32 COLLATE utf32_bin;
USE `lol`;

-- --------------------------------------------------------

--
-- Table structure for table `a`
--

CREATE TABLE `a` (
  `user id` int(5) NOT NULL,
  `user name` varchar(20) COLLATE utf32_bin NOT NULL,
  `user email` varchar(30) COLLATE utf32_bin NOT NULL,
  `user password` varchar(30) COLLATE utf32_bin NOT NULL,
  `b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a`
--
ALTER TABLE `a`
  ADD PRIMARY KEY (`user id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'hockey', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'hdb', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"captain\",\"match_detail\",\"match_fixture\",\"play\",\"player\",\"refree\",\"refreed\",\"team\"],\"table_structure[]\":[\"captain\",\"match_detail\",\"match_fixture\",\"play\",\"player\",\"refree\",\"refreed\",\"team\"],\"table_data[]\":[\"captain\",\"match_detail\",\"match_fixture\",\"play\",\"player\",\"refree\",\"refreed\",\"team\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'server', 'HockeyTournament', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"hockey\",\"kt\",\"lol\",\"phpmyadmin\",\"sowmya\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"kt\",\"table\":\"user\"},{\"db\":\"lol\",\"table\":\"a\"},{\"db\":\"hockey\",\"table\":\"team\"},{\"db\":\"hockey\",\"table\":\"player\"},{\"db\":\"hockey\",\"table\":\"captain\"},{\"db\":\"hockey\",\"table\":\"refree\"},{\"db\":\"hockey\",\"table\":\"match_fixture\"},{\"db\":\"hockey\",\"table\":\"match_detail\"},{\"db\":\"hockey\",\"table\":\"no_of_players\"},{\"db\":\"hockey\",\"table\":\"referee\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'hockey', 'match_detail', '{\"sorted_col\":\"`match_detail`.`GOALS_FOR`  DESC\"}', '2018-11-02 07:49:36'),
('root', 'hockey', 'no_of_players', '{\"sorted_col\":\"`no_of_players`.`team`  ASC\"}', '2018-11-01 18:07:15'),
('root', 'hockey', 'refreed', '{\"sorted_col\":\"`refreed`.`MATCH_NUMBER` ASC\"}', '2018-11-01 18:29:07'),
('root', 'hockey', 'team', '{\"sorted_col\":\"`team`.`POINTS`  DESC\"}', '2018-11-22 03:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-07-18 14:09:32', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `sowmya`
--
CREATE DATABASE IF NOT EXISTS `sowmya` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sowmya`;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
