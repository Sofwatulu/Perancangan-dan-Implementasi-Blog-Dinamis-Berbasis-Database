-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Apr 2025 pada 22.49
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artikelku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `publish_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `article`
--

INSERT INTO `article` (`id_article`, `title`, `content`, `image`, `publish_date`) VALUES
(1, 'Liburan Seru di Bali', 'Artikel tentang wisata Bali...', 'bali.jpg', '2024-05-01'),
(2, 'Nikmatnya Soto Betawi', 'Artikel tentang soto Betawi...', 'soto_betawi.jpg', '2024-05-02'),
(3, 'Jelajah Alam di Raja Ampat', 'Artikel tentang Raja Ampat...', 'raja_ampat.jpg', '2024-05-03'),
(4, 'Mencicipi Sate Madura', 'Artikel tentang sate Madura...', 'sate_madura.jpg', '2024-05-04'),
(5, 'Pesona Gunung Bromo', 'Artikel tentang Gunung Bromo...', 'bromo.jpg', '2024-05-05'),
(6, 'Wisata Sejarah di Yogyakarta', 'Artikel tentang sejarah Jogja...', 'jogja.jpg', '2024-05-06'),
(7, 'Kelezatan Nasi Liwet Solo', 'Artikel tentang nasi liwet...', 'nasi_liwet.jpg', '2024-05-07'),
(8, 'Surga Kuliner di Bandung', 'Artikel tentang kuliner Bandung...', 'bandung.jpg', '2024-05-08'),
(9, 'Pantai Parangtritis', 'Artikel tentang Parangtritis...', 'parangtritis.jpg', '2024-05-09'),
(10, 'Jajanan Pasar Tradisional', 'Artikel tentang jajanan pasar...', 'jajanan_pasar.jpg', '2024-05-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `article_author`
--

CREATE TABLE `article_author` (
  `id_article` int(11) NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `article_author`
--

INSERT INTO `article_author` (`id_article`, `id_author`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 1),
(6, 2),
(7, 3),
(8, 1),
(9, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `article_category`
--

CREATE TABLE `article_category` (
  `id_article` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `article_category`
--

INSERT INTO `article_category` (`id_article`, `id_category`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `author`
--

INSERT INTO `author` (`id_author`, `name`) VALUES
(1, 'Sofwatul Ummah'),
(2, 'Andi Nugroho'),
(3, 'Siti Rahmawati');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'Wisata'),
(2, 'Kuliner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`);

--
-- Indeks untuk tabel `article_author`
--
ALTER TABLE `article_author`
  ADD PRIMARY KEY (`id_article`,`id_author`),
  ADD KEY `id_author` (`id_author`);

--
-- Indeks untuk tabel `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id_article`,`id_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `article_author`
--
ALTER TABLE `article_author`
  ADD CONSTRAINT `article_author_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `article_author_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`);

--
-- Ketidakleluasaan untuk tabel `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `article_category_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `article_category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
