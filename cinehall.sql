-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 mars 2023 à 22:52
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinehall`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ref` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` date NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ref` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ref`, `username`, `email`, `created`) VALUES
('6ac5c139', 'asiyya', 'asiyya@gamil.com', '2023-03-14'),
('c5f2b585', 'Frank Deveone', 'frank@gmail.com', '2023-03-12');

-- --------------------------------------------------------

--
-- Structure de la table `halls`
--

CREATE TABLE `halls` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hall_number` int(11) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `halls`
--

INSERT INTO `halls` (`id`, `name`, `hall_number`, `seats`) VALUES
(1, 'Elite Hall', 1, 0),
(2, 'Drama Hall', 2, 0),
(3, 'Green Hall', 3, 0),
(4, 'Action Hall', 4, 0),
(5, 'Adventure', 5, 0),
(6, 'Hall of Future', 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` text NOT NULL,
  `rating` float NOT NULL,
  `year` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `trailer` text NOT NULL,
  `genre` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `writers` varchar(255) NOT NULL,
  `imdbid` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `rank`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date`) VALUES
(99, 1, 'The Shawshank Redemption', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 9, '1994', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://www.youtube.com/embed/NmzuHjWmXOc', 'Drama', 'Frank Darabont', 'Stephen King (based on the short novel \"Rita Hayworth and the Shawshank Redemption\" by)', 'tt0111161', '2023-03-20'),
(281794, 2, 'The Godfather', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg', 9, '1972', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR8,0,380,562_.jpg', 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', 'https://www.youtube.com/embed/rqGJyUB1Q3s', 'Crime', 'Francis Ford Coppola', 'Mario Puzo (screenplay by)', 'tt0068646', '2023-04-05'),
(281795, 3, 'The Dark Knight', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX67_CR0,0,67,98_AL_.jpg', 9, '2008', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'https://www.youtube.com/embed/EXeTwQWrcwY', 'Action', 'Christopher Nolan', 'Jonathan Nolan (screenplay)', 'tt0468569', '2023-03-13'),
(281796, 4, 'The Godfather Part II', 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg', 9, '1974', 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR7,0,380,562_.jpg', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 'https://www.youtube.com/embed/9O1Iy9od7-A', 'Crime', 'Francis Ford Coppola', 'Francis Ford Coppola (screenplay by)', 'tt0071562', '2022-04-04'),
(281797, 5, '12 Angry Men', 'https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX45_CR0,0,45,67_AL_.jpg', 9, '1957', 'https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_QL75_UX380_CR0,11,380,562_.jpg', 'The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.', 'https://www.youtube.com/embed/TEN-2uTi2c0', 'Crime', 'Sidney Lumet', 'Reginald Rose (teleplay \"Twelve Angry Men\")', 'tt0050083', '2023-03-25'),
(281798, 6, 'Schindler\'s List', 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1993', 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'https://www.youtube.com/embed/gG22XNhtnoY', 'Biography', 'Steven Spielberg', 'Thomas Keneally (book)', 'tt0108052', '2023-04-15'),
(281799, 7, 'The Lord of the Rings: The Return of the King', 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2003', 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'https://www.youtube.com/embed/y2rYRu8UW8M', 'Action', 'Peter Jackson', 'J.R.R. Tolkien (novel \"The Return of the King\")', 'tt0167260', '2023-04-25'),
(281800, 8, 'Pulp Fiction', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1994', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR3,0,380,562_.jpg', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://www.youtube.com/embed/5ZAhzsi1ybM', 'Crime', 'Quentin Tarantino', 'Quentin Tarantino (stories by)', 'tt0110912', '2023-03-14'),
(281801, 9, 'The Lord of the Rings: The Fellowship of the Ring', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2001', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'https://www.youtube.com/embed/_e8QGuG50ro', 'Action', 'Peter Jackson', 'J.R.R. Tolkien (novel \"The Fellowship of the Ring\")', 'tt0120737', '2023-03-15'),
(281802, 10, 'The Good, the Bad and the Ugly', 'https://m.media-amazon.com/images/M/MV5BNjJlYmNkZGItM2NhYy00MjlmLTk5NmQtNjg1NmM2ODU4OTMwXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1966', 'https://m.media-amazon.com/images/M/MV5BNjJlYmNkZGItM2NhYy00MjlmLTk5NmQtNjg1NmM2ODU4OTMwXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'https://www.youtube.com/embed/WCN5JJY_wiA', 'Adventure', 'Sergio Leone', 'Luciano Vincenzoni (story)', 'tt0060196', '2023-03-11'),
(281803, 11, 'Forrest Gump', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1994', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UY562_CR4,0,380,562_.jpg', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'https://www.youtube.com/embed/bLvqoHBptjg', 'Drama', 'Robert Zemeckis', 'Winston Groom (novel)', 'tt0109830', '2023-03-12'),
(281804, 12, 'Fight Club', 'https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1999', 'https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', 'https://www.youtube.com/embed/qtRKdVHc-cE', 'Drama', 'David Fincher', 'Chuck Palahniuk (based on the novel by)', 'tt0137523', '2023-03-13'),
(281805, 13, 'Inception', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2010', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.', 'https://www.youtube.com/embed/YoHD9XEInc0', 'Action', 'Christopher Nolan', 'Christopher Nolan', 'tt1375666', '2023-03-16'),
(281806, 14, 'The Lord of the Rings: The Two Towers', 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '2002', 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,14,380,562_.jpg', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.', 'https://www.youtube.com/embed/hYcw5ksV8YQ', 'Action', 'Peter Jackson', 'J.R.R. Tolkien (novel \"The Two Towers\")', 'tt0167261', '2023-03-17'),
(281807, 15, 'Star Wars: Episode V - The Empire Strikes Back', 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1980', 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,15,380,562_.jpg', 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.', 'https://www.youtube.com/embed/JNwNXF9Y6kY', 'Action', 'Irvin Kershner', 'Leigh Brackett (screenplay by)', 'tt0080684', '2023-03-18'),
(281808, 16, 'The Matrix', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1999', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', 'https://www.youtube.com/embed/vKQi3bBA1y8', 'Action', 'Lana Wachowski', 'Lilly Wachowski', 'tt0133093', '2023-03-19'),
(281809, 17, 'Goodfellas', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1990', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,3,380,562_.jpg', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 'https://www.youtube.com/embed/2ilzidi_J8Q', 'Biography', 'Martin Scorsese', 'Nicholas Pileggi (book \"Wiseguy\")', 'tt0099685', '2023-03-20'),
(281810, 18, 'One Flew Over the Cuckoo\'s Nest', 'https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1975', 'https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'In the Fall of 1963, a Korean War veteran and criminal pleads insanity and is admitted to a mental institution, where he rallies up the scared patients against the tyrannical nurse.', 'https://www.youtube.com/embed/OXrcDonY-B8', 'Drama', 'Milos Forman', 'Lawrence Hauben (screenplay)', 'tt0073486', '2023-03-21'),
(281811, 19, 'Se7en', 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1995', 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,16,380,562_.jpg', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 'https://www.youtube.com/embed/znmZoVkCjpI', 'Crime', 'David Fincher', 'Andrew Kevin Walker', 'tt0114369', '2023-03-22'),
(281812, 20, 'Seven Samurai', 'https://m.media-amazon.com/images/M/MV5BNWQ3OTM4ZGItMWEwZi00MjI5LWI3YzgtNTYwNWRkNmIzMGI5XkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '1954', 'https://m.media-amazon.com/images/M/MV5BNWQ3OTM4ZGItMWEwZi00MjI5LWI3YzgtNTYwNWRkNmIzMGI5XkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_QL75_UY562_CR11,0,380,562_.jpg', 'Farmers from a village exploited by bandits hire a veteran samurai for protection, who gathers six other samurai to join him. As the samurai teach the peasants how to defend themselves, the village is attacked by an army of bandits.', 'https://www.youtube.com/embed/wJ1TOratCTo', 'Action', 'Akira Kurosawa', 'Akira Kurosawa (screenplay by)', 'tt0047478', '2023-03-23'),
(281813, 21, 'It\'s a Wonderful Life', 'https://m.media-amazon.com/images/M/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1946', 'https://m.media-amazon.com/images/M/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU@._V1_QL75_UY562_CR3,0,380,562_.jpg', 'An angel is sent from Heaven to help a desperately frustrated businessman by showing him what life would have been like if he had never existed.', 'https://www.youtube.com/embed/iLR3gZrU2Xo', 'Drama', 'Frank Capra', 'Frances Goodrich (screenplay by)', 'tt0038650', '2023-03-24'),
(281814, 22, 'The Silence of the Lambs', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1991', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UY562_CR1,0,380,562_.jpg', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 'https://www.youtube.com/embed/W6Mm8Sbe__o', 'Crime', 'Jonathan Demme', 'Thomas Harris (based on the novel by)', 'tt0102926', '2023-03-25'),
(281815, 23, 'City of God', 'https://m.media-amazon.com/images/M/MV5BOTMwYjc5ZmItYTFjZC00ZGQ3LTlkNTMtMjZiNTZlMWQzNzI5XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '2002', 'https://m.media-amazon.com/images/M/MV5BOTMwYjc5ZmItYTFjZC00ZGQ3LTlkNTMtMjZiNTZlMWQzNzI5XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,2,380,562_.jpg', 'In the slums of Rio, two kids\' paths diverge as one struggles to become a photographer and the other a kingpin.', 'https://www.youtube.com/embed/dcUOO4Itgmw', 'Crime', 'Fernando Meirelles', 'Paulo Lins (novel)', 'tt0317248', '2023-03-28'),
(281816, 24, 'Saving Private Ryan', 'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1998', 'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_QL75_UY562_CR1,0,380,562_.jpg', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', 'https://www.youtube.com/embed/9CiW_DgxCnQ', 'Drama', 'Steven Spielberg', 'Robert Rodat', 'tt0120815', '2023-03-27'),
(281817, 25, 'Life Is Beautiful', 'https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1997', 'https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,2,380,562_.jpg', 'When an open-minded Jewish waiter and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.', 'https://www.youtube.com/embed/pAYEQP8gx3w', 'Comedy', 'Roberto Benigni', 'Vincenzo Cerami (story by)', 'tt0118799', '2023-04-01'),
(281818, 26, 'Interstellar', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2014', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 'https://www.youtube.com/embed/4T4wxDnTYLg', 'Adventure', 'Christopher Nolan', 'Jonathan Nolan', 'tt0816692', '2023-02-25'),
(281819, 27, 'The Green Mile', 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1999', 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_QL75_UX380_CR0,0,380,562_.jpg', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 'https://www.youtube.com/embed/Ki4haFrqSrw', 'Crime', 'Frank Darabont', 'Stephen King (novel)', 'tt0120689', '2023-02-25'),
(281820, 28, 'Star Wars: Episode IV - A New Hope', 'https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1977', 'https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_QL75_UX380_CR0,9,380,562_.jpg', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', 'https://www.youtube.com/embed/L-_xHEv0l-w', 'Action', 'George Lucas', 'George Lucas', 'tt0076759', '2023-02-25'),
(281821, 29, 'Terminator 2: Judgment Day', 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1991', 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten-year-old son John from a more advanced and powerful cyborg.', 'https://www.youtube.com/embed/CRRlbK5w8AE', 'Action', 'James Cameron', 'James Cameron', 'tt0103064', '2023-02-25'),
(281822, 30, 'Back to the Future', 'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1985', 'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,14,380,562_.jpg', 'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.', 'https://www.youtube.com/embed/qvsgGtivCgs', 'Adventure', 'Robert Zemeckis', 'Robert Zemeckis', 'tt0088763', '2023-02-25'),
(281823, 31, 'Spirited Away', 'https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2001', 'https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 'https://www.youtube.com/embed/ByXuk9QqQkk', 'Animation', 'Hayao Miyazaki', 'Hayao Miyazaki', 'tt0245429', '2023-02-25'),
(281824, 32, 'Psycho', 'https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1960', 'https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'A Phoenix secretary embezzles $40,000 from her employer\'s client, goes on the run and checks into a remote motel run by a young man under the domination of his mother.', 'https://www.youtube.com/embed/DTJQfFQ40lI', 'Horror', 'Alfred Hitchcock', 'Joseph Stefano (screenplay by)', 'tt0054215', '2023-02-25'),
(281825, 33, 'The Pianist', 'https://m.media-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR2,0,45,67_AL_.jpg', 8, '2002', 'https://m.media-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UY562_CR14,0,380,562_.jpg', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 'https://www.youtube.com/embed/BFwGqLa_oAo', 'Biography', 'Roman Polanski', 'Ronald Harwood (screenplay by)', 'tt0253474', '2023-02-25'),
(281826, 34, 'Parasite', 'https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2019', 'https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 'https://www.youtube.com/embed/5xH0HfJHsaY', 'Drama', 'Bong Joon Ho', 'Bong Joon Ho (story by)', 'tt6751668', '2023-02-25'),
(281827, 35, 'Léon: The Professional', 'https://m.media-amazon.com/images/M/MV5BOTgyMWQ0ZWUtN2Q2MS00NmY0LWI3OWMtNjFkMzZlNDZjNTk0XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1994', 'https://m.media-amazon.com/images/M/MV5BOTgyMWQ0ZWUtN2Q2MS00NmY0LWI3OWMtNjFkMzZlNDZjNTk0XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,2,380,562_.jpg', '12-year-old Mathilda is reluctantly taken in by Léon, a professional assassin, after her family is murdered. An unusual relationship forms as she becomes his protégée and learns the assassin\'s trade.', 'https://www.youtube.com/embed/jawVxq1Iyl0', 'Action', 'Luc Besson', 'Luc Besson', 'tt0110413', '2023-02-25'),
(281828, 36, 'The Lion King', 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1994', 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 'https://www.youtube.com/embed/eHcZlPpNt0Q', 'Animation', 'Roger Allers', 'Irene Mecchi (screenplay by)', 'tt0110357', '2023-02-25'),
(281829, 37, 'Gladiator', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1994', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'https://www.youtube.com/embed/uvbavW31adA', 'Action', 'Ridley Scott', 'David Franzoni (story)', 'tt0172495', '2023-02-25'),
(281830, 38, 'American History X', 'https://m.media-amazon.com/images/M/MV5BZTJhN2FkYWEtMGI0My00YWM4LWI2MjAtM2UwNjY4MTI2ZTQyXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2000', 'https://m.media-amazon.com/images/M/MV5BZTJhN2FkYWEtMGI0My00YWM4LWI2MjAtM2UwNjY4MTI2ZTQyXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.', 'https://www.youtube.com/embed/XfQYHqsiN5g', 'Crime', 'Tony Kaye', 'David McKenna', 'tt0120586', '2023-02-25'),
(281831, 39, 'The Departed', 'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1998', 'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_QL75_UY562_CR0,0,380,562_.jpg', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 'https://www.youtube.com/embed/iojhqm0JTW4', 'Crime', 'Martin Scorsese', 'William Monahan (screenplay)', 'tt0407887', '2023-02-25'),
(281832, 40, 'The Usual Suspects', 'https://m.media-amazon.com/images/M/MV5BYTViNjMyNmUtNDFkNC00ZDRlLThmMDUtZDU2YWE4NGI2ZjVmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1995', 'https://m.media-amazon.com/images/M/MV5BYTViNjMyNmUtNDFkNC00ZDRlLThmMDUtZDU2YWE4NGI2ZjVmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,2,380,562_.jpg', 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.', 'https://www.youtube.com/embed/Q0eCiCinc4E', 'Crime', 'Bryan Singer', 'Christopher McQuarrie', 'tt0114814', '2023-02-25'),
(281833, 41, 'The Prestige', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2006', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', 'https://www.youtube.com/embed/RLtaA9fFNXU', 'Drama', 'Christopher Nolan', 'Jonathan Nolan (screenplay)', 'tt0482571', '2023-02-25'),
(281834, 42, 'Whiplash', 'https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2014', 'https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 'https://www.youtube.com/embed/7d_jQycdQGo', 'Drama', 'Damien Chazelle', 'Damien Chazelle', 'tt2582802', '2023-02-25'),
(281835, 43, 'Casablanca', 'https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1942', 'https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_QL75_UX380_CR0,5,380,562_.jpg', 'A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her fugitive husband escape the Nazis in French Morocco.', 'https://www.youtube.com/embed/BkL9l7qovsE', 'Drama', 'Michael Curtiz', 'Julius J. Epstein (screenplay)', 'tt0034583', '2023-02-25'),
(281836, 44, 'The Intouchables', 'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2011', 'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', 'https://www.youtube.com/embed/oK5hMNxqsFA', 'Biography', 'Olivier Nakache', 'Olivier Nakache', 'tt1675434', '2023-02-25'),
(281837, 45, 'Harakiri', 'https://m.media-amazon.com/images/M/MV5BYjBmYTQ1NjItZWU5MS00YjI0LTg2OTYtYmFkN2JkMmNiNWVkXkEyXkFqcGdeQXVyMTMxMTY0OTQ@._V1_UY67_CR2,0,45,67_AL_.jpg', 8, '1962', 'https://m.media-amazon.com/images/M/MV5BYjBmYTQ1NjItZWU5MS00YjI0LTg2OTYtYmFkN2JkMmNiNWVkXkEyXkFqcGdeQXVyMTMxMTY0OTQ@._V1_QL75_UY562_CR17,0,380,562_.jpg', 'When a ronin requesting seppuku at a feudal lord\'s palace is told of the brutal suicide of another ronin who previously visited, he reveals how their pasts are intertwined - and in doing so challenges the clan\'s integrity.', 'https://www.youtube.com/embed/gfABwM-Ppng', 'Action', 'Masaki Kobayashi', 'Yasuhiko Takiguchi (novel \"Ibun rônin ki\")', 'tt0056058', '2023-02-25'),
(281838, 46, 'Grave of the Fireflies', 'https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1988', 'https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'A young boy and his little sister struggle to survive in Japan during World War II.', 'https://www.youtube.com/embed/4vPeTSRd580', 'Animation', 'Isao Takahata', 'Akiyuki Nosaka (novel)', 'tt0095327', '2023-02-25'),
(281839, 47, 'Modern Times', 'https://m.media-amazon.com/images/M/MV5BYjJiZjMzYzktNjU0NS00OTkxLWEwYzItYzdhYWJjN2QzMTRlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1936', 'https://m.media-amazon.com/images/M/MV5BYjJiZjMzYzktNjU0NS00OTkxLWEwYzItYzdhYWJjN2QzMTRlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,15,380,562_.jpg', 'The Tramp struggles to live in modern industrial society with the help of a young homeless woman.', 'https://www.youtube.com/embed/GLeDdzGUTq0', 'Comedy', 'Charles Chaplin', 'Charles Chaplin', 'tt0027977', '2023-02-25'),
(281840, 48, 'Once Upon a Time in the West', 'https://m.media-amazon.com/images/M/MV5BODQ3NDExOGYtMzI3Mi00NWRlLTkwNjAtNjc4MDgzZGJiZTA1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1968', 'https://m.media-amazon.com/images/M/MV5BODQ3NDExOGYtMzI3Mi00NWRlLTkwNjAtNjc4MDgzZGJiZTA1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,3,380,562_.jpg', 'A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.', 'https://www.youtube.com/embed/c8CJ6L0I6W8', 'Western', 'Sergio Leone', 'Sergio Donati (screenplay by)', 'tt0064116', '2023-02-25'),
(281841, 49, 'Rear Window', 'https://m.media-amazon.com/images/M/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1954', 'https://m.media-amazon.com/images/M/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UY562_CR2,0,380,562_.jpg', 'A wheelchair-bound photographer spies on his neighbors from his Greenwich Village courtyard apartment window, and becomes convinced one of them has committed murder, despite the skepticism of his fashion-model girlfriend.', 'https://www.youtube.com/embed/m01YktiEZCw', 'Mystery', 'Alfred Hitchcock', 'John Michael Hayes (screenplay)', 'tt0047396', '2023-02-25'),
(281842, 50, 'Alien', 'https://m.media-amazon.com/images/M/MV5BOGQzZTBjMjQtOTVmMS00NGE5LWEyYmMtOGQ1ZGZjNmRkYjFhXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1979', 'https://m.media-amazon.com/images/M/MV5BOGQzZTBjMjQtOTVmMS00NGE5LWEyYmMtOGQ1ZGZjNmRkYjFhXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,6,380,562_.jpg', 'The crew of a commercial spacecraft encounter a deadly lifeform after investigating an unknown transmission.', 'https://www.youtube.com/embed/jQ5lPt9edzQ', 'Horror', 'Ridley Scott', 'Dan O\'Bannon (screenplay by)', 'tt0078748', '2023-02-25'),
(281843, 51, 'City Lights', 'https://m.media-amazon.com/images/M/MV5BY2I4MmM1N2EtM2YzOS00OWUzLTkzYzctNDc5NDg2N2IyODJmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1931', 'https://m.media-amazon.com/images/M/MV5BY2I4MmM1N2EtM2YzOS00OWUzLTkzYzctNDc5NDg2N2IyODJmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a sightless flower girl accumulates money to be able to help her medically.', 'https://www.youtube.com/embed/7vl7F8S4cpQ', 'Comedy', 'Charles Chaplin', 'Charles Chaplin', 'tt0021749', '2023-02-25'),
(281844, 52, 'Cinema Paradiso', 'https://m.media-amazon.com/images/M/MV5BM2FhYjEyYmYtMDI1Yy00YTdlLWI2NWQtYmEzNzAxOGY1NjY2XkEyXkFqcGdeQXVyNTA3NTIyNDg@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1988', 'https://m.media-amazon.com/images/M/MV5BM2FhYjEyYmYtMDI1Yy00YTdlLWI2NWQtYmEzNzAxOGY1NjY2XkEyXkFqcGdeQXVyNTA3NTIyNDg@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A filmmaker recalls his childhood when falling in love with the pictures at the cinema of his home village and forms a deep friendship with the cinema\'s projectionist.', 'https://www.youtube.com/embed/C2-GX0Tltgw', 'Drama', 'Giuseppe Tornatore', 'Giuseppe Tornatore (story)', 'tt0095765', '2023-02-25'),
(281845, 53, 'Apocalypse Now', 'https://m.media-amazon.com/images/M/MV5BYmQyNTA1ZGItNjZjMi00NzFlLWEzMWEtNWMwN2Q2MjJhYzEyXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1979', 'https://m.media-amazon.com/images/M/MV5BYmQyNTA1ZGItNjZjMi00NzFlLWEzMWEtNWMwN2Q2MjJhYzEyXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,11,380,562_.jpg', 'A U.S. Army officer serving in Vietnam is tasked with assassinating a renegade Special Forces Colonel who sees himself as a god.', 'https://www.youtube.com/embed/FTjG-Aux_yQ', 'Drama', 'Francis Ford Coppola', 'John Milius', 'tt0078788', '2023-02-25'),
(281846, 54, 'Memento', 'https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2000', 'https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UY562_CR2,0,380,562_.jpg', 'A man with short-term memory loss attempts to track down his wife\'s murderer.', 'https://www.youtube.com/embed/4CV41hoyS8A', 'Mystery', 'Christopher Nolan', 'Christopher Nolan (screenplay)', 'tt0209144', '2023-02-25'),
(281847, 55, 'Indiana Jones and the Raiders of the Lost Ark', 'https://m.media-amazon.com/images/M/MV5BNTU2ODkyY2MtMjU1NC00NjE1LWEzYjgtMWQ3MzRhMTE0NDc0XkEyXkFqcGdeQXVyMjM4MzQ4OTQ@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1981', 'https://m.media-amazon.com/images/M/MV5BNTU2ODkyY2MtMjU1NC00NjE1LWEzYjgtMWQ3MzRhMTE0NDc0XkEyXkFqcGdeQXVyMjM4MzQ4OTQ@._V1_QL75_UY562_CR1,0,380,562_.jpg', 'Archaeology professor Indiana Jones ventures to seize a biblical artefact known as the Ark of the Covenant. While doing so, he puts up a fight against Renee and a troop of Nazis.', 'https://www.youtube.com/embed/Rh_BJXG1-44', 'Action', 'Steven Spielberg', 'Lawrence Kasdan (screenplay by)', 'tt0082971', '2023-02-25'),
(281848, 56, 'Django Unchained', 'https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2012', 'https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'With the help of a German bounty-hunter, a freed slave sets out to rescue his wife from a brutal plantation-owner in Mississippi.', 'https://www.youtube.com/embed/0fUCuvNlOCg', 'Drama', 'Quentin Tarantino', 'Quentin Tarantino', 'tt1853728', '2023-02-25'),
(281849, 57, 'WALL·E', 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2008', 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.', 'https://www.youtube.com/embed/CZ1CATNbXg0', 'Animation', 'Andrew Stanton', 'Andrew Stanton (original story by)', 'tt0910970', '2023-02-25'),
(281850, 58, 'The Lives of Others', 'https://m.media-amazon.com/images/M/MV5BNmQyNmJjM2ItNTQzYi00ZjMxLWFjMDYtZjUyN2YwZDk5YWQ2XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '2006', 'https://m.media-amazon.com/images/M/MV5BNmQyNmJjM2ItNTQzYi00ZjMxLWFjMDYtZjUyN2YwZDk5YWQ2XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_QL75_UX380_CR0,3,380,562_.jpg', 'In 1984 East Berlin, an agent of the secret police, conducting surveillance on a writer and his lover, finds himself becoming increasingly absorbed by their lives.', 'https://www.youtube.com/embed/YsShZNHmpGE', 'Drama', 'Florian Henckel von Donnersmarck', 'Florian Henckel von Donnersmarck', 'tt0405094', '2023-02-25'),
(281851, 59, 'Sunset Blvd.', 'https://m.media-amazon.com/images/M/MV5BMTU0NTkyNzYwMF5BMl5BanBnXkFtZTgwMDU0NDk5MTI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1950', 'https://m.media-amazon.com/images/M/MV5BMTU0NTkyNzYwMF5BMl5BanBnXkFtZTgwMDU0NDk5MTI@._V1_QL75_UX380_CR0,5,380,562_.jpg', 'A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.', 'https://www.youtube.com/embed/_dY0SVxnHjQ', 'Drama', 'Billy Wilder', 'Charles Brackett', 'tt0043014', '2023-02-25'),
(281852, 60, 'Paths of Glory', 'https://m.media-amazon.com/images/M/MV5BOTI5Nzc0OTMtYzBkMS00NjkxLThmM2UtNjM2ODgxN2M5NjNkXkEyXkFqcGdeQXVyNjQ2MjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1957', 'https://m.media-amazon.com/images/M/MV5BOTI5Nzc0OTMtYzBkMS00NjkxLThmM2UtNjM2ODgxN2M5NjNkXkEyXkFqcGdeQXVyNjQ2MjQ5NzM@._V1_QL75_UX380_CR0,10,380,562_.jpg', 'After refusing to attack an enemy position, a general accuses the soldiers of cowardice and their commanding officer must defend them.', 'https://www.youtube.com/embed/AV9XLjDbt5A', 'Drama', 'Stanley Kubrick', 'Stanley Kubrick (screenplay)', 'tt0050825', '2023-02-25'),
(281853, 61, 'The Shining', 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1980', 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,8,380,562_.jpg', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 'https://www.youtube.com/embed/FZQvIJxG9Xs', 'Drama', 'Stanley Kubrick', 'Stephen King (based upon the novel by)', 'tt0081505', '2023-02-25'),
(281854, 62, 'The Great Dictator', 'https://m.media-amazon.com/images/M/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1940', 'https://m.media-amazon.com/images/M/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UY562_CR0,0,380,562_.jpg', 'Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel\'s regime.', 'https://www.youtube.com/embed/k8bVG8XC-4I', 'Comedy', 'Charles Chaplin', 'Charles Chaplin', 'tt0032553', '2023-02-25'),
(281855, 63, 'Avengers: Infinity War', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2018', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 'https://www.youtube.com/embed/B65hW9YYY5A', 'Action', 'Anthony Russo', 'Christopher Markus (screenplay by)', 'tt4154756', '2023-02-25'),
(281856, 64, 'Witness for the Prosecution', 'https://m.media-amazon.com/images/M/MV5BNDQwODU5OWYtNDcyNi00MDQ1LThiOGMtZDkwNWJiM2Y3MDg0XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1957', 'https://m.media-amazon.com/images/M/MV5BNDQwODU5OWYtNDcyNi00MDQ1LThiOGMtZDkwNWJiM2Y3MDg0XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_QL75_UX380_CR0,10,380,562_.jpg', 'A veteran British barrister must defend his client in a murder trial that has surprise after surprise.', 'https://www.youtube.com/embed/GMlJfiA2u7Y', 'Crime', 'Billy Wilder', 'Agatha Christie (in Agatha Christie\'s international stage success)', 'tt0051201', '2023-02-25'),
(281857, 65, 'Aliens', 'https://m.media-amazon.com/images/M/MV5BZGU2OGY5ZTYtMWNhYy00NjZiLWI0NjUtZmNhY2JhNDRmODU3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1986', 'https://m.media-amazon.com/images/M/MV5BZGU2OGY5ZTYtMWNhYy00NjZiLWI0NjUtZmNhY2JhNDRmODU3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,14,380,562_.jpg', 'Fifty-seven years after surviving an apocalyptic attack aboard her space vessel by merciless space creatures, Officer Ripley awakens from hyper-sleep and tries to warn anyone who will listen about the predators.', 'https://www.youtube.com/embed/oSeQQlaCZgU', 'Action', 'James Cameron', 'James Cameron (story by)', 'tt0090605', '2023-02-25'),
(281858, 66, 'American Beauty', 'https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1999', 'https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A sexually frustrated suburban father has a mid-life crisis after becoming infatuated with his daughter\'s best friend.', 'https://www.youtube.com/embed/Ly7rq5EsTC8', 'Drama', 'Sam Mendes', 'Alan Ball', 'tt0169547', '2023-02-25'),
(281859, 67, 'Spider-Man: Into the Spider-Verse', 'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2018', 'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_QL75_UX380_CR0,1,380,562_.jpg', 'Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.', 'https://www.youtube.com/embed/g4Hbz2jLxvQ', 'Animation', 'Bob Persichetti', 'Phil Lord (screenplay by)', 'tt4633694', '2023-02-25'),
(281860, 68, 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', 'https://m.media-amazon.com/images/M/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1964', 'https://m.media-amazon.com/images/M/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,14,380,562_.jpg', 'An insane American general orders a bombing attack on the Soviet Union, triggering a path to nuclear holocaust that a war room full of politicians and generals frantically tries to stop.', 'https://www.youtube.com/embed/jPU1AYTxwg4', 'Comedy', 'Stanley Kubrick', 'Stanley Kubrick (screenplay)', 'tt0057012', '2023-02-25'),
(281861, 69, 'The Dark Knight Rises', 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2012', 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'Eight years after the Joker\'s reign of anarchy, Batman, with the help of the enigmatic Selina Kyle, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 'https://www.youtube.com/embed/GokKUqLcvD8', 'Action', 'Christopher Nolan', 'Jonathan Nolan (screenplay)', 'tt1345836', '2023-02-25'),
(281862, 70, 'Oldboy', 'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2003', 'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must find his captor in five days.', 'https://www.youtube.com/embed/2HkjrJ6IK5E', 'Action', 'Park Chan-wook', 'Garon Tsuchiya (manga)', 'tt0364569', '2023-02-25'),
(281863, 71, 'Joker', 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2019', 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain.', 'https://www.youtube.com/embed/zAGVQLHvwOY', 'Crime', 'Todd Phillips', 'Todd Phillips', 'tt7286456', '2023-02-25'),
(281864, 72, 'Amadeus', 'https://m.media-amazon.com/images/M/MV5BNWJlNzUzNGMtYTAwMS00ZjI2LWFmNWQtODcxNWUxODA5YmU1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1984', 'https://m.media-amazon.com/images/M/MV5BNWJlNzUzNGMtYTAwMS00ZjI2LWFmNWQtODcxNWUxODA5YmU1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_QL75_UX380_CR0,15,380,562_.jpg', 'The life, success and troubles of Wolfgang Amadeus Mozart, as told by Antonio Salieri, the contemporaneous composer who was insanely jealous of Mozart\'s talent and claimed to have murdered him.', 'https://www.youtube.com/embed/r7kWQj9FCGY', 'Biography', 'Milos Forman', 'Peter Shaffer (original stage play)', 'tt0086879', '2023-02-25'),
(281865, 73, 'Inglourious Basterds', 'https://m.media-amazon.com/images/M/MV5BOTJiNDEzOWYtMTVjOC00ZjlmLWE0NGMtZmE1OWVmZDQ2OWJhXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2009', 'https://m.media-amazon.com/images/M/MV5BOTJiNDEzOWYtMTVjOC00ZjlmLWE0NGMtZmE1OWVmZDQ2OWJhXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner\'s vengeful plans for the same.', 'https://www.youtube.com/embed/KnrRy6kSFF0', 'Adventure', 'Quentin Tarantino', 'Quentin Tarantino', 'tt0361748', '2023-02-25'),
(281866, 74, 'Toy Story', 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1995', 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_QL75_UX380_CR0,2,380,562_.jpg', 'A cowboy doll is profoundly threatened and jealous when a new spaceman action figure supplants him as top toy in a boy\'s bedroom.', 'https://www.youtube.com/embed/v-PjgYDrg70', 'Animation', 'John Lasseter', 'John Lasseter (original story by)', 'tt0114709', '2023-02-25'),
(281867, 75, 'Coco', 'https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '2017', 'https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_QL75_UY562_CR7,0,380,562_.jpg', 'Aspiring musician Miguel, confronted with his family\'s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 'https://www.youtube.com/embed/Ga6RYejo6Hk', 'Animation', 'Lee Unkrich', 'Lee Unkrich (original story by)', 'tt2380307', '2023-02-25'),
(281868, 76, 'Braveheart', 'https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1995', 'https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR1,0,380,562_.jpg', 'Scottish warrior William Wallace leads his countrymen in a rebellion to free his homeland from the tyranny of King Edward I of England.', 'https://www.youtube.com/embed/1NJO0jxBtMo', 'Biography', 'Mel Gibson', 'Randall Wallace', 'tt0112573', '2023-02-25'),
(281869, 77, 'The Boat', 'https://m.media-amazon.com/images/M/MV5BNDBjMWUxNTUtNjZiNi00YzJhLTgzNzUtMTRiY2FkZmMzYTNjXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1981', 'https://m.media-amazon.com/images/M/MV5BNDBjMWUxNTUtNjZiNi00YzJhLTgzNzUtMTRiY2FkZmMzYTNjXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_QL75_UX380_CR0,7,380,562_.jpg', 'A German U-boat stalks the frigid waters of the North Atlantic as its young crew experience the sheer terror and claustrophobic world of a submariner in World War II.', 'https://www.youtube.com/embed/KhNnU4h1Q50', 'Drama', 'Wolfgang Petersen', 'Wolfgang Petersen', 'tt0082096', '2023-02-25'),
(281870, 78, 'Avengers: Endgame', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2019', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', 'https://www.youtube.com/embed/TcMBFSGVi1c', 'Action', 'Anthony Russo', 'Christopher Markus (screenplay by)', 'tt4154796', '2023-02-25'),
(281871, 79, 'Princess Mononoke', 'https://m.media-amazon.com/images/M/MV5BNGIzY2IzODQtNThmMi00ZDE4LWI5YzAtNzNlZTM1ZjYyYjUyXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1997', 'https://m.media-amazon.com/images/M/MV5BNGIzY2IzODQtNThmMi00ZDE4LWI5YzAtNzNlZTM1ZjYyYjUyXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'On a journey to find the cure for a Tatarigami\'s curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony. In this quest he also meets San, the Mononoke Hime.', 'https://www.youtube.com/embed/4OiMOHRDs14', 'Animation', 'Hayao Miyazaki', 'Hayao Miyazaki (original story)', 'tt0119698', '2023-02-25');
INSERT INTO `movies` (`id`, `rank`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date`) VALUES
(281872, 80, 'Top Gun: Maverick', 'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2022', 'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN\'s elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.', 'https://www.youtube.com/embed/giXco2jaZ_4', 'Action', 'Joseph Kosinski', 'Jim Cash (based on characters created by)', 'tt1745960', '2023-02-25'),
(281873, 81, 'Once Upon a Time in America', 'https://m.media-amazon.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1984', 'https://m.media-amazon.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,16,380,562_.jpg', 'A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan 35 years later, where he must once again confront the ghosts and regrets of his old life.', 'https://www.youtube.com/embed/LcpCRyNo8T8', 'Crime', 'Sergio Leone', 'Harry Grey (based on novel \"The Hoods\" by)', 'tt0087843', '2023-02-25'),
(281874, 82, 'Good Will Hunting', 'https://m.media-amazon.com/images/M/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1997', 'https://m.media-amazon.com/images/M/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,9,380,562_.jpg', 'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.', 'https://www.youtube.com/embed/PaZVjZEFkRs', 'Drama', 'Gus Van Sant', 'Matt Damon', 'tt0119217', '2023-02-25'),
(281875, 83, 'Your Name.', 'https://m.media-amazon.com/images/M/MV5BODRmZDVmNzUtZDA4ZC00NjhkLWI2M2UtN2M0ZDIzNDcxYThjL2ltYWdlXkEyXkFqcGdeQXVyNTk0MzMzODA@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2016', 'https://m.media-amazon.com/images/M/MV5BODRmZDVmNzUtZDA4ZC00NjhkLWI2M2UtN2M0ZDIzNDcxYThjL2ltYWdlXkEyXkFqcGdeQXVyNTk0MzMzODA@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?', 'https://www.youtube.com/embed/xU47nhruN-Q', 'Animation', 'Makoto Shinkai', 'Makoto Shinkai (based on his novel)', 'tt5311514', '2023-02-25'),
(281876, 84, 'Requiem for a Dream', 'https://m.media-amazon.com/images/M/MV5BOTdiNzJlOWUtNWMwNS00NmFlLWI0YTEtZmI3YjIzZWUyY2Y3XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '2000', 'https://m.media-amazon.com/images/M/MV5BOTdiNzJlOWUtNWMwNS00NmFlLWI0YTEtZmI3YjIzZWUyY2Y3XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'The drug-induced utopias of four Coney Island people are shattered when their addictions run deep.', 'https://www.youtube.com/embed/QBwzN4v1vA0', 'Drama', 'Darren Aronofsky', 'Hubert Selby Jr. (based on the book by)', 'tt0180093', '2023-02-25'),
(281877, 85, 'Toy Story 3', 'https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '2010', 'https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_QL75_UY562_CR9,0,380,562_.jpg', 'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it\'s up to Woody to convince the other toys that they weren\'t abandoned and to return home.', 'https://www.youtube.com/embed/JcpWXaA2qeg', 'Animation', 'Lee Unkrich', 'John Lasseter (story by)', 'tt0435761', '2023-02-25'),
(281878, 86, 'Singin\' in the Rain', 'https://m.media-amazon.com/images/M/MV5BZDRjNGViMjQtOThlMi00MTA3LThkYzQtNzJkYjBkMGE0YzE1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1952', 'https://m.media-amazon.com/images/M/MV5BZDRjNGViMjQtOThlMi00MTA3LThkYzQtNzJkYjBkMGE0YzE1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_QL75_UY562_CR3,0,380,562_.jpg', 'A silent film star falls for a chorus girl just as he and his delusionally jealous screen partner are trying to make the difficult transition to talking pictures in 1920s Hollywood.', 'https://www.youtube.com/embed/5_EVHeNEIJY', 'Comedy', 'Stanley Donen', 'Betty Comden (story by)', 'tt0045152', '2023-02-25'),
(281879, 87, '3 Idiots', 'https://m.media-amazon.com/images/M/MV5BNTkyOGVjMGEtNmQzZi00NzFlLTlhOWQtODYyMDc2ZGJmYzFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '2009', 'https://m.media-amazon.com/images/M/MV5BNTkyOGVjMGEtNmQzZi00NzFlLTlhOWQtODYyMDc2ZGJmYzFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_QL75_UY562_CR5,0,380,562_.jpg', 'Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them \"idiots\".', 'https://www.youtube.com/embed/xvszmNXdM4w', 'Comedy', 'Rajkumar Hirani', 'Rajkumar Hirani (screenplay)', 'tt1187043', '2023-02-25'),
(281880, 88, 'High and Low', 'https://m.media-amazon.com/images/M/MV5BZGQ1NWZlYjctNDJmOS00MmU2LTg1ODItNmZiM2ZkNzJhNDI0XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '1963', 'https://m.media-amazon.com/images/M/MV5BZGQ1NWZlYjctNDJmOS00MmU2LTg1ODItNmZiM2ZkNzJhNDI0XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_QL75_UY562_CR9,0,380,562_.jpg', 'An executive of a Yokohama shoe company becomes a victim of extortion when his chauffeur\'s son is kidnapped by mistake and held for ransom.', 'https://www.youtube.com/embed/LV3z2Ytxu90', 'Crime', 'Akira Kurosawa', 'Hideo Oguni (screenplay)', 'tt0057565', '2023-02-25'),
(281881, 89, 'Star Wars: Episode VI - Return of the Jedi', 'https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1983', 'https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_QL75_UX380_CR0,13,380,562_.jpg', 'After a daring mission to rescue Han Solo from Jabba the Hutt, the Rebels dispatch to Endor to destroy the second Death Star. Meanwhile, Luke struggles to help Darth Vader back from the dark side without falling into the Emperor\'s trap.', 'https://www.youtube.com/embed/p4vIFhk621Q', 'Action', 'Richard Marquand', 'Lawrence Kasdan (screenplay by)', 'tt0086190', '2023-02-25'),
(281882, 90, '2001: A Space Odyssey', 'https://m.media-amazon.com/images/M/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1968', 'https://m.media-amazon.com/images/M/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After uncovering a mysterious artifact buried beneath the Lunar surface, a spacecraft is sent to Jupiter to find its origins - a spacecraft manned by two men and the supercomputer H.A.L. 9000.', 'https://www.youtube.com/embed/UgGCScAV7qU', 'Adventure', 'Stanley Kubrick', 'Stanley Kubrick (screenplay by)', 'tt0062622', '2023-02-25'),
(281883, 91, 'Eternal Sunshine of the Spotless Mind', 'https://m.media-amazon.com/images/M/MV5BMTY4NzcwODg3Nl5BMl5BanBnXkFtZTcwNTEwOTMyMw@@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '2004', 'https://m.media-amazon.com/images/M/MV5BMTY4NzcwODg3Nl5BMl5BanBnXkFtZTcwNTEwOTMyMw@@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'When their relationship turns sour, a couple undergoes a medical procedure to have each other erased from their memories.', 'https://www.youtube.com/embed/07-QBnEkgXU', 'Drama', 'Michel Gondry', 'Charlie Kaufman (story)', 'tt0338013', '2023-02-25'),
(281884, 92, 'Capernaum', 'https://m.media-amazon.com/images/M/MV5BY2Y3OWNkMTctYzNjYS00NWVkLTg4OWEtY2YxN2I3NDhlYzE0XkEyXkFqcGdeQXVyMTI3ODAyMzE2._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '2018', 'https://m.media-amazon.com/images/M/MV5BY2Y3OWNkMTctYzNjYS00NWVkLTg4OWEtY2YxN2I3NDhlYzE0XkEyXkFqcGdeQXVyMTI3ODAyMzE2._V1_QL75_UY562_CR7,0,380,562_.jpg', 'While serving a five-year sentence for a violent crime, a 12-year-old boy sues his parents for neglect.', 'https://www.youtube.com/embed/ULUo0048xZE', 'Drama', 'Nadine Labaki', 'Nadine Labaki (screenplay)', 'tt8267604', '2023-02-25'),
(281885, 93, 'Reservoir Dogs', 'https://m.media-amazon.com/images/M/MV5BZmExNmEwYWItYmQzOS00YjA5LTk2MjktZjEyZDE1Y2QxNjA1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1992', 'https://m.media-amazon.com/images/M/MV5BZmExNmEwYWItYmQzOS00YjA5LTk2MjktZjEyZDE1Y2QxNjA1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_QL75_UX380_CR0,2,380,562_.jpg', 'When a simple jewelry heist goes horribly wrong, the surviving criminals begin to suspect that one of them is a police informant.', 'https://www.youtube.com/embed/vayksn4Y93A', 'Crime', 'Quentin Tarantino', 'Quentin Tarantino (background radio dialogue written by)', 'tt0105236', '2023-02-25'),
(281886, 94, 'The Hunt', 'https://m.media-amazon.com/images/M/MV5BMTg2NDg3ODg4NF5BMl5BanBnXkFtZTcwNzk3NTc3Nw@@._V1_UY67_CR1,0,45,67_AL_.jpg', 8, '2012', 'https://m.media-amazon.com/images/M/MV5BMTg2NDg3ODg4NF5BMl5BanBnXkFtZTcwNzk3NTc3Nw@@._V1_QL75_UY562_CR7,0,380,562_.jpg', 'A teacher lives a lonely life, all the while struggling over his son\'s custody. His life slowly gets better as he finds love and receives good news from his son, but his new luck is about to be brutally shattered by an innocent little lie.', 'https://www.youtube.com/embed/YsYn6L5fF9Q', 'Drama', 'Thomas Vinterberg', 'Thomas Vinterberg (screenplay)', 'tt2106476', '2023-02-25'),
(281887, 95, 'Citizen Kane', 'https://m.media-amazon.com/images/M/MV5BYjBiOTYxZWItMzdiZi00NjlkLWIzZTYtYmFhZjhiMTljOTdkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1941', 'https://m.media-amazon.com/images/M/MV5BYjBiOTYxZWItMzdiZi00NjlkLWIzZTYtYmFhZjhiMTljOTdkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'Following the death of publishing tycoon Charles Foster Kane, reporters scramble to uncover the meaning of his final utterance: \'Rosebud.\'', 'https://www.youtube.com/embed/8dxh3lwdOFw', 'Drama', 'Orson Welles', 'Herman J. Mankiewicz (original screen play)', 'tt0033467', '2023-02-25'),
(281888, 96, 'Lawrence of Arabia', 'https://m.media-amazon.com/images/M/MV5BYWY5ZjhjNGYtZmI2Ny00ODM0LWFkNzgtZmI1YzA2N2MxMzA0XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1962', 'https://m.media-amazon.com/images/M/MV5BYWY5ZjhjNGYtZmI2Ny00ODM0LWFkNzgtZmI1YzA2N2MxMzA0XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_QL75_UY562_CR5,0,380,562_.jpg', 'The story of T.E. Lawrence, the English officer who successfully united and led the diverse, often warring, Arab tribes during World War I in order to fight the Turks.', 'https://www.youtube.com/embed/vOlRhGEhG7k', 'Adventure', 'David Lean', 'Robert Bolt (screenplay by)', 'tt0056172', '2023-02-25'),
(281889, 97, 'M', 'https://m.media-amazon.com/images/M/MV5BODA4ODk3OTEzMF5BMl5BanBnXkFtZTgwMTQ2ODMwMzE@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1931', 'https://m.media-amazon.com/images/M/MV5BODA4ODk3OTEzMF5BMl5BanBnXkFtZTgwMTQ2ODMwMzE@._V1_QL75_UX380_CR0,4,380,562_.jpg', 'When the police in a German city are unable to catch a child-murderer, other criminals join in the manhunt.', 'https://www.youtube.com/embed/nsVproWjN6c', 'Crime', 'Fritz Lang', 'Thea von Harbou (script)', 'tt0022100', '2023-02-25'),
(281890, 98, 'Come and See', 'https://m.media-amazon.com/images/M/MV5BNzU3OTI1MjItYTJiZC00NDI0LWFlNGYtOTQ1OTVhNDgwM2U3XkEyXkFqcGdeQXVyNTc2MDU0NDE@._V1_UY67_CR0,0,45,67_AL_.jpg', 8, '1985', 'https://m.media-amazon.com/images/M/MV5BNzU3OTI1MjItYTJiZC00NDI0LWFlNGYtOTQ1OTVhNDgwM2U3XkEyXkFqcGdeQXVyNTc2MDU0NDE@._V1_QL75_UX380_CR0,0,380,562_.jpg', 'After finding an old rifle, a young boy joins the Soviet resistance movement against ruthless German forces and experiences the horrors of World War II.', 'https://www.youtube.com/embed/UHaSQU-4wss', 'Drama', 'Elem Klimov', 'Ales Adamovich (story)', 'tt0091251', '2023-02-25'),
(281891, 99, 'North by Northwest', 'https://m.media-amazon.com/images/M/MV5BZDA3NDExMTUtMDlhOC00MmQ5LWExZGUtYmI1NGVlZWI4OWNiXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1959', 'https://m.media-amazon.com/images/M/MV5BZDA3NDExMTUtMDlhOC00MmQ5LWExZGUtYmI1NGVlZWI4OWNiXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_QL75_UX380_CR0,5,380,562_.jpg', 'A New York City advertising executive goes on the run after being mistaken for a government agent by a group of foreign spies, and falls for a woman whose loyalties he begins to doubt.', 'https://www.youtube.com/embed/Fx0QuZJVTFE', 'Action', 'Alfred Hitchcock', 'Ernest Lehman', 'tt0053125', '2023-02-25'),
(281892, 100, 'Vertigo', 'https://m.media-amazon.com/images/M/MV5BYTE4ODEwZDUtNDFjOC00NjAxLWEzYTQtYTI1NGVmZmFlNjdiL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX45_CR0,0,45,67_AL_.jpg', 8, '1958', 'https://m.media-amazon.com/images/M/MV5BYTE4ODEwZDUtNDFjOC00NjAxLWEzYTQtYTI1NGVmZmFlNjdiL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_QL75_UX380_CR0,13,380,562_.jpg', 'A former San Francisco police detective juggles wrestling with his personal demons and becoming obsessed with the hauntingly beautiful woman he has been hired to trail, who may be deeply disturbed.', 'https://www.youtube.com/embed/Z5jvQwwHQNY', 'Mystery', 'Alfred Hitchcock', 'Alec Coppel (screenplay by)', 'tt0052357', '2023-02-25');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_ref` varchar(255) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `reserved_at` date NOT NULL DEFAULT current_timestamp(),
  `seat_number` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `show_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `user_ref`, `movie_id`, `reserved_at`, `seat_number`, `hall_id`, `show_date`) VALUES
(346, '6ac5c139', 281890, '2023-03-14', 1, 3, '2023-03-15'),
(349, '6ac5c139', 281805, '2023-03-14', 1, 6, '2023-03-15'),
(350, '6ac5c139', 281805, '2023-03-14', 2, 6, '2023-03-15');

-- --------------------------------------------------------

--
-- Structure de la table `seats`
--

CREATE TABLE `seats` (
  `number` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `reserved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shown_movies`
--

CREATE TABLE `shown_movies` (
  `hall_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `seats` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `shown_movies`
--

INSERT INTO `shown_movies` (`hall_id`, `movie_id`, `date`, `seats`) VALUES
(1, 281794, '2023-03-16', 0),
(1, 281879, '2023-03-17', 0),
(2, 281830, '2023-03-15', 0),
(2, 281842, '2023-03-16', 0),
(3, 281890, '2023-03-15', 1),
(3, 281815, '2023-03-16', 0),
(4, 281848, '2023-03-15', 0),
(4, 281855, '2023-03-16', 0),
(4, 281794, '2023-03-17', 0),
(5, 281804, '2023-03-15', 0),
(6, 281805, '2023-03-15', 2),
(6, 281797, '2023-03-17', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ref`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ref`);

--
-- Index pour la table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ref` (`user_ref`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Index pour la table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`number`,`hall_id`),
  ADD KEY `seats_ibfk_1` (`hall_id`);

--
-- Index pour la table `shown_movies`
--
ALTER TABLE `shown_movies`
  ADD PRIMARY KEY (`hall_id`,`date`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281893;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_ref`) REFERENCES `client` (`ref`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `shown_movies`
--
ALTER TABLE `shown_movies`
  ADD CONSTRAINT `shown_movies_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`),
  ADD CONSTRAINT `shown_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
