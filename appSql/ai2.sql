-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2021-06-15 02:16:21
-- 伺服器版本: 5.7.17-log
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ai2`
--

-- --------------------------------------------------------

--
-- 資料表結構 `commodity`
--

CREATE TABLE `commodity` (
  `mno` varchar(6) NOT NULL,
  `mname` varchar(10) NOT NULL,
  `purchase` int(8) NOT NULL,
  `sale` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `commodity`
--

INSERT INTO `commodity` (`mno`, `mname`, `purchase`, `sale`) VALUES
('', 'YYYY', 80, 90),
('1', '可樂', 10, 15),
('2', '蘋果汁', 10, 15),
('3', '純水', 10, 15),
('4', 'fff', 10, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `contact`
--

CREATE TABLE `contact` (
  `nno` int(6) NOT NULL,
  `jno` varchar(6) NOT NULL,
  `nname` varchar(10) NOT NULL,
  `method` varchar(10) NOT NULL,
  `title` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `contact`
--

INSERT INTO `contact` (`nno`, `jno`, `nname`, `method`, `title`) VALUES
(1, '1', '杜名稱', '3737373737', '杜稱謂'),
(2, '2', '林名稱', '2222222222', '林稱謂'),
(3, '3', '蕭名稱', '3737373737', '蕭稱謂'),
(4, '7', 'jhkjh', '0321620', 'ff'),
(5, '6', 'DDD', '062131313', 'Mr');

-- --------------------------------------------------------

--
-- 資料表結構 `equipment`
--

CREATE TABLE `equipment` (
  `eno` int(6) NOT NULL,
  `qno` int(11) NOT NULL,
  `edate` date NOT NULL,
  `summarize` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `equipment`
--

INSERT INTO `equipment` (`eno`, `qno`, `edate`, `summarize`) VALUES
(5, 5, '2011-01-01', 'OOOl'),
(61, 1, '2020-02-10', '123'),
(70, 2, '2020-01-20', '123');

-- --------------------------------------------------------

--
-- 資料表結構 `juristic`
--

CREATE TABLE `juristic` (
  `jno` int(6) NOT NULL,
  `jname` varchar(10) NOT NULL,
  `taxid` varchar(8) NOT NULL,
  `switchboard` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `juristic`
--

INSERT INTO `juristic` (`jno`, `jname`, `taxid`, `switchboard`) VALUES
(1, '林公司', '27272727', '2727272727'),
(2, '杜公司', '22222222', '2222222222'),
(3, '蕭公司', '37373737', '3737373737'),
(4, 'AAcom', '546852', '5556'),
(5, 'BBcom', '60000', '55566564'),
(6, 'CCcom', '12345678', '09123456');

-- --------------------------------------------------------

--
-- 資料表結構 `quote`
--

CREATE TABLE `quote` (
  `qno` int(6) NOT NULL,
  `nno` varchar(6) NOT NULL,
  `mno` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `qdate` date NOT NULL,
  `status` varchar(3) NOT NULL,
  `jno` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `quote`
--

INSERT INTO `quote` (`qno`, `nno`, `mno`, `quantity`, `qdate`, `status`, `jno`) VALUES
(1, '', '1', 0, '0000-00-00', '', ''),
(2, '2', '2', 20, '2020-01-04', '成交', ''),
(7, '2', '2', 20, '2020-01-04', '成交', ''),
(8, '1', '', 2, '2020-01-02', 'HH', '1'),
(9, '', '', 0, '0000-00-00', '', '1'),
(10, '5', '', 1, '2021-01-01', 'hhh', '1'),
(11, '6', '', 6, '2021-06-15', 'ING', '1');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`mno`);

--
-- 資料表索引 `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`nno`);

--
-- 資料表索引 `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`eno`);

--
-- 資料表索引 `juristic`
--
ALTER TABLE `juristic`
  ADD PRIMARY KEY (`jno`);

--
-- 資料表索引 `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`qno`),
  ADD KEY `jno` (`jno`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `contact`
--
ALTER TABLE `contact`
  MODIFY `nno` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用資料表 AUTO_INCREMENT `equipment`
--
ALTER TABLE `equipment`
  MODIFY `eno` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54565;
--
-- 使用資料表 AUTO_INCREMENT `juristic`
--
ALTER TABLE `juristic`
  MODIFY `jno` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用資料表 AUTO_INCREMENT `quote`
--
ALTER TABLE `quote`
  MODIFY `qno` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
