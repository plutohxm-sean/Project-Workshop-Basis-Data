-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2026 at 05:32 PM
-- Server version: 10.11.14-MariaDB-0+deb12u2
-- PHP Version: 8.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_basisdata_2425600004`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL CHECK (`jumlah` > 0),
  `subtotal` int(11) NOT NULL CHECK (`subtotal` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_menu`, `jumlah`, `subtotal`) VALUES
(1, 1, 2, 1, 15000),
(2, 2, 1, 2, 24000),
(3, 3, 13, 1, 13000),
(4, 4, 9, 1, 13000),
(5, 5, 14, 1, 15000),
(6, 5, 17, 1, 10000),
(7, 6, 5, 1, 12000),
(8, 7, 6, 1, 15000),
(9, 7, 18, 1, 10000),
(10, 8, 19, 2, 24000),
(11, 8, 20, 1, 8000),
(12, 9, 18, 1, 10000),
(13, 10, 13, 2, 26000),
(14, 11, 2, 1, 15000),
(15, 12, 17, 1, 10000),
(16, 12, 4, 1, 5000),
(17, 12, 16, 1, 2000),
(18, 13, 20, 1, 8000),
(19, 14, 1, 2, 24000),
(20, 15, 14, 1, 15000),
(21, 15, 9, 1, 13000),
(22, 1, 3, 1, 3000),
(23, 1, 4, 1, 5000),
(24, 2, 3, 2, 6000),
(25, 3, 15, 1, 4000),
(26, 3, 16, 2, 4000),
(27, 4, 12, 1, 3000),
(28, 5, 15, 2, 8000),
(29, 6, 7, 1, 3000),
(30, 6, 8, 1, 4000),
(31, 7, 3, 2, 6000),
(32, 8, 3, 2, 6000),
(33, 9, 20, 1, 8000),
(34, 10, 15, 2, 8000),
(35, 11, 3, 1, 3000),
(36, 13, 16, 2, 4000),
(37, 14, 3, 2, 6000),
(38, 14, 4, 1, 5000),
(39, 15, 15, 1, 4000),
(40, 15, 16, 1, 2000);

--
-- Triggers `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `trg_kurangi_stok` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
    UPDATE menu 
    SET stok = stok - NEW.jumlah 
    WHERE id_menu = NEW.id_menu;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `shift` enum('Pagi','Siang','Malam') DEFAULT 'Pagi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `shift`) VALUES
(1, 'Andi Saputra', 'Pagi'),
(2, 'Budi Santoso', 'Siang'),
(3, 'Citra Lestari', 'Pagi'),
(4, 'Dina Mariana', 'Malam');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_menu`
--

