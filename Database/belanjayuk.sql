-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2015 at 03:29 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belanjayuk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', 'admin', 'Administrator', 'redaksi@bukulokomedia.com', '08238923848', 'admin', 'N'),
('naufal', 'naufal', 'naufal', 'mursyid@gmail.com', '0811', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
  `id_hubungi` int(5) NOT NULL,
  `id_kustomer` int(5) NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `id_kustomer`, `subjek`, `pesan`, `tanggal`) VALUES
(18, 9, 'TAS', 'floral', '2015-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(19, 'Shoes'),
(18, 'Jajanan'),
(17, 'Handphone'),
(1, 'Backpack'),
(16, 'Hardcase'),
(21, 'Jasa');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `id_kota` int(3) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(1, 'Jakarta', 13000),
(2, 'Bandung', 13500),
(3, 'Semarang', 10000),
(4, 'Medan', 20000),
(5, 'Aceh', 25000),
(6, 'Banjarmasin', 17500),
(7, 'Balikpapan', 18500),
(8, 'Samarinda', 19500),
(9, 'Lainnya', 10000),
(10, 'Palembang', 23000),
(11, 'Surabaya', 13000),
(12, 'Bekasi', 10000),
(13, 'Kuningan', 18000);

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE IF NOT EXISTS `kustomer` (
  `id_kustomer` int(5) NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id_kustomer`, `password`, `nama_lengkap`, `alamat`, `email`, `telpon`, `id_kota`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Lukmanul Hakim', 'Jl. Prof. Dr. Soepomo No. 178, Tebet, Jakarta Timur 17280', 'algosigma@gmail.com', '081804396000', 1),
(2, 'cec1de94b66011a1cfed0a45f8ba8e16', 'budiono', 'Jl. Dipenogoro', 'budiono_114@yahoo.com', '083242233323', 5),
(3, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas1', 'Jl. Dorak, Selatpanjang1', 'budiono.115@gmail.com', '081275371724', 3),
(4, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas', 'tes', 'budiono.114@gmail.com', '081275371724', 5),
(8, '685767388af458b0b8a5043191629bb3', 'b', 'm', 'm@gmail.com', 'm', 9),
(9, '9b10fff33476b792f79cdcce22598a48', 'naufal', 'B', 'mursyidnaufal@gmail.com', '1234', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `static_content`, `gambar`) VALUES
(1, '<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">&nbsp;</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" style="background-color: #ffffff"><strong><font size="4">Belanjayuk</font></strong><font size="3"> , Menjual Bermacam-Macam barang kebutuhan anda, Mulai dari ,Backpack,Fashion,Cemilan,Shoes dan lain-lain Kami Juga menerima jasa service komputer,pembuatan website dan software komputer\r\n</font></font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">\r\nAlamat Toko :\r\n</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">\r\nJl. Manisi Kosan Albarokah</font></font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">\r\nCibiru Bandung Kota 14045</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">&nbsp;</font>\r\n</font>\r\n</p>\r\n<p class="mcevisualaid">\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">Kontak Kami :\r\n</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">Email &nbsp;: Belanjayuk11@gmail.com\r\n</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">Phone : 08991337413\r\n</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font color="#0000ff"><font face="times new roman, times" size="3" style="background-color: #ffffff">Line&nbsp;<span style="white-space: pre" class="Apple-tab-span">	</span>&nbsp; : Belanjayuk1\r\n</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font face="times new roman, times" size="3" style="background-color: #ffffff" color="#0000ff">Line@ : @kli1949u\r\n</font>\r\n</p>\r\n<p>\r\n<font face="times new roman, times" size="3" style="background-color: #ffffff" color="#ff0000">&nbsp;</font>\r\n</p>\r\n', 'L.png'),
(2, '<h3 style="font-family: &#39;Times New Roman&#39;"><strong style="background-color: #ffffff"><font size="2" color="#0000ff">01. PILIH PRODUK</font></strong></h3>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><span style="background-color: #ffffff"><font size="2" color="#0000ff">KLIK PRODUK YANG KAMU INGINKAN</font></span></h3>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<hr />\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><strong style="background-color: #ffffff"><font size="2" color="#0000ff">02. MASUKAN KE KERANJANG</font></strong></h3>\r\n<div style="font-family: &#39;Times New Roman&#39;">\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">Setelah kamu klik produk yang kamu pilih,kamu bisa lihat detail produk dan klik keranjang</span>\r\n</font>\r\n</p>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;\r\n</span>\r\n</font>\r\n</p>\r\n</div>\r\n<hr />\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><strong style="background-color: #ffffff"><font size="2" color="#0000ff">03. BELANJA KEMBALI</font></strong></h3>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<div style="font-family: &#39;Times New Roman&#39;">\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">\r\nJika kamu ingin meneruskan belanja tinggal klik lanjut belanja dan lakukan proses yang sama&nbsp;</span>\r\n</font>\r\n</p>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n</div>\r\n<hr />\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><strong style="background-color: #ffffff"><font size="2" color="#0000ff">04. SIGN IN</font></strong></h3>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<div style="font-family: &#39;Times New Roman&#39;">\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">\r\nBuat akun baru apabila kamu belum memiliki dan isi data yang sudah kami sediakan.jika sudah tidak melakukan login di form yang kami sediakan</span>\r\n</font>\r\n</p>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n</div>\r\n<hr />\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><strong style="background-color: #ffffff"><font size="2" color="#0000ff">05. CONFIRM ORDER</font></strong></h3>\r\n<p>\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<p style="font-family: &#39;Times New Roman&#39;">\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">\r\nLihat kembali produk apa saja yang sudah kamu beli dan lakukan konfirmasi ke kontak yang sudah kami sediakan dibawah</span>\r\n</font>\r\n</p>\r\n<p style="font-family: &#39;Times New Roman&#39;">\r\n<font size="2" color="#0000ff"><span style="background-color: #ffffff">&nbsp;</span>\r\n</font>\r\n</p>\r\n<hr />\r\n<h3 style="font-family: &#39;Times New Roman&#39;"><br />\r\n</h3>\r\n', ''),
(3, '<p>\r\nPembayaran dilakukan Melalui Rekening Toko Kami di bawah ini :\r\n</p>\r\n<p>\r\n<strong>BRI :1298173112</strong>\r\n</p>\r\n<p>\r\nA/n Â  : Muhammad Mursid Nuafal\r\n</p>\r\n<p>\r\n<strong>Mandiri : 403.0291.121</strong>\r\n</p>\r\n<p>\r\nA/n : Muhammad Mursid Naufal\r\n</p>\r\n<p>\r\n<strong>BNI : Â 211.8099.00.</strong>\r\n</p>\r\n<p>\r\nA/n : Muhammad Mursid Naufal\r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n<p>\r\nÂ \r\n</p>\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `status_order`, `tgl_order`, `jam_order`, `id_kustomer`) VALUES
(26, 'Lunas', '2015-12-08', '02:24:26', 9),
(27, 'Lunas', '2015-12-08', '02:34:34', 9),
(28, 'Baru', '2015-12-08', '04:49:37', 9),
(29, 'Baru', '2015-12-08', '04:59:40', 9),
(30, 'Baru', '2015-12-08', '05:00:34', 9),
(31, 'Baru', '2015-12-08', '05:56:26', 9),
(32, 'Baru', '2015-12-08', '05:57:35', 9),
(33, 'Baru', '2015-12-08', '06:05:01', 0),
(34, 'Baru', '2015-12-08', '06:05:41', 0),
(35, 'Baru', '2015-12-09', '14:16:48', 9),
(36, 'Baru', '2015-12-09', '14:17:28', 9),
(37, 'Lunas', '2015-12-09', '14:18:05', 9),
(38, 'Baru', '2015-12-09', '14:20:55', 9),
(39, 'Baru', '2015-12-09', '15:04:29', 9),
(40, 'Baru', '2015-12-09', '15:59:05', 9),
(41, 'Baru', '2015-12-09', '16:16:46', 9),
(42, 'Baru', '2015-12-09', '16:17:41', 9),
(43, 'Baru', '2015-12-10', '04:37:16', 9),
(44, 'Baru', '2015-12-10', '06:40:45', 9),
(45, 'Baru', '2015-12-10', '06:51:30', 9),
(46, 'Baru', '2015-12-10', '07:33:05', 9),
(47, 'Lunas', '2015-12-11', '01:16:50', 9),
(48, 'Baru', '2015-12-11', '01:17:11', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(26, 31, 1),
(26, 32, 1),
(27, 1, 1),
(28, 31, 1),
(30, 32, 1),
(31, 32, 1),
(32, 1, 2),
(33, 32, 1),
(34, 32, 2),
(35, 1, 1),
(36, 36, 1),
(37, 34, 3),
(39, 36, 1),
(40, 36, 1),
(43, 36, 1),
(44, 36, 1),
(46, 40, 1),
(47, 38, 1),
(48, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_temp`
--

INSERT INTO `orders_temp` (`id_orders_temp`, `id_produk`, `id_session`, `jumlah`, `tgl_order_temp`, `jam_order_temp`, `stok_temp`) VALUES
(202, 40, 'mursyidnaufal@gmail.com', 1, '2015-12-11', '02:18:25', 6),
(201, 41, 'mursyidnaufal@gmail.com', 1, '2015-12-11', '02:18:17', 7),
(203, 34, 'mursyidnaufal@gmail.com', 1, '2015-12-11', '02:18:32', 9),
(204, 42, 'mursyidnaufal@gmail.com', 1, '2015-12-11', '02:18:39', 3),
(205, 36, 'mursyidnaufal@gmail.com', 1, '2015-12-11', '02:18:50', 5);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(1, 1, 'FLORAL', 'TAS YANG NYAMAN UNTUK DI GUNAKAN BAGI PARA PECINTA TRAVELLER', 300000, 11, '1.00', '2015-12-08', '4floral.jpg', 4, 0),
(34, 16, 'Star Case', '<a style="color: #eb4800; text-decoration: none; outline: 0px; transition: all 0.2s linear; font-family: &#39;Open Sans&#39;, arial, tahoma, sans-serif; font-size: 12px; line-height: 20px; text-align: center" href="../../belanjayuk/index.php?mod=page&amp;pg=produk&amp;idkategori=2" class="category">Star Case iphone bahan hard doff halus nyaman untuk di genggam</a>\r\n', 30000, 9, '1.00', '2015-12-09', '9Start case.jpg', 4, 0),
(36, 17, 'Iphone 5', '<a style="text-decoration: none; outline: 0px; transition: all 0.2s linear; line-height: 20px; text-align: center" href="../../belanjayuk/index.php?mod=page&amp;pg=produk&amp;idkategori=4" class="category"><font face="times new roman, times" size="3" color="#000000">Produk terbaru dari Apple, dibekali dengan iOS7 menjadikan iphone produk terbaik dari apple</font></a>\r\n', 6000000, 5, '1.00', '2015-12-09', '6118iphone.jpg', 5, 5),
(38, 1, 'Get Gili', '<font face="times new roman, times" size="3"><span style="transition-duration: 0.2s; transition-timing-function: linear; transition-delay: initial; line-height: 20px; text-align: center">Backpack mini yang elegan dan nyaman untuk dipakai</span></font>\r\n', 150000, 7, '1.00', '2015-12-09', '279615151026172250_IMG_1695 1_tn.JPG', 2, 0),
(44, 1, 'Camo Pixel Green', '<font face="times new roman, times" size="3">Perbaduan warna hijau dan hitam membuat tas isi semakin nyaman untuk di gunakan.</font>\r\n', 350000, 4, '1.00', '2015-12-12', '53Camo pisel.jpg', 1, 10),
(40, 1, 'Get Canvas', '', 350000, 6, '1.00', '2015-12-09', '3445white.jpg', 1, 10),
(41, 19, 'Nike Running', '', 499000, 7, '1.00', '2015-12-10', '13Dai ahmad insaani(1).jpg', 1, 7),
(45, 1, 'Mandalika', '', 250000, 4, '1.00', '2015-12-14', '33151005184045_get 23_full.jpg', 1, 20),
(46, 1, 'SAMAS', '', 250000, 10, '1.00', '2015-12-14', '33151005204251_3_full.jpg', 1, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `hubungi`
--
ALTER TABLE `hubungi`
  ADD PRIMARY KEY (`id_hubungi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id_kustomer`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
  ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id_kustomer` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
  MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
