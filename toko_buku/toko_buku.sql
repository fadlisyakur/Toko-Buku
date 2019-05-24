-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2018 at 01:35 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `judul` varchar(25) NOT NULL,
  `noisbn` varchar(17) NOT NULL,
  `penulis` varchar(25) NOT NULL,
  `penerbit` varchar(25) NOT NULL,
  `tahun` char(4) NOT NULL,
  `stok` int(3) DEFAULT NULL,
  `harga_pokok` int(6) NOT NULL,
  `harga_jual` int(6) NOT NULL,
  `ppn` float NOT NULL,
  `diskon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `harga_jual`, `ppn`, `diskon`) VALUES
(1, 'MTK', '123xxx', 'Young', 'Gramedia', '2000', 10, 50000, 55000, 1.2, 10),
(3, 'Incu Kambing', '465xxx', 'Bahar', 'SMITCH', '1989', 10, 12000, 15000, 1, 15),
(4, 'Taubat Nasuha', '1933xxxx', 'Adi Hidayat ,L.c,MA', 'Akhyar.tv', '2017', 10, 50000, 55000, 3.2, 5),
(5, 'Larangan LGBT', '5454682xx', 'Habib Rangga', 'Akhyar TV', '2018', 1000, 40000, 50000, 1.2, 5),
(7, 'abdi hitam', '123531256', 'jsagdyaug', 'jhslfsidh', '2000', 1000, 20000, 20000, 2.3, 25),
(8, 'lieur', '123xxx', 'men', 'gramedia', '2017', 2, 30000, 35000, 2.3, 20),
(9, 'Matahari', '234122xxx', 'parker', 'gramedia', '2017', 4, 21000, 22000, 1.2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` int(3) NOT NULL,
  `nama_distributor` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telpon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `telpon`) VALUES
(1, 'PT.GarGor', 'Garut', '08xxxx'),
(2, 'PT Mundur', 'Jalan Gang', '087xxxxx'),
(4, 'PT Tirai', 'China', '083xxx'),
(5, 'PT.Gramedia', 'Jln.Kuningan Jakarta', '0894422'),
(6, 'PT.Lieur', 'jaska	', '086758'),
(7, 'PT.tes', 'bogor', '08129xxx');

-- --------------------------------------------------------

--
-- Table structure for table `jual_buku`
--

CREATE TABLE `jual_buku` (
  `id_jual` int(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(7) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `total` int(100) NOT NULL,
  `bayar` int(100) NOT NULL,
  `kembali` int(100) NOT NULL,
  `tgl_beli` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noisbn` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jual_buku`
--

INSERT INTO `jual_buku` (`id_jual`, `judul`, `jumlah`, `harga`, `penulis`, `penerbit`, `total`, `bayar`, `kembali`, `tgl_beli`, `noisbn`) VALUES
(1, 'Taubat Nasuha', 2, 110000, 'Adi Hidayat ,L.c,MA', 'Akhyar.tv', 100000, 200000, 100000, '2018-05-18 03:59:27', '1933xxxx'),
(2, 'MTK', 1, 55000, 'Young', 'Gramedia', 50000, 60000, 10000, '2018-05-18 11:15:17', '123xxx'),
(4, 'lieur', 2, 70000, 'men', 'gramedia', 60000, 70000, 10000, '2018-05-18 13:44:44', '123xxx');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` int(255) NOT NULL,
  `akses` enum('kasir','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `alamat`, `telpon`, `status`, `username`, `password`, `akses`) VALUES
(1, 'Fadli Abdan Syakur', 'kp.citeureup, jln.terusan pahlawan no.59', '083819394174', '1', 'admin', 21232, 'admin'),
(2, 'Mochammad Faad', 'jln.cicurug, Bogor', '0876626171', '1', 'fadli', 0, 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `pasok`
--

CREATE TABLE `pasok` (
  `id_pasok` int(5) NOT NULL,
  `id_distributor` int(3) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasok`
--

INSERT INTO `pasok` (`id_pasok`, `id_distributor`, `id_buku`, `jumlah`, `tanggal`) VALUES
(13, 2, 3, 1, '2018-02-27'),
(17, 2, 5, 12, '2018-05-08'),
(18, 4, 4, 1, '2018-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `id_kasir` int(3) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total` int(7) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `jual_buku`
--
ALTER TABLE `jual_buku`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `pasok`
--
ALTER TABLE `pasok`
  ADD PRIMARY KEY (`id_pasok`),
  ADD KEY `id_distributor` (`id_distributor`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id_distributor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `jual_buku`
--
ALTER TABLE `jual_buku`
  MODIFY `id_jual` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pasok`
--
ALTER TABLE `pasok`
  MODIFY `id_pasok` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasok`
--
ALTER TABLE `pasok`
  ADD CONSTRAINT `pasok_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`),
  ADD CONSTRAINT `pasok_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