CREATE TABLE `kategori_menu` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_menu`
--

INSERT INTO `kategori_menu` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Camilan & Snack'),
(1, 'Makanan Berat'),
(3, 'Minuman Dingin'),
(4, 'Minuman Panas'),
(5, 'Paket Hemat');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_tenant` int(11) DEFAULT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL CHECK (`harga` >= 0),
  `stok` int(11) DEFAULT 0 CHECK (`stok` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_kategori`, `id_tenant`, `nama_menu`, `harga`, `stok`) VALUES
(1, 1, 1, 'Nasi Ayam Geprek', 13000, 50),
(2, 1, 1, 'Geprek Mozzarella', 15000, 45),
(3, 3, 1, 'Es Teh Manis', 3000, 100),
(4, 2, 1, 'Tahu Crispy', 5000, 40),
(5, 1, 2, 'Nasi Ayam Rempah', 13000, 45),
(6, 1, 2, 'Nasi Ayam Bakar', 15000, 25),
(7, 4, 2, 'Teh Hangat', 3000, 80),
(8, 2, 2, 'Telur Dadar Crispy', 4000, 50),
(9, 2, 3, 'Pisang Geprek Coklat', 13000, 40),
(10, 2, 3, 'Pisang Geprek Keju', 13000, 40),
(12, 3, 3, 'Air Mineral', 3000, 100),
(13, 1, 4, 'Mie Ayam Pangsit', 13000, 60),
(14, 1, 4, 'Mie Ayam Bakso', 15000, 50),
(15, 3, 4, 'Es Jeruk', 4000, 70),
(16, 2, 4, 'Kerupuk Pangsit', 2000, 100),
(17, 1, 5, 'Batagor Bumbu Kacang', 10000, 50),
(18, 1, 5, 'Siomay Bandung', 10000, 50),
(19, 1, 5, 'Batagor Kuah', 13000, 30),
(20, 3, 5, 'Es Campur', 8000, 40);

--
-- Triggers `menu`
--
DELIMITER $$
CREATE TRIGGER `trg_arsip_menu_hapus` AFTER DELETE ON `menu` FOR EACH ROW BEGIN
    INSERT INTO menu_hapus (id_menu_lama, nama_menu, harga, stok_terakhir, user_penghapus)
    VALUES (OLD.id_menu, OLD.nama_menu, OLD.harga, OLD.stok, CURRENT_USER());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_hapus`
--

CREATE TABLE `menu_hapus` (
  `id_hapus` int(11) NOT NULL,
  `id_menu_lama` int(11) DEFAULT NULL,
  `nama_menu` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok_terakhir` int(11) DEFAULT NULL,
  `tanggal_hapus` datetime DEFAULT current_timestamp(),
  `user_penghapus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `nim`, `jurusan`, `alamat`) VALUES
(1, 'Sean Antonio Tarigan', '2425600004', 'Sains Data', 'Asrama Mahasiswa PENS'),
(2, 'Rizky Pratama', '3123600001', 'Telekomunikasi', NULL),
(3, 'Ahmad Fauzi', '3123600002', 'Teknik Informatika', NULL),
(4, 'Siti Aminah', '3123600003', 'Teknik Komputer', NULL),
(5, 'Wahyu Hidayat', '3123600004', 'Teknik Elektro', NULL),
(6, 'Nisa Sabyan', '3123600005', 'Sistem Pembangkit Energi', NULL),
(7, 'Fajar Nugraha', '3123600006', 'Telekomunikasi', NULL),
(8, 'Rina Nose', '3123600007', 'Teknik Mekatronika', NULL),
(9, 'Gilang Dirga', '3123600008', 'Teknologi Game', NULL),
(10, 'Ayu Ting Ting', '3123600009', 'Sains Data', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating_menu`
--

CREATE TABLE `rating_menu` (
  `id_rating` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `skor` int(11) NOT NULL CHECK (`skor` >= 1 and `skor` <= 5),
  `komentar` text DEFAULT NULL,
  `tanggal_rating` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_menu`
--

INSERT INTO `rating_menu` (`id_rating`, `id_menu`, `id_pelanggan`, `skor`, `komentar`, `tanggal_rating`) VALUES
(1, 1, 1, 5, 'Ayam gepreknya mantap, pedesnya pas!', '2026-06-05 22:21:13'),
(2, 13, 2, 4, 'Pangsitnya enak tapi kuahnya kurang panas.', '2026-06-05 22:21:13'),
(3, 17, 3, 5, 'Batagor terenak di PENS.', '2026-06-05 22:21:13'),
(4, 9, 4, 5, 'Coklatnya lumer banget, recommended!', '2026-06-05 22:21:13'),
(5, 5, 5, 4, 'Bumbu rempahnya kerasa, porsinya ngenyangin.', '2026-06-05 22:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `stok_bahan`
--

CREATE TABLE `stok_bahan` (
  `id_stok` int(11) NOT NULL,
  `id_tenant` int(11) DEFAULT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `jumlah_stok` int(11) DEFAULT 0 CHECK (`jumlah_stok` >= 0),
  `satuan` varchar(20) DEFAULT 'Pcs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`id_stok`, `id_tenant`, `nama_bahan`, `jumlah_stok`, `satuan`) VALUES
(1, 1, 'Daging Ayam', 20, 'Kg'),
(2, 1, 'Beras', 50, 'Kg'),
(3, 2, 'Bumbu Rempah', 5, 'Kg'),
(4, 2, 'Telur Ayam', 100, 'Butir'),
(5, 3, 'Pisang Kepok', 10, 'Tandan'),
(6, 3, 'Coklat Batang', 5, 'Kg'),
(7, 4, 'Mie Basah', 15, 'Kg'),
(8, 4, 'Pangsit Kering', 5, 'Pack'),
(9, 5, 'Tepung Tapioka', 20, 'Kg'),
(10, 5, 'Kacang Tanah', 10, 'Kg');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `id_tenant` int(11) NOT NULL,
  `nama_tenant` varchar(100) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`id_tenant`, `nama_tenant`, `nama_pemilik`, `no_telp`) VALUES
(1, 'Cibus Spesial Geprek', 'Pak Cibus', '081200000001'),
(2, 'Ayam Rempah Malaysia Bu Lia', 'Bu Lia', '081200000002'),
(3, 'Pisrek Pisang Geprek', 'Kak Pisrek', '081200000003'),
(4, 'Pangsit Mie Tenda Merah', 'Pak Tenda', '081200000004'),
(5, 'De\'HaNa Food', 'Bu Hana', '081200000005');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `id_voucher` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT current_timestamp(),
  `total_harga` int(11) DEFAULT 0 CHECK (`total_harga` >= 0),
  `metode_pembayaran` enum('Tunai','QRIS','Transfer') NOT NULL DEFAULT 'Tunai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_kasir`, `id_voucher`, `tanggal_transaksi`, `total_harga`, `metode_pembayaran`) VALUES
(1, 1, 1, 1, '2026-06-01 10:00:00', 10000, 'QRIS'),
(2, 2, 1, NULL, '2026-06-01 10:30:00', 24000, 'Tunai'),
(3, 3, 2, NULL, '2026-06-01 12:15:00', 13000, 'QRIS'),
(4, 4, 2, 3, '2026-06-02 11:00:00', 11000, 'Tunai'),
(5, 5, 3, NULL, '2026-06-02 13:00:00', 25000, 'Transfer'),
(6, 6, 3, NULL, '2026-06-03 09:45:00', 12000, 'Tunai'),
(7, 7, 4, 4, '2026-06-03 18:30:00', 20000, 'QRIS'),
(8, 8, 4, NULL, '2026-06-04 19:00:00', 30000, 'Tunai'),
(9, 9, 1, NULL, '2026-06-04 10:20:00', 10000, 'QRIS'),
(10, 10, 2, NULL, '2026-06-05 12:40:00', 26000, 'Tunai'),
(11, 1, 3, NULL, '2026-06-05 13:10:00', 15000, 'Transfer'),
(12, 2, 4, 5, '2026-06-06 18:00:00', 14000, 'QRIS'),
(13, 3, 1, NULL, '2026-06-06 09:10:00', 8000, 'Tunai'),
(14, 4, 2, NULL, '2026-06-07 12:00:00', 24000, 'QRIS'),
(15, 5, 3, 2, '2026-06-07 14:00:00', 18000, 'Tunai');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_transaksi` (
`id_transaksi` int(11)
,`nama_pelanggan` varchar(100)
,`nama_kasir` varchar(100)
,`metode_pembayaran` enum('Tunai','QRIS','Transfer')
,`tanggal_transaksi` datetime
,`total_harga` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_menu_lengkap`
-- (See below for the actual view)
--
CREATE TABLE `view_menu_lengkap` (
`id_menu` int(11)
,`nama_menu` varchar(100)
,`nama_kategori` varchar(50)
,`nama_tenant` varchar(100)
,`harga` int(11)
,`stok` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tenant_terlaris`
-- (See below for the actual view)
--
CREATE TABLE `view_tenant_terlaris` (
`nama_tenant` varchar(100)
,`total_item_terjual` decimal(32,0)
,`total_pendapatan` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL,
  `kode_voucher` varchar(20) NOT NULL,
  `potongan_harga` int(11) NOT NULL CHECK (`potongan_harga` > 0),
  `kuota` int(11) DEFAULT 0 CHECK (`kuota` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `kode_voucher`, `potongan_harga`, `kuota`) VALUES
(1, 'PENSJUARA', 5000, 50),
(2, 'MABAR10', 10000, 20),
(3, 'DISKON2K', 2000, 100),
(4, 'HEMAT5K', 5000, 30),
(5, 'CIBUSPROMO', 3000, 10);

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_transaksi`
--
DROP TABLE IF EXISTS `view_laporan_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_transaksi`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `p`.`nama_pelanggan` AS `nama_pelanggan`, `k`.`nama_kasir` AS `nama_kasir`, `t`.`metode_pembayaran` AS `metode_pembayaran`, `t`.`tanggal_transaksi` AS `tanggal_transaksi`, `t`.`total_harga` AS `total_harga` FROM ((`transaksi` `t` join `pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `kasir` `k` on(`t`.`id_kasir` = `k`.`id_kasir`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_menu_lengkap`
--
DROP TABLE IF EXISTS `view_menu_lengkap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_menu_lengkap`  AS SELECT `m`.`id_menu` AS `id_menu`, `m`.`nama_menu` AS `nama_menu`, `k`.`nama_kategori` AS `nama_kategori`, `t`.`nama_tenant` AS `nama_tenant`, `m`.`harga` AS `harga`, `m`.`stok` AS `stok` FROM ((`menu` `m` join `kategori_menu` `k` on(`m`.`id_kategori` = `k`.`id_kategori`)) join `tenant` `t` on(`m`.`id_tenant` = `t`.`id_tenant`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_tenant_terlaris`
--
DROP TABLE IF EXISTS `view_tenant_terlaris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tenant_terlaris`  AS SELECT `t`.`nama_tenant` AS `nama_tenant`, sum(`d`.`jumlah`) AS `total_item_terjual`, sum(`d`.`subtotal`) AS `total_pendapatan` FROM ((`detail_transaksi` `d` join `menu` `m` on(`d`.`id_menu` = `m`.`id_menu`)) join `tenant` `t` on(`m`.`id_tenant` = `t`.`id_tenant`)) GROUP BY `t`.`id_tenant` ORDER BY sum(`d`.`subtotal`) DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `kategori_menu`
--
ALTER TABLE `kategori_menu`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_tenant` (`id_tenant`);

--
-- Indexes for table `menu_hapus`
--
ALTER TABLE `menu_hapus`
  ADD PRIMARY KEY (`id_hapus`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `rating_menu`
--
ALTER TABLE `rating_menu`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_tenant` (`id_tenant`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`id_tenant`),
  ADD UNIQUE KEY `no_telp` (`no_telp`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_voucher` (`id_voucher`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`),
  ADD UNIQUE KEY `kode_voucher` (`kode_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_menu`
--
ALTER TABLE `kategori_menu`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menu_hapus`
--
ALTER TABLE `menu_hapus`
  MODIFY `id_hapus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rating_menu`
--
ALTER TABLE `rating_menu`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `id_tenant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_menu` (`id_kategori`) ON DELETE SET NULL,
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`id_tenant`) REFERENCES `tenant` (`id_tenant`) ON DELETE CASCADE;

--
-- Constraints for table `rating_menu`
--
ALTER TABLE `rating_menu`
  ADD CONSTRAINT `rating_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_menu_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL;

--
-- Constraints for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  ADD CONSTRAINT `stok_bahan_ibfk_1` FOREIGN KEY (`id_tenant`) REFERENCES `tenant` (`id_tenant`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE SET NULL,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_voucher`) REFERENCES `voucher` (`id_voucher`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
