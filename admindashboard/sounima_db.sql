-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 18 mai 2025 à 00:49
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sounima_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `actors`
--

CREATE TABLE `actors` (
  `id` bigint(20) NOT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `actors`
--

INSERT INTO `actors` (`id`, `biography`, `name`, `photo_url`) VALUES
(26, '', 'Johnny Carson', 'https://image.tmdb.org/t/p/w500/sSltRe7S82Zw29lMRGLeEoL2PUu.jpg'),
(27, '', 'Wolfgang Bahro', 'https://image.tmdb.org/t/p/w500/hGwwtRfwnRg5Q7bfCQ8NlmPxUKO.jpg'),
(28, '', 'Anne Menden', 'https://image.tmdb.org/t/p/w500/iq2fCO6g1xBDToe3hKSo0J9A6Cw.jpg'),
(29, '', 'Richard Bacon', 'https://image.tmdb.org/t/p/w500/sm9ygsErWm00owyuRj2YZVnYZIT.jpg'),
(30, '', 'Fearne Cotton', 'https://image.tmdb.org/t/p/w500/vmmNALj0tR9ZzmV8FmykQ00QnxF.jpg'),
(31, '', 'Reggie Yates', 'https://image.tmdb.org/t/p/w500/eO5SQzSRcdfz0bdF8CtVyMnxhrg.jpg'),
(32, '', 'Edith Bowman', 'https://image.tmdb.org/t/p/w500/iccnca4C9YqWM8zUWQljIsf07qV.jpg'),
(33, '', 'Rufus Hound', 'https://image.tmdb.org/t/p/w500/qQ12GMxUellg1lQEQOtMi0qyW3T.jpg'),
(34, '', 'Kaitlyn Santa Juana', 'https://image.tmdb.org/t/p/w500/75Tdc3wg9mklJHy5LEj8OMjcPw8.jpg'),
(35, '', 'Teo Briones', 'https://image.tmdb.org/t/p/w500/1eDVJ9pzBQ5hWQv0pfRjWq2h7go.jpg'),
(36, '', 'Rya Kihlstedt', 'https://image.tmdb.org/t/p/w500/86ysgxNPkckt8jp715X79CdopB7.jpg'),
(37, '', 'Richard Harmon', 'https://image.tmdb.org/t/p/w500/tlWgu5Kp37C7XsgJVLmYsPKiAd6.jpg'),
(38, '', 'Owen Patrick Joyner', 'https://image.tmdb.org/t/p/w500/eTZiPEsHZmmgQKEhC8HDf28sFmY.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `description`, `name`) VALUES
(1, NULL, 'Action'),
(2, NULL, 'Aventure'),
(3, NULL, 'Animation'),
(4, NULL, 'Comédie'),
(5, NULL, 'Crime'),
(6, NULL, 'Documentaire'),
(7, NULL, 'Drame'),
(8, NULL, 'Familial'),
(9, NULL, 'Fantastique'),
(10, NULL, 'Histoire'),
(11, NULL, 'Horreur'),
(12, NULL, 'Musique'),
(13, NULL, 'Mystère'),
(14, NULL, 'Romance'),
(15, NULL, 'Science-Fiction'),
(16, NULL, 'Téléfilm'),
(17, NULL, 'Thriller'),
(18, NULL, 'Guerre'),
(19, NULL, 'Western'),
(20, NULL, 'Action'),
(21, NULL, 'Comédie'),
(22, NULL, 'Crime'),
(23, NULL, 'Documentaire'),
(24, NULL, 'Familial'),
(25, NULL, 'Histoire'),
(26, NULL, 'Horreur'),
(27, NULL, 'Musique'),
(28, NULL, 'Mystère'),
(29, NULL, 'Romance'),
(30, NULL, 'Science-Fiction'),
(31, NULL, 'Téléfilm'),
(32, NULL, 'Thriller'),
(33, NULL, 'Guerre'),
(34, NULL, 'Western'),
(35, NULL, 'Comédie'),
(36, NULL, 'Crime'),
(37, NULL, 'Documentaire'),
(38, NULL, 'Familial'),
(39, NULL, 'Musique'),
(40, NULL, 'Mystère'),
(41, NULL, 'Romance'),
(42, NULL, 'Science-Fiction'),
(43, NULL, 'Téléfilm'),
(44, NULL, 'Thriller'),
(45, NULL, 'Guerre'),
(46, NULL, 'Crime'),
(47, NULL, 'Documentaire'),
(48, NULL, 'Familial'),
(49, NULL, 'Musique'),
(50, NULL, 'Mystère'),
(51, NULL, 'Romance'),
(52, NULL, 'Science-Fiction'),
(53, NULL, 'Téléfilm'),
(54, NULL, 'Guerre'),
(55, NULL, 'Crime'),
(56, NULL, 'Documentaire'),
(57, NULL, 'Familial'),
(58, NULL, 'Musique'),
(59, NULL, 'Mystère'),
(60, NULL, 'Romance'),
(61, NULL, 'Science-Fiction'),
(62, NULL, 'Téléfilm'),
(63, NULL, 'Guerre'),
(64, NULL, 'Crime'),
(65, NULL, 'Documentaire'),
(66, NULL, 'Familial'),
(67, NULL, 'Musique'),
(68, NULL, 'Mystère'),
(69, NULL, 'Romance'),
(70, NULL, 'Science-Fiction'),
(71, NULL, 'Téléfilm'),
(72, NULL, 'Guerre'),
(73, NULL, 'Crime'),
(74, NULL, 'Documentaire'),
(75, NULL, 'Familial'),
(76, NULL, 'Musique'),
(77, NULL, 'Mystère'),
(78, NULL, 'Romance'),
(79, NULL, 'Science-Fiction'),
(80, NULL, 'Téléfilm'),
(81, NULL, 'Guerre'),
(82, NULL, 'Documentaire'),
(83, NULL, 'Familial'),
(84, NULL, 'Musique'),
(85, NULL, 'Mystère'),
(86, NULL, 'Romance'),
(87, NULL, 'Science-Fiction'),
(88, NULL, 'Téléfilm'),
(89, NULL, 'Guerre'),
(90, NULL, 'Documentaire'),
(91, NULL, 'Familial'),
(92, NULL, 'Musique'),
(93, NULL, 'Mystère'),
(94, NULL, 'Romance'),
(95, NULL, 'Science-Fiction'),
(96, NULL, 'Téléfilm'),
(97, NULL, 'Guerre'),
(98, NULL, 'Documentaire'),
(99, NULL, 'Familial'),
(100, NULL, 'Musique'),
(101, NULL, 'Mystère'),
(102, NULL, 'Romance'),
(103, NULL, 'Science-Fiction'),
(104, NULL, 'Téléfilm'),
(105, NULL, 'Guerre'),
(106, NULL, 'Familial'),
(107, NULL, 'Musique'),
(108, NULL, 'Mystère'),
(109, NULL, 'Romance'),
(110, NULL, 'Science-Fiction'),
(111, NULL, 'Téléfilm'),
(112, NULL, 'Guerre'),
(113, NULL, 'Familial'),
(114, NULL, 'Musique'),
(115, NULL, 'Mystère'),
(116, NULL, 'Romance'),
(117, NULL, 'Science-Fiction'),
(118, NULL, 'Téléfilm'),
(119, NULL, 'Guerre'),
(120, NULL, 'Familial'),
(121, NULL, 'Musique'),
(122, NULL, 'Mystère'),
(123, NULL, 'Romance'),
(124, NULL, 'Science-Fiction'),
(125, NULL, 'Téléfilm'),
(126, NULL, 'Guerre'),
(127, NULL, 'Familial'),
(128, NULL, 'Musique'),
(129, NULL, 'Mystère'),
(130, NULL, 'Romance'),
(131, NULL, 'Science-Fiction'),
(132, NULL, 'Téléfilm'),
(133, NULL, 'Guerre'),
(134, NULL, 'Familial'),
(135, NULL, 'Musique'),
(136, NULL, 'Mystère'),
(137, NULL, 'Romance'),
(138, NULL, 'Science-Fiction'),
(139, NULL, 'Téléfilm'),
(140, NULL, 'Guerre'),
(141, NULL, 'Familial'),
(142, NULL, 'Musique'),
(143, NULL, 'Mystère'),
(144, NULL, 'Romance'),
(145, NULL, 'Science-Fiction'),
(146, NULL, 'Téléfilm'),
(147, NULL, 'Guerre'),
(148, NULL, 'Familial'),
(149, NULL, 'Musique'),
(150, NULL, 'Mystère'),
(151, NULL, 'Romance'),
(152, NULL, 'Science-Fiction'),
(153, NULL, 'Téléfilm'),
(154, NULL, 'Guerre'),
(210, NULL, 'Familial'),
(211, NULL, 'Musique'),
(212, NULL, 'Mystère'),
(213, NULL, 'Romance'),
(214, NULL, 'Science-Fiction'),
(215, NULL, 'Téléfilm'),
(216, NULL, 'Guerre'),
(217, 'Genre Talk', 'Talk'),
(218, 'Genre Drama', 'Drama'),
(219, 'Genre Soap', 'Soap'),
(220, 'Genre Comedy', 'Comedy'),
(221, 'Genre News', 'News'),
(222, 'Genre Reality', 'Reality'),
(223, NULL, 'Familial'),
(224, NULL, 'Musique'),
(225, NULL, 'Mystère'),
(226, NULL, 'Romance'),
(227, NULL, 'Science-Fiction'),
(228, NULL, 'Téléfilm'),
(229, NULL, 'Guerre'),
(230, NULL, 'Familial'),
(231, NULL, 'Musique'),
(232, NULL, 'Mystère'),
(233, NULL, 'Romance'),
(234, NULL, 'Science-Fiction'),
(235, NULL, 'Téléfilm'),
(236, NULL, 'Guerre'),
(237, NULL, 'Familial'),
(238, NULL, 'Musique'),
(239, NULL, 'Mystère'),
(240, NULL, 'Romance'),
(241, NULL, 'Science-Fiction'),
(242, NULL, 'Téléfilm'),
(243, NULL, 'Guerre'),
(244, NULL, 'Familial'),
(245, NULL, 'Musique'),
(246, NULL, 'Mystère'),
(247, NULL, 'Romance'),
(248, NULL, 'Science-Fiction'),
(249, NULL, 'Téléfilm'),
(250, NULL, 'Guerre'),
(251, NULL, 'Familial'),
(252, NULL, 'Musique'),
(253, NULL, 'Mystère'),
(254, NULL, 'Romance'),
(255, NULL, 'Science-Fiction'),
(256, NULL, 'Téléfilm'),
(257, NULL, 'Guerre'),
(258, NULL, 'Familial'),
(259, NULL, 'Musique'),
(260, NULL, 'Mystère'),
(261, NULL, 'Romance'),
(262, NULL, 'Science-Fiction'),
(263, NULL, 'Téléfilm'),
(264, NULL, 'Guerre'),
(265, NULL, 'Familial'),
(266, NULL, 'Musique'),
(267, NULL, 'Mystère'),
(268, NULL, 'Romance'),
(269, NULL, 'Science-Fiction'),
(270, NULL, 'Téléfilm'),
(271, NULL, 'Guerre'),
(272, NULL, 'Familial'),
(273, NULL, 'Musique'),
(274, NULL, 'Mystère'),
(275, NULL, 'Romance'),
(276, NULL, 'Science-Fiction'),
(277, NULL, 'Téléfilm'),
(278, NULL, 'Guerre'),
(279, NULL, 'Familial'),
(280, NULL, 'Musique'),
(281, NULL, 'Mystère'),
(282, NULL, 'Romance'),
(283, NULL, 'Science-Fiction'),
(284, NULL, 'Téléfilm'),
(285, NULL, 'Guerre'),
(286, NULL, 'Familial'),
(287, NULL, 'Musique'),
(288, NULL, 'Mystère'),
(289, NULL, 'Romance'),
(290, NULL, 'Science-Fiction'),
(291, NULL, 'Téléfilm'),
(292, NULL, 'Guerre'),
(293, NULL, 'Familial'),
(294, NULL, 'Musique'),
(295, NULL, 'Mystère'),
(296, NULL, 'Romance'),
(297, NULL, 'Science-Fiction'),
(298, NULL, 'Téléfilm'),
(299, NULL, 'Guerre'),
(300, NULL, 'Familial'),
(301, NULL, 'Musique'),
(302, NULL, 'Mystère'),
(303, NULL, 'Romance'),
(304, NULL, 'Science-Fiction'),
(305, NULL, 'Téléfilm'),
(306, NULL, 'Guerre'),
(307, NULL, 'Familial'),
(308, NULL, 'Musique'),
(309, NULL, 'Mystère'),
(310, NULL, 'Romance'),
(311, NULL, 'Science-Fiction'),
(312, NULL, 'Téléfilm'),
(313, NULL, 'Guerre'),
(314, NULL, 'Familial'),
(315, NULL, 'Musique'),
(316, NULL, 'Mystère'),
(317, NULL, 'Romance'),
(318, NULL, 'Science-Fiction'),
(319, NULL, 'Téléfilm'),
(320, NULL, 'Guerre'),
(321, NULL, 'Familial'),
(322, NULL, 'Musique'),
(323, NULL, 'Mystère'),
(324, NULL, 'Romance'),
(325, NULL, 'Science-Fiction'),
(326, NULL, 'Téléfilm'),
(327, NULL, 'Guerre'),
(328, NULL, 'Familial'),
(329, NULL, 'Musique'),
(330, NULL, 'Mystère'),
(331, NULL, 'Romance'),
(332, NULL, 'Science-Fiction'),
(333, NULL, 'Téléfilm'),
(334, NULL, 'Guerre'),
(335, NULL, 'Familial'),
(336, NULL, 'Musique'),
(337, NULL, 'Mystère'),
(338, NULL, 'Romance'),
(339, NULL, 'Science-Fiction'),
(340, NULL, 'Téléfilm'),
(341, NULL, 'Guerre'),
(342, NULL, 'Familial'),
(343, NULL, 'Musique'),
(344, NULL, 'Mystère'),
(345, NULL, 'Romance'),
(346, NULL, 'Science-Fiction'),
(347, NULL, 'Téléfilm'),
(348, NULL, 'Guerre'),
(349, NULL, 'Familial'),
(350, NULL, 'Musique'),
(351, NULL, 'Mystère'),
(352, NULL, 'Romance'),
(353, NULL, 'Science-Fiction'),
(354, NULL, 'Téléfilm'),
(355, NULL, 'Guerre'),
(356, NULL, 'Familial'),
(357, NULL, 'Musique'),
(358, NULL, 'Mystère'),
(359, NULL, 'Romance'),
(360, NULL, 'Science-Fiction'),
(361, NULL, 'Téléfilm'),
(362, NULL, 'Guerre'),
(363, NULL, 'Familial'),
(364, NULL, 'Musique'),
(365, NULL, 'Mystère'),
(366, NULL, 'Romance'),
(367, NULL, 'Science-Fiction'),
(368, NULL, 'Téléfilm'),
(369, NULL, 'Guerre'),
(370, NULL, 'Familial'),
(371, NULL, 'Musique'),
(372, NULL, 'Mystère'),
(373, NULL, 'Romance'),
(374, NULL, 'Science-Fiction'),
(375, NULL, 'Téléfilm'),
(376, NULL, 'Guerre'),
(377, NULL, 'Familial'),
(378, NULL, 'Musique'),
(379, NULL, 'Mystère'),
(380, NULL, 'Romance'),
(381, NULL, 'Science-Fiction'),
(382, NULL, 'Téléfilm'),
(383, NULL, 'Guerre'),
(384, NULL, 'Familial'),
(385, NULL, 'Musique'),
(386, NULL, 'Mystère'),
(387, NULL, 'Romance'),
(388, NULL, 'Science-Fiction'),
(389, NULL, 'Téléfilm'),
(390, NULL, 'Guerre'),
(391, NULL, 'Familial'),
(392, NULL, 'Musique'),
(393, NULL, 'Mystère'),
(394, NULL, 'Romance'),
(395, NULL, 'Science-Fiction'),
(396, NULL, 'Téléfilm'),
(397, NULL, 'Guerre'),
(398, NULL, 'Familial'),
(399, NULL, 'Musique'),
(400, NULL, 'Mystère'),
(401, NULL, 'Romance'),
(402, NULL, 'Science-Fiction'),
(403, NULL, 'Téléfilm'),
(404, NULL, 'Guerre'),
(405, NULL, 'Familial'),
(406, NULL, 'Musique'),
(407, NULL, 'Mystère'),
(408, NULL, 'Romance'),
(409, NULL, 'Science-Fiction'),
(410, NULL, 'Téléfilm'),
(411, NULL, 'Guerre'),
(412, NULL, 'Familial'),
(413, NULL, 'Musique'),
(414, NULL, 'Mystère'),
(415, NULL, 'Romance'),
(416, NULL, 'Science-Fiction'),
(417, NULL, 'Téléfilm'),
(418, NULL, 'Guerre'),
(419, NULL, 'Familial'),
(420, NULL, 'Musique'),
(421, NULL, 'Mystère'),
(422, NULL, 'Romance'),
(423, NULL, 'Science-Fiction'),
(424, NULL, 'Téléfilm'),
(425, NULL, 'Guerre'),
(426, NULL, 'Familial'),
(427, NULL, 'Musique'),
(428, NULL, 'Mystère'),
(429, NULL, 'Romance'),
(430, NULL, 'Science-Fiction'),
(431, NULL, 'Téléfilm'),
(432, NULL, 'Guerre'),
(433, NULL, 'Familial'),
(434, NULL, 'Musique'),
(435, NULL, 'Mystère'),
(436, NULL, 'Romance'),
(437, NULL, 'Science-Fiction'),
(438, NULL, 'Téléfilm'),
(439, NULL, 'Guerre'),
(440, NULL, 'Familial'),
(441, NULL, 'Musique'),
(442, NULL, 'Mystère'),
(443, NULL, 'Romance'),
(444, NULL, 'Science-Fiction'),
(445, NULL, 'Téléfilm'),
(446, NULL, 'Guerre'),
(447, NULL, 'Familial'),
(448, NULL, 'Musique'),
(449, NULL, 'Mystère'),
(450, NULL, 'Romance'),
(451, NULL, 'Science-Fiction'),
(452, NULL, 'Téléfilm'),
(453, NULL, 'Guerre'),
(454, NULL, 'Familial'),
(455, NULL, 'Musique'),
(456, NULL, 'Mystère'),
(457, NULL, 'Romance'),
(458, NULL, 'Science-Fiction'),
(459, NULL, 'Téléfilm'),
(460, NULL, 'Guerre'),
(461, NULL, 'Familial'),
(462, NULL, 'Musique'),
(463, NULL, 'Mystère'),
(464, NULL, 'Romance'),
(465, NULL, 'Science-Fiction'),
(466, NULL, 'Téléfilm'),
(467, NULL, 'Guerre'),
(468, NULL, 'Familial'),
(469, NULL, 'Musique'),
(470, NULL, 'Mystère'),
(471, NULL, 'Romance'),
(472, NULL, 'Science-Fiction'),
(473, NULL, 'Téléfilm'),
(474, NULL, 'Guerre'),
(475, NULL, 'Familial'),
(476, NULL, 'Musique'),
(477, NULL, 'Mystère'),
(478, NULL, 'Romance'),
(479, NULL, 'Science-Fiction'),
(480, NULL, 'Téléfilm'),
(481, NULL, 'Guerre'),
(482, NULL, 'Familial'),
(483, NULL, 'Musique'),
(484, NULL, 'Mystère'),
(485, NULL, 'Romance'),
(486, NULL, 'Science-Fiction'),
(487, NULL, 'Téléfilm'),
(488, NULL, 'Guerre'),
(489, NULL, 'Familial'),
(490, NULL, 'Musique'),
(491, NULL, 'Mystère'),
(492, NULL, 'Romance'),
(493, NULL, 'Science-Fiction'),
(494, NULL, 'Téléfilm'),
(495, NULL, 'Guerre'),
(496, NULL, 'Familial'),
(497, NULL, 'Musique'),
(498, NULL, 'Mystère'),
(499, NULL, 'Romance'),
(500, NULL, 'Science-Fiction'),
(501, NULL, 'Téléfilm'),
(502, NULL, 'Guerre'),
(503, NULL, 'Familial'),
(504, NULL, 'Musique'),
(505, NULL, 'Mystère'),
(506, NULL, 'Romance'),
(507, NULL, 'Science-Fiction'),
(508, NULL, 'Téléfilm'),
(509, NULL, 'Guerre'),
(510, NULL, 'Familial'),
(511, NULL, 'Musique'),
(512, NULL, 'Mystère'),
(513, NULL, 'Romance'),
(514, NULL, 'Science-Fiction'),
(515, NULL, 'Téléfilm'),
(516, NULL, 'Guerre'),
(517, NULL, 'Familial'),
(518, NULL, 'Musique'),
(519, NULL, 'Mystère'),
(520, NULL, 'Romance'),
(521, NULL, 'Science-Fiction'),
(522, NULL, 'Téléfilm'),
(523, NULL, 'Guerre'),
(524, NULL, 'Familial'),
(525, NULL, 'Musique'),
(526, NULL, 'Mystère'),
(527, NULL, 'Romance'),
(528, NULL, 'Science-Fiction'),
(529, NULL, 'Téléfilm'),
(530, NULL, 'Guerre'),
(531, NULL, 'Familial'),
(532, NULL, 'Musique'),
(533, NULL, 'Mystère'),
(534, NULL, 'Romance'),
(535, NULL, 'Science-Fiction'),
(536, NULL, 'Téléfilm'),
(537, NULL, 'Guerre'),
(538, NULL, 'Familial'),
(539, NULL, 'Musique'),
(540, NULL, 'Mystère'),
(541, NULL, 'Romance'),
(542, NULL, 'Science-Fiction'),
(543, NULL, 'Téléfilm'),
(544, NULL, 'Guerre'),
(545, NULL, 'Familial'),
(546, NULL, 'Musique'),
(547, NULL, 'Mystère'),
(548, NULL, 'Romance'),
(549, NULL, 'Science-Fiction'),
(550, NULL, 'Téléfilm'),
(551, NULL, 'Guerre'),
(552, NULL, 'Familial'),
(553, NULL, 'Musique'),
(554, NULL, 'Mystère'),
(555, NULL, 'Romance'),
(556, NULL, 'Science-Fiction'),
(557, NULL, 'Téléfilm'),
(558, NULL, 'Guerre'),
(559, NULL, 'Familial'),
(560, NULL, 'Musique'),
(561, NULL, 'Mystère'),
(562, NULL, 'Romance'),
(563, NULL, 'Science-Fiction'),
(564, NULL, 'Téléfilm'),
(565, NULL, 'Guerre'),
(566, NULL, 'Familial'),
(567, NULL, 'Musique'),
(568, NULL, 'Mystère'),
(569, NULL, 'Romance'),
(570, NULL, 'Science-Fiction'),
(571, NULL, 'Téléfilm'),
(572, NULL, 'Guerre'),
(573, NULL, 'Familial'),
(574, NULL, 'Musique'),
(575, NULL, 'Mystère'),
(576, NULL, 'Romance'),
(577, NULL, 'Science-Fiction'),
(578, NULL, 'Téléfilm'),
(579, NULL, 'Guerre'),
(580, NULL, 'Familial'),
(581, NULL, 'Musique'),
(582, NULL, 'Mystère'),
(583, NULL, 'Romance'),
(584, NULL, 'Science-Fiction'),
(585, NULL, 'Téléfilm'),
(586, NULL, 'Guerre'),
(587, NULL, 'Familial'),
(588, NULL, 'Musique'),
(589, NULL, 'Mystère'),
(590, NULL, 'Romance'),
(591, NULL, 'Science-Fiction'),
(592, NULL, 'Téléfilm'),
(593, NULL, 'Guerre'),
(594, NULL, 'Familial'),
(595, NULL, 'Musique'),
(596, NULL, 'Mystère'),
(597, NULL, 'Romance'),
(598, NULL, 'Science-Fiction'),
(599, NULL, 'Téléfilm'),
(600, NULL, 'Guerre'),
(601, NULL, 'Familial'),
(602, NULL, 'Musique'),
(603, NULL, 'Mystère'),
(604, NULL, 'Romance'),
(605, NULL, 'Science-Fiction'),
(606, NULL, 'Téléfilm'),
(607, NULL, 'Guerre'),
(608, NULL, 'Familial'),
(609, NULL, 'Musique'),
(610, NULL, 'Mystère'),
(611, NULL, 'Romance'),
(612, NULL, 'Science-Fiction'),
(613, NULL, 'Téléfilm'),
(614, NULL, 'Guerre'),
(615, NULL, 'Familial'),
(616, NULL, 'Musique'),
(617, NULL, 'Mystère'),
(618, NULL, 'Romance'),
(619, NULL, 'Science-Fiction'),
(620, NULL, 'Téléfilm'),
(621, NULL, 'Guerre'),
(622, NULL, 'Familial'),
(623, NULL, 'Musique'),
(624, NULL, 'Mystère'),
(625, NULL, 'Romance'),
(626, NULL, 'Science-Fiction'),
(627, NULL, 'Téléfilm'),
(628, NULL, 'Guerre'),
(629, NULL, 'Familial'),
(630, NULL, 'Musique'),
(631, NULL, 'Mystère'),
(632, NULL, 'Romance'),
(633, NULL, 'Science-Fiction'),
(634, NULL, 'Téléfilm'),
(635, NULL, 'Guerre'),
(636, NULL, 'Familial'),
(637, NULL, 'Musique'),
(638, NULL, 'Mystère'),
(639, NULL, 'Romance'),
(640, NULL, 'Science-Fiction'),
(641, NULL, 'Téléfilm'),
(642, NULL, 'Guerre'),
(643, NULL, 'Familial'),
(644, NULL, 'Musique'),
(645, NULL, 'Mystère'),
(646, NULL, 'Romance'),
(647, NULL, 'Science-Fiction'),
(648, NULL, 'Téléfilm'),
(649, NULL, 'Guerre'),
(650, NULL, 'Familial'),
(651, NULL, 'Musique'),
(652, NULL, 'Mystère'),
(653, NULL, 'Romance'),
(654, NULL, 'Science-Fiction'),
(655, NULL, 'Téléfilm'),
(656, NULL, 'Guerre'),
(657, NULL, 'Familial'),
(658, NULL, 'Musique'),
(659, NULL, 'Mystère'),
(660, NULL, 'Romance'),
(661, NULL, 'Science-Fiction'),
(662, NULL, 'Téléfilm'),
(663, NULL, 'Guerre'),
(664, NULL, 'Familial'),
(665, NULL, 'Musique'),
(666, NULL, 'Mystère'),
(667, NULL, 'Romance'),
(668, NULL, 'Science-Fiction'),
(669, NULL, 'Téléfilm'),
(670, NULL, 'Guerre'),
(671, NULL, 'Familial'),
(672, NULL, 'Musique'),
(673, NULL, 'Mystère'),
(674, NULL, 'Romance'),
(675, NULL, 'Science-Fiction'),
(676, NULL, 'Téléfilm'),
(677, NULL, 'Guerre'),
(678, NULL, 'Familial'),
(679, NULL, 'Musique'),
(680, NULL, 'Mystère'),
(681, NULL, 'Romance'),
(682, NULL, 'Science-Fiction'),
(683, NULL, 'Téléfilm'),
(684, NULL, 'Guerre'),
(685, NULL, 'Familial'),
(686, NULL, 'Musique'),
(687, NULL, 'Mystère'),
(688, NULL, 'Romance'),
(689, NULL, 'Science-Fiction'),
(690, NULL, 'Téléfilm'),
(691, NULL, 'Guerre'),
(692, 'Genre Family', 'Family'),
(693, 'Genre War', 'War'),
(694, 'Genre Horror', 'Horror'),
(695, 'Genre Mystery', 'Mystery'),
(696, 'Genre Adventure', 'Adventure'),
(697, NULL, 'Familial'),
(698, NULL, 'Musique'),
(699, NULL, 'Mystère'),
(700, NULL, 'Romance'),
(701, NULL, 'Science-Fiction'),
(702, NULL, 'Téléfilm'),
(703, NULL, 'Guerre'),
(704, NULL, 'Familial'),
(705, NULL, 'Musique'),
(706, NULL, 'Mystère'),
(707, NULL, 'Romance'),
(708, NULL, 'Science-Fiction'),
(709, NULL, 'Téléfilm'),
(710, NULL, 'Guerre'),
(711, NULL, 'Familial'),
(712, NULL, 'Musique'),
(713, NULL, 'Mystère'),
(714, NULL, 'Romance'),
(715, NULL, 'Science-Fiction'),
(716, NULL, 'Téléfilm'),
(717, NULL, 'Guerre'),
(718, NULL, 'Familial'),
(719, NULL, 'Musique'),
(720, NULL, 'Mystère'),
(721, NULL, 'Romance'),
(722, NULL, 'Science-Fiction'),
(723, NULL, 'Téléfilm'),
(724, NULL, 'Guerre'),
(725, NULL, 'Familial'),
(726, NULL, 'Musique'),
(727, NULL, 'Mystère'),
(728, NULL, 'Romance'),
(729, NULL, 'Science-Fiction'),
(730, NULL, 'Téléfilm'),
(731, NULL, 'Guerre'),
(732, NULL, 'Familial'),
(733, NULL, 'Musique'),
(734, NULL, 'Mystère'),
(735, NULL, 'Romance'),
(736, NULL, 'Science-Fiction'),
(737, NULL, 'Téléfilm'),
(738, NULL, 'Guerre'),
(739, NULL, 'Familial'),
(740, NULL, 'Musique'),
(741, NULL, 'Mystère'),
(742, NULL, 'Romance'),
(743, NULL, 'Science-Fiction'),
(744, NULL, 'Téléfilm'),
(745, NULL, 'Guerre'),
(746, NULL, 'Familial'),
(747, NULL, 'Musique'),
(748, NULL, 'Mystère'),
(749, NULL, 'Romance'),
(750, NULL, 'Science-Fiction'),
(751, NULL, 'Téléfilm'),
(752, NULL, 'Guerre'),
(753, NULL, 'Familial'),
(754, NULL, 'Musique'),
(755, NULL, 'Mystère'),
(756, NULL, 'Romance'),
(757, NULL, 'Science-Fiction'),
(758, NULL, 'Téléfilm'),
(759, NULL, 'Guerre'),
(760, NULL, 'Familial'),
(761, NULL, 'Musique'),
(762, NULL, 'Mystère'),
(763, NULL, 'Romance'),
(764, NULL, 'Science-Fiction'),
(765, NULL, 'Téléfilm'),
(766, NULL, 'Guerre'),
(767, NULL, 'Familial'),
(768, NULL, 'Musique'),
(769, NULL, 'Mystère'),
(770, NULL, 'Romance'),
(771, NULL, 'Science-Fiction'),
(772, NULL, 'Téléfilm'),
(773, NULL, 'Guerre');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `release_year` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `magnet_link` varchar(1000) DEFAULT NULL,
  `tmdb_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `description`, `director`, `duration`, `poster_url`, `rating`, `release_year`, `title`, `video_url`, `magnet_link`, `tmdb_id`) VALUES
(21, 'Four misfits find themselves struggling with ordinary problems when they are suddenly pulled through a mysterious portal into the Overworld: a bizarre, cubic wonderland that thrives on imagination. To get back home, they\'ll have to master this world while embarking on a magical quest with an unexpected, expert crafter, Steve.', '', 0, 'https://image.tmdb.org/t/p/w500/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg', 6.491, 2025, 'A Minecraft Movie', NULL, NULL, 950387),
(22, 'A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.', '', 0, 'https://image.tmdb.org/t/p/w500/srj9rYrjefyWqkLc6l2xjTGeBGO.jpg', 7.126, 2025, 'Warfare', NULL, NULL, 1241436),
(23, 'Following the benevolent King\'s disappearance, the Evil Queen dominated the once fair land with a cruel streak. Princess Snow White flees the castle when the Queen, in her jealousy over Snow White\'s inner beauty, tries to kill her. Deep into the dark woods, she stumbles upon seven magical dwarves and a young bandit named Jonathan. Together, they strive to survive the Queen\'s relentless pursuit and aspire to take back the kingdom.', '', 0, 'https://image.tmdb.org/t/p/w500/tWnRFoToYWCKuDEKXH3oki0KGs0.jpg', 4.3, 2025, 'Snow White', NULL, NULL, 447273),
(24, 'An ex-special forces operative seeks revenge against a cult leader who has corrupted his former comrades, the Shinjas. This leader, known as The Bokushi, promises veterans a purpose and protection, but is revealed to be a destructive influence. The ex-soldier, Nash Cavanaugh, joins forces with military operative Emmanuel Ashburn to infiltrate the Bokushi\'s fortress and expose his reign of terror', '', 0, 'https://image.tmdb.org/t/p/w500/lFFDrFLXywFhy6khHes1LCFVMsL.jpg', 5.469, 2025, 'Tin Soldier', NULL, NULL, 977294),
(25, 'Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss\'s daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.', '', 0, 'https://image.tmdb.org/t/p/w500/6FRFIogh3zFnVWn7Z6zcYnIbRcX.jpg', 6.5, 2025, 'A Working Man', NULL, NULL, 1197306),
(26, 'Plagued by a violent recurring nightmare, college student Stefanie heads home to track down the one person who might be able to break the cycle and save her family from the grisly demise that inevitably awaits them all.', '', 0, 'https://image.tmdb.org/t/p/w500/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg', 7.3, 2025, 'Final Destination Bloodlines', NULL, NULL, 574475),
(27, 'After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.', '', 0, 'https://image.tmdb.org/t/p/w500/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg', 7.482, 2025, 'Thunderbolts*', NULL, NULL, 986056),
(28, 'Car genius Lino returns to conclude his vendetta against Areski and the corrupt commander who ruined their lives in this turbo-charged trilogy finale.', '', 0, 'https://image.tmdb.org/t/p/w500/qycPITRqXgPai7zj1gKffjCdSB5.jpg', 6.8, 2025, 'Last Bullet', NULL, NULL, 1144430),
(29, 'An expelled boxing champion, who now is a high-school teacher, witnesses intolerable violence and throws her first punch to build justice against it, while putting on a mask.', '', 0, 'https://image.tmdb.org/t/p/w500/6Ea5i6APeTfm4hHh6dg5Z733JVS.jpg', 7.1, 2023, 'Brave Citizen', NULL, NULL, 897160),
(30, 'After discovering his blood-soaked daughter dead in the bathtub, David Bryson attends a self-help group to help save him from his ghostly nightmares. But when a group of mysterious cult-like women offer to help him resurrect his daughter. David\'s choices will not just decide his fate... but the fate of his dead daughter\'s SOUL.', '', 0, 'https://image.tmdb.org/t/p/w500/t4MiAeYpjL7saYvqvcn9xtOfA4K.jpg', 5.263, 2024, 'Conjuring the Cult', NULL, NULL, 1359977),
(31, 'The life of Bambi, a male roe deer, from his birth through childhood, the loss of his mother, the finding of a mate, the lessons he learns from his father, and the experience he gains about the dangers posed by human hunters in the forest.', '', 0, 'https://image.tmdb.org/t/p/w500/vWNVHtwOhcoOEUSrY1iHRGbgH8O.jpg', 6.133, 2024, 'Bambi: A Life in the Woods', NULL, NULL, 1094473),
(32, 'When her son vanishes inside a US consulate, ex-special forces soldier Sara does everything in her power to find him — and uncovers a dark conspiracy.', '', 0, 'https://image.tmdb.org/t/p/w500/jM2uqCZNKbiyStyzXOERpMqAbdx.jpg', 6.627, 2025, 'Exterritorial', NULL, NULL, 1233069),
(33, '', '', 0, 'https://image.tmdb.org/t/p/w500/h7shL668vhC2wsZQSBWzxkMuZ8K.jpg', 0, 2023, 'The Great Escape', NULL, NULL, 1480799),
(34, 'After meeting with newly elected U.S. President Thaddeus Ross, Sam finds himself in the middle of an international incident. He must discover the reason behind a nefarious global plot before the true mastermind has the entire world seeing red.', '', 0, 'https://image.tmdb.org/t/p/w500/pzIddUEMWhWzfvLI3TwxUG2wGoi.jpg', 6.1, 2025, 'Captain America: Brave New World', NULL, NULL, 822119),
(35, 'A queen sends the powerful and feared sorceress Gray Alys to the ghostly wilderness of the Lost Lands in search of a magical power, where she and her guide, the drifter Boyce, must outwit and outfight both man and demon.', '', 0, 'https://image.tmdb.org/t/p/w500/dDlfjR7gllmr8HTeN6rfrYhTdwX.jpg', 6.351, 2025, 'In the Lost Lands', NULL, NULL, 324544),
(36, 'An ex-con gets a fresh start when hired to protect a wealthy heiress from a stalker — but their chemistry is hard to resist as they grow closer.', '', 0, 'https://image.tmdb.org/t/p/w500/ghhooCOqQDqC6vhS1SVN2tCE0k8.jpg', 5.621, 2025, 'Bad Influence', NULL, NULL, 1323784),
(37, 'Infamous outlaw Harland Rust breaks his estranged grandson Lucas out of prison, after Lucas is convicted to hang for an accidental murder. The two must outrun legendary U.S Marshal Wood Helm and bounty hunter Fenton \"Preacher\" Lang who are hot on their tails. Deeply buried secrets rise from the ashes and an unexpected familial bond begins to form as the mismatched duo tries to survive the merciless American Frontier.', '', 0, 'https://image.tmdb.org/t/p/w500/tbJ3RkA2s6X5qrBzrYHYTxvDBui.jpg', 6.388, 2025, 'Rust', NULL, NULL, 710258),
(38, 'Craven, a streamer with thousands of followers on a live streaming platform, has prepared a very special stream for Halloween. What no one expects when reacting to a video of Pentagram, a group of young paranormal investigators, is that the live experience will turn into the worst night of their lives. And maybe... the last.', '', 0, 'https://image.tmdb.org/t/p/w500/nnyjtBfUYA8ASHA9OhADrX0sMNQ.jpg', 6.5, 2024, 'Stream', NULL, NULL, 1260820),
(39, 'When a drug heist swerves lethally out of control, a jaded cop fights his way through a corrupt city\'s criminal underworld to save a politician\'s son.', '', 0, 'https://image.tmdb.org/t/p/w500/r46leE6PSzLR3pnVzaxx5Q30yUF.jpg', 6.515, 2025, 'Havoc', NULL, NULL, 668489),
(40, 'Ethan Hunt and the IMF team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — with the world\'s governments and a mysterious ghost from Ethan\'s past on their trail. Joined by new allies and armed with the means to shut the Entity down for good, Hunt is in a race against time to prevent the world as we know it from changing forever.', '', 0, 'https://image.tmdb.org/t/p/w500/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg', 7.867, 2025, 'Mission: Impossible - The Final Reckoning', NULL, NULL, 575265);

-- --------------------------------------------------------

--
-- Structure de la table `movie_actors`
--

CREATE TABLE `movie_actors` (
  `movie_id` bigint(20) NOT NULL,
  `actor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie_actors`
--

INSERT INTO `movie_actors` (`movie_id`, `actor_id`) VALUES
(26, 37),
(26, 35),
(26, 38),
(26, 34),
(26, 36);

-- --------------------------------------------------------

--
-- Structure de la table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` bigint(20) NOT NULL,
  `genre_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(26, 695),
(26, 694);

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE `serie` (
  `id` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `episodes` int(11) NOT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `rating` double NOT NULL,
  `release_year` int(11) NOT NULL,
  `seasons` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `description`, `episodes`, `poster_url`, `rating`, `release_year`, `seasons`, `title`) VALUES
(1, 'Le 1er octobre 1962, Groucho Marx accueillit Johnny Carson comme le nouveau présentateur du The Tonight Show.\n\nL’émission a été filmée à New York pendant pratiquement les dix premières années, avec Johnny Carson en tant que présentateur. Puis à partir de mai 1972, le plateau déménagea au Studio One à Burbank en Californie pour le reste de son « mandat » .', 1, 'https://image.tmdb.org/t/p/w500/uSvET5YUvHNDIeoCpErrbSmasFb.jpg', 7.463, 1962, 1, 'The Tonight Show avec Johnny Carson'),
(2, '', 1, 'https://image.tmdb.org/t/p/w500/qujVFLAlBnPU9mZElV4NZgL8iXT.jpg', 5.711, 1992, 1, 'Gute Zeiten, schlechte Zeiten'),
(3, 'Andy Cohen, directeur du réseau Bravo, discute de sujets liés à la culture pop avec des célébrités et des personnalités de téléréalité.', 1, 'https://image.tmdb.org/t/p/w500/onSD9UXfJwrMXWhq7UY7hGF2S1h.jpg', 5.103, 2009, 1, 'Watch What Happens Live with Andy Cohen'),
(4, '', 1, 'https://image.tmdb.org/t/p/w500/gGC7zSDgG0FY0MbM1pjfhTCWQBI.jpg', 6.832, 2005, 1, 'The Late Late Show with Craig Ferguson'),
(5, 'Les intrigues du Fürstenhof, un hôtel cinq étoiles situé en Bavière.', 1, 'https://image.tmdb.org/t/p/w500/jfFNydakwvbeACEwSd2Gh8UWtba.jpg', 6.066, 2005, 1, 'Le tourbillon de l\'amour'),
(6, 'Diana, 23 ans, rêve de devenir patineuse artistique professionnelle. Un directeur marketing d\'un centre de remise en forme, qui cherche une nouvelle égérie pour sa campagne publicitaire, décide de l\'engager.', 1, 'https://image.tmdb.org/t/p/w500/kh7lcozUlj13uRqoZJ2ZjENkm9Q.jpg', 5, 2006, 1, 'Le rêve de Diana'),
(7, 'Les inspecteurs qui font partie de la division des Crimes sexuels (SVU) du service de police de la ville de New York (NYPD) enquêtent sur des crimes de nature sexuelle. Alors que les autres émissions de la franchise de \"La loi et l\'ordre\" se sont largement concentrées sur les cas de meurtres, les inspecteurs de la division des Crimes sexuels (SVU) ont souvent affaire à des crimes, tel le viol, auquel la victime survit et elle aide les autorités lors de l\'enquête.', 1, 'https://image.tmdb.org/t/p/w500/95flTYCxEPNFSdZVrHy9nMIeLbw.jpg', 7.94, 1999, 1, 'New York Unité Spéciale'),
(8, '', 1, 'https://image.tmdb.org/t/p/w500/fTBC5EpsgKmli9VQcJMtqQ08Qj4.jpg', 6.338, 1993, 1, 'Late Show with David Letterman'),
(9, 'L\'acteur d\'improvisation et comique Stephen Colbert laisse derrière lui son personnage \"The Colbert Report\" alors qu\'il fait son retour tant attendu à la télévision. En tant qu\'hôte de la franchise The Late Show redux - enregistrée au théâtre historique Ed Sullivan à New York - Colbert parle pour la première fois aux acteurs, aux athlètes, aux politiciens, aux bandes dessinées, aux artistes et aux musiciens. Les fans fidèles, cependant, seront également traités avec cohérence car Colbert reste soutenu par de nombreux membres de son équipe d\'écriture et numérique de son ancienne entreprise. Jon Batiste, formé à Julliard, est le chef d\'orchestre.', 1, 'https://image.tmdb.org/t/p/w500/9jkThAGYj2yp8jsS6Nriy5mzKFT.jpg', 6.356, 2015, 1, 'The Late Show with Stephen Colbert'),
(10, '', 1, 'https://image.tmdb.org/t/p/w500/rw0QaegwgKbRoB2CZe2lfewltT9.jpg', 5.317, 2014, 1, 'Late Night with Seth Meyers'),
(11, 'Plus belle la vie met en scène, jour après jour, le quotidien des habitants d’un quartier imaginaire de Marseille : le Mistral. Il y a des familles aisées comme les Chaumette ou les Frémont, ainsi que des familles plus modestes comme les Marci ou les Torres. Le feuilleton s’organise autour de deux principaux types d’intrigue : La vie personnelle des habitants du Mistral, avec leurs joies et tracas quotidiens, l’évolution des amours et des amitiés. Des intrigues criminelles dans lesquelles sont impliqués certains habitants du Mistral.', 1, 'https://image.tmdb.org/t/p/w500/jmU8HlTDn87xmRqXagcL2swDr8I.jpg', 4.2, 2004, 1, 'Plus belle la vie'),
(12, '', 1, 'https://image.tmdb.org/t/p/w500/paRFRd11WlFOxVbGnzjjCBym7FW.jpg', 7.455, 1964, 1, 'Match of the Day'),
(13, 'Trevor Noah et l\'équipe de la plus fausse information au monde abordent les plus grandes histoires de l\'actualité, de la politique et de la culture pop.', 1, 'https://image.tmdb.org/t/p/w500/np5l5SGS990ZV6FcP9CCRPq3hSe.jpg', 6.4, 1996, 1, 'Le Daily Show'),
(14, '', 1, 'https://image.tmdb.org/t/p/w500/kBBbSgNchtMvsgD6z1oI1RRluHP.jpg', 3.25, 1998, 1, 'Barátok közt'),
(15, '', 1, 'https://image.tmdb.org/t/p/w500/jjfTTjVYWyD6rGHVbnC44IrsJ7P.jpg', 6.6, 1964, 1, 'Top of the Pops'),
(16, '', 1, 'https://image.tmdb.org/t/p/w500/p1oXgtJ0q0wAcEp3tHA5DpiynxL.jpg', 5.083, 1990, 1, 'Goede Tijden, Slechte Tijden'),
(17, '', 1, 'https://image.tmdb.org/t/p/w500/25v6iDGmIpyG3zndfYdt4KfQgQ9.jpg', 6, 2001, 1, 'CentoVetrine'),
(18, '', 1, 'https://image.tmdb.org/t/p/w500/qPmVoG8G9tc1nN8ZwGV2zYcknit.jpg', 5.283, 2015, 1, 'The Late Late Show with James Corden'),
(19, '', 1, 'https://image.tmdb.org/t/p/w500/xQ83cJA8AxoQMZe8ADApWrRZB1v.jpg', 5.3, 2000, 1, 'El Cor de la Ciutat'),
(20, 'Ce feuilleton reprend les classiques des soap operas, mêlant affaires de cœur, luttes pour le pouvoir, trahisons et scandales. Il voit se télescoper les vies de membres de plusieurs familles, qu\'elles soient issues de la haute-bourgeoisie, des milieux de la finance ou encore de la classe moyenne (une partie d\'entre eux travaillant pour la firme Walco, une société de production de voitures dirigée par la famille Edwards).', 1, 'https://image.tmdb.org/t/p/w500/5X0SWyNJ5IjN9YSXlbHBOVMzh1G.jpg', 6.8, 1992, 1, 'Egoli: Place of Gold');

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `number_of_seasons` int(11) DEFAULT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `tmdb_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `series`
--

INSERT INTO `series` (`id`, `description`, `director`, `number_of_seasons`, `poster_url`, `rating`, `release_year`, `title`, `tmdb_id`) VALUES
(39, 'The Tonight Show Starring Johnny Carson is a talk show hosted by Johnny Carson under The Tonight Show franchise from 1962 to 1992. It originally aired during late-night. For its first ten years, Carson\'s Tonight Show was based in New York City with occasional trips to Burbank, California; in May 1972, the show moved permanently to Burbank, California. In 2002, The Tonight Show Starring Johnny Carson was ranked #12 on TV Guide\'s 50 Greatest TV Shows of All Time.', NULL, 0, 'https://image.tmdb.org/t/p/w500/uSvET5YUvHNDIeoCpErrbSmasFb.jpg', 7.463, 1962, 'The Tonight Show Starring Johnny Carson', 2261),
(40, 'Gute Zeiten, schlechte Zeiten is a long-running German television soap opera, first broadcast on RTL in 1992. The programme concerns the lives of a fictional neighborhood in Germany\'s capital city Berlin. Over the years the soap opera tends to have an overhaul of young people in their late teens and early twenties; targeting a young viewership.', NULL, 0, 'https://image.tmdb.org/t/p/w500/qujVFLAlBnPU9mZElV4NZgL8iXT.jpg', 5.7, 1992, 'Gute Zeiten, schlechte Zeiten', 13945),
(41, 'The Late Late Show with Craig Ferguson is an American late-night talk show hosted by Scottish American comedian Craig Ferguson, who is the third regular host of the Late Late Show franchise. It follows Late Show with David Letterman in the CBS late-night lineup, airing weekdays in the US at 12:37 a.m. It is taped in front of a live studio audience from Monday to Friday at CBS Television City in Los Angeles, California, directly above the Bob Barker Studio. It is produced by David Letterman\'s production company Worldwide Pants Incorporated and CBS Television Studios.\n\nSince becoming host on January 3, 2005, after Craig Kilborn and Tom Snyder, Ferguson has achieved the highest ratings since the show\'s inception in 1995. While the majority of the episodes focus on comedy, Ferguson has also addressed difficult subject matter, such as the deaths of his parents, and undertaken serious interviews, such as one with Desmond Tutu, which earned the show a 2009 Peabody Award.', NULL, 0, 'https://image.tmdb.org/t/p/w500/gGC7zSDgG0FY0MbM1pjfhTCWQBI.jpg', 6.832, 2005, 'The Late Late Show with Craig Ferguson', 14981),
(42, 'Bravo network executive Andy Cohen discusses pop culture topics with celebrities and reality show personalities.', NULL, 0, 'https://image.tmdb.org/t/p/w500/onSD9UXfJwrMXWhq7UY7hGF2S1h.jpg', 5.103, 2009, 'Watch What Happens Live with Andy Cohen', 22980),
(43, 'These are the stories of relationships taking place in the fictional five-star hotel Fürstenhof, located in Feldkirchen-Westerham near Rosenheim with the plot revolving around members of the family room area, the hotel owners, and employees.', NULL, 0, 'https://image.tmdb.org/t/p/w500/jfFNydakwvbeACEwSd2Gh8UWtba.jpg', 6.066, 2005, 'Sturm der Liebe', 45789),
(44, 'In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.', NULL, 0, 'https://image.tmdb.org/t/p/w500/abWOCrIo7bbAORxcQyOFNJdnnmR.jpg', 7.938, 1999, 'Law & Order: Special Victims Unit', 2734),
(45, 'Stephen Colbert brings his signature satire and comedy to The Late Show with Stephen Colbert, the #1 show in late night, where he talks with an eclectic mix of guests about what is new and relevant in the worlds of politics, entertainment, business, music, technology, and more. Featuring bandleader Jon Batiste with his band Stay Human, the Emmy Award-nominated show is broadcast from the historic Ed Sullivan Theater. Stephen Colbert, Chris Licht, Tom Purcell, and Jon Stewart are executive producers. Barry Julien and Denise Rehrig serve as co-executive producers.must watch', NULL, 0, 'https://image.tmdb.org/t/p/w500/9jkThAGYj2yp8jsS6Nriy5mzKFT.jpg', 6.356, 2015, 'The Late Show with Stephen Colbert', 63770),
(46, 'Alles was zählt is a German television soap opera first broadcast on RTL on September 4, 2006. The original plot revolved around Diana Sommer\'s dream to become a world class ice skater. She fell in love with Julian Herzog, who signed her at the prestigious Steinkamp Sport and Wellness Center, run by the unscrupulous Steinkamp dynasty. Diana and Julian eventually became a couple, but in November 2007, Julian suffered a brain hemorrhage and died during their wedding. Diana remained in Essen until January 2009, when she left to join a skating centre in Halle. The story continues to revolve around the Steinkamp Sport and Wellness Centre and its quest to become a sporting powerhouse, as well as the lives of the characters who work at and around the Centre.', NULL, 0, 'https://image.tmdb.org/t/p/w500/zExwkyO7exxrMVrpOkDvK0BTelW.jpg', 5, 2006, 'Alles was zählt', 14686),
(47, 'The daily lives of the inhabitants of \"le Mistral\", an imaginary neighbourhood in the Mediterranean port city of Marseille, where wealthy families cross paths with the less than rich.', NULL, 0, 'https://image.tmdb.org/t/p/w500/jmU8HlTDn87xmRqXagcL2swDr8I.jpg', 4.2, 2004, 'Plus belle la vie', 8590),
(48, 'Seth Meyers, who is \"Saturday Night Live’s\" longest serving anchor on the show’s wildly popular \"Weekend Update,\" takes over as host of NBC’s \"Late Night\" — home to A-list celebrity guests, memorable comedy and the best in musical talent. As the Emmy Award-winning head writer for \"SNL,\" Meyers has established a reputation for sharp wit and perfectly timed comedy, and has gained fame for his spot-on jokes and satire. Meyers takes his departure from \"SNL\" to his new post at \"Late Night,\" as Jimmy Fallon moves to \"The Tonight Show\".', NULL, 0, 'https://image.tmdb.org/t/p/w500/rw0QaegwgKbRoB2CZe2lfewltT9.jpg', 5.317, 2014, 'Late Night with Seth Meyers', 61818),
(49, 'BBC\'s football highlights and analysis.\n\n\"The longest-running football television programme in the world\" as recognised by Guinness World Records in 2015.', NULL, 0, 'https://image.tmdb.org/t/p/w500/paRFRd11WlFOxVbGnzjjCBym7FW.jpg', 7.455, 1964, 'Match of the Day', 224),
(50, 'The World\'s Fakest News Team tackle the biggest stories in news, politics and pop culture.', NULL, 0, 'https://image.tmdb.org/t/p/w500/ixcfyK7it6FjRM36Te4OdblAq4X.jpg', 6.4, 1996, 'The Daily Show', 2224),
(51, 'Goede tijden, slechte tijden, also known as GTST, is the longest-running Dutch soap opera,  revolving around the lives of the families Alberts, Sanders, De Jong, Van Houten and Bouwhuis. It all takes place in the fictional town of Meerdijk.', NULL, 0, 'https://image.tmdb.org/t/p/w500/p1oXgtJ0q0wAcEp3tHA5DpiynxL.jpg', 5.083, 1990, 'Goede Tijden, Slechte Tijden', 11890),
(52, 'Miklós introduces viewers into the world of Money and Charm.', NULL, 0, 'https://image.tmdb.org/t/p/w500/kBBbSgNchtMvsgD6z1oI1RRluHP.jpg', 3.25, 1998, 'Among Friends', 50821),
(53, 'The biggest stars, the most iconic performances, the most outrageous outfits – it’s Britain’s number one pop show.', NULL, 0, 'https://image.tmdb.org/t/p/w500/jjfTTjVYWyD6rGHVbnC44IrsJ7P.jpg', 6.6, 1964, 'Top of the Pops', 1636),
(54, 'Once Craig Ferguson retires, James Corden will be taking over The Late Late Show. The show is a late night talk show that interviews celebrities and has its own bits. And of course, it\'s all hosted by James Corden.', NULL, 0, 'https://image.tmdb.org/t/p/w500/qPmVoG8G9tc1nN8ZwGV2zYcknit.jpg', 5.283, 2015, 'The Late Late Show with James Corden', 62223),
(55, 'El cor de la ciutat is a TVC television soap opera first broadcast on TV3 on 11 September 2000 and last broadcast on 23 December 2009. The show is the most watched fiction program in Catalonia, Spain, especially among female audiences, drawing around 28-33% of the audience with as much as 40% during season finales. El cor de la ciutat follows the lives of the people who live and work in the neighbourhood of Sants and Sant Andreu in Barcelona, Catalonia, Spain.', NULL, 0, 'https://image.tmdb.org/t/p/w500/xQ83cJA8AxoQMZe8ADApWrRZB1v.jpg', 5.3, 2000, 'El Cor de la Ciutat', 14743),
(56, 'A South African television soap opera created by Franz Marx which revolves around the daily ups, downs, trials and tribulations of a handful of families in and around Johannesburg (which is often referred to as eGoli - the City of Gold)', NULL, 0, 'https://image.tmdb.org/t/p/w500/5X0SWyNJ5IjN9YSXlbHBOVMzh1G.jpg', 6.8, 1992, 'Egoli: Place of Gold', 12415),
(57, 'The series tells the stories of some of the characters who work or are related to an imaginary shopping center Centovetrine, located in the center of Turin. There are many stories of love and passion, but also struggles for power and dynastic quarrels in the telefilm.', NULL, 0, 'https://image.tmdb.org/t/p/w500/25v6iDGmIpyG3zndfYdt4KfQgQ9.jpg', 6, 2001, 'CentoVetrine', 80318);

-- --------------------------------------------------------

--
-- Structure de la table `serie_actors`
--

CREATE TABLE `serie_actors` (
  `serie_id` bigint(20) NOT NULL,
  `actor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `serie_genres`
--

CREATE TABLE `serie_genres` (
  `serie_id` bigint(20) NOT NULL,
  `genre_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `bio` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `is_admin`, `password`, `profile_picture`, `username`, `admin`, `bio`, `created_at`, `role`) VALUES
(1, 'abdelmoughithaddougui33@gmail.com', 0, '$2a$10$eOztTbHVeAIIhlTQcMeYZea.SCfCkFSsXf2Dw6AouMsjud/2RYqNy', NULL, 'abdou', 0, NULL, '2025-05-17 16:42:19.000000', 'ROLE_USER'),
(2, 'adam@gmail.com', 0, '$2a$10$FVqjFX4wba2474Kh/KOMA.UgnGWkxSRQokFycHk03SFuo/ZBDQ0Xa', NULL, 'adam', 0, NULL, '2025-05-17 17:45:39.000000', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Structure de la table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `user_id` bigint(20) NOT NULL,
  `movie_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_favorites`
--

INSERT INTO `user_favorites` (`user_id`, `movie_id`) VALUES
(1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `user_favorite_series`
--

CREATE TABLE `user_favorite_series` (
  `user_id` bigint(20) NOT NULL,
  `serie_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_watchlist`
--

CREATE TABLE `user_watchlist` (
  `user_id` bigint(20) NOT NULL,
  `movie_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_watchlist`
--

INSERT INTO `user_watchlist` (`user_id`, `movie_id`) VALUES
(1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `user_watchlist_series`
--

CREATE TABLE `user_watchlist_series` (
  `user_id` bigint(20) NOT NULL,
  `serie_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `watch_history`
--

CREATE TABLE `watch_history` (
  `id` bigint(20) NOT NULL,
  `completed` bit(1) NOT NULL,
  `watch_date` datetime(6) DEFAULT NULL,
  `watch_duration` int(11) NOT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `watched_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD KEY `FK7svt4y6p0f9gpjy10awtubp02` (`actor_id`),
  ADD KEY `FKs4rlt03tdf55rwso4uyrwm0oq` (`movie_id`);

--
-- Index pour la table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD KEY `FKnfpjuak0xiqpca3gjkwrixiig` (`genre_id`),
  ADD KEY `FK4ak9svw913jblkfgru84h2phd` (`movie_id`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `serie_actors`
--
ALTER TABLE `serie_actors`
  ADD KEY `FKb7t7ucuuf2pxthhmyjmignwyf` (`actor_id`),
  ADD KEY `FK8293gex24fmhdaxwkuegkja46` (`serie_id`);

--
-- Index pour la table `serie_genres`
--
ALTER TABLE `serie_genres`
  ADD KEY `FKpsyfj1wfvcqyv23l4350pb8bd` (`genre_id`),
  ADD KEY `FKbmbuq5q0sbaf03p9nhjbl3pq7` (`serie_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD KEY `FK3l2uqa9fo6j939hx5ykad2bml` (`movie_id`),
  ADD KEY `FK4sv7b9w9adr0fjnc4u10exlwm` (`user_id`);

--
-- Index pour la table `user_favorite_series`
--
ALTER TABLE `user_favorite_series`
  ADD PRIMARY KEY (`user_id`,`serie_id`),
  ADD KEY `FKhtyggmh8mmw2ydfncp1pm7ajy` (`serie_id`);

--
-- Index pour la table `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD PRIMARY KEY (`user_id`,`movie_id`),
  ADD KEY `FK9fhbuf2rh3u2d0citgjx86id9` (`movie_id`);

--
-- Index pour la table `user_watchlist_series`
--
ALTER TABLE `user_watchlist_series`
  ADD PRIMARY KEY (`user_id`,`serie_id`),
  ADD KEY `FKitdjfv1sneyoklpesi678pj9j` (`serie_id`);

--
-- Index pour la table `watch_history`
--
ALTER TABLE `watch_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKljm7n7ewhqhwbvt1xxxrimf31` (`movie_id`),
  ADD KEY `FK4j0idttsyu50cca3be2o3m2a5` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=774;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `series`
--
ALTER TABLE `series`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `watch_history`
--
ALTER TABLE `watch_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD CONSTRAINT `FK7svt4y6p0f9gpjy10awtubp02` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  ADD CONSTRAINT `FKs4rlt03tdf55rwso4uyrwm0oq` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Contraintes pour la table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `FK4ak9svw913jblkfgru84h2phd` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `FKnfpjuak0xiqpca3gjkwrixiig` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Contraintes pour la table `serie_actors`
--
ALTER TABLE `serie_actors`
  ADD CONSTRAINT `FK21pr7liorkv89f97aoem07fmf` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`),
  ADD CONSTRAINT `FK8293gex24fmhdaxwkuegkja46` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`),
  ADD CONSTRAINT `FKb7t7ucuuf2pxthhmyjmignwyf` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`);

--
-- Contraintes pour la table `serie_genres`
--
ALTER TABLE `serie_genres`
  ADD CONSTRAINT `FKbmbuq5q0sbaf03p9nhjbl3pq7` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`),
  ADD CONSTRAINT `FKep48kgkgafw6ruvqkcqw82s1h` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`),
  ADD CONSTRAINT `FKpsyfj1wfvcqyv23l4350pb8bd` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Contraintes pour la table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `FK3l2uqa9fo6j939hx5ykad2bml` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `FK4sv7b9w9adr0fjnc4u10exlwm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `user_favorite_series`
--
ALTER TABLE `user_favorite_series`
  ADD CONSTRAINT `FKfwyneh8eisadodiidva662qsm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKhtyggmh8mmw2ydfncp1pm7ajy` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`);

--
-- Contraintes pour la table `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD CONSTRAINT `FK1a2sf5ha20f8a3sqgo3n4h3w6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK9fhbuf2rh3u2d0citgjx86id9` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Contraintes pour la table `user_watchlist_series`
--
ALTER TABLE `user_watchlist_series`
  ADD CONSTRAINT `FKitdjfv1sneyoklpesi678pj9j` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`),
  ADD CONSTRAINT `FKluuvunuptepkew06k5x8o3rg1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `watch_history`
--
ALTER TABLE `watch_history`
  ADD CONSTRAINT `FK4j0idttsyu50cca3be2o3m2a5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKljm7n7ewhqhwbvt1xxxrimf31` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
