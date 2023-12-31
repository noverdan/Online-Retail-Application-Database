CREATE DATABASE online_retail;

-- Start Membuat Tabel
CREATE TABLE alamat(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
desa VARCHAR(50),
kecamatan VARCHAR(50),
kabupaten VARCHAR(50),
provinsi VARCHAR(50),
kode_pos INT(5)
);

CREATE TABLE pelanggan(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR(255) NOT NULL,
email VARCHAR(50) NOT NULL,
hp BIGINT(15) NOT NULL,
id_alamat INT,
FOREIGN KEY (id_alamat) REFERENCES alamat(id)
);

CREATE TABLE pembayaran(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
provider VARCHAR(50) NOT NULL
);

CREATE TABLE pesanan(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_pelanggan INT,
id_pembayaran INT,
tanggal_pesan DATE NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id),
FOREIGN KEY (id_pembayaran) REFERENCES pembayaran(id)
);

CREATE TABLE kategori(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR(50) NOT NULL
);

CREATE TABLE produk(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR(255) NOT NULL,
harga INT NOT NULL,
id_kategori INT,
FOREIGN KEY (id_kategori) REFERENCES kategori(id)
);

CREATE TABLE item_pesanan(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_pesanan INT,
id_produk INT,
kuantitas INT NOT NULL,
FOREIGN KEY (id_pesanan) REFERENCES pesanan(id),
FOREIGN KEY (id_produk) REFERENCES produk(id)
);
-- End Membuat Tabel


-- Start Menambahkan Values ke Tabel
INSERT INTO alamat (desa, kecamatan, kabupaten, provinsi, kode_pos) VALUES
('Desa Mulyorejo', 'Kecamatan Jati', 'Kabupaten Merdeka', 'Jawa Tengah', '40121'),
('Desa Cikarang', 'Kecamatan Citra', 'Kabupaten Mandiri', 'Jawa Tengah', '50132'),
('Desa Sarijadi', 'Kecamatan Mekar', 'Kabupaten Sejahtera', 'Jawa Tengah', '60145'),
('Desa Gunung Sari', 'Kecamatan Gunung', 'Kabupaten Damai', 'Jawa Tengah', '80123'),
('Desa Majapahit', 'Kecamatan Singosari', 'Kabupaten Malang', 'Jawa Tengah', '65147'),
('Desa Kertanegara', 'Kecamatan Singaraja', 'Kabupaten Buleleng', 'Jawa Tengah', '81112'),
('Desa Tirta Jaya', 'Kecamatan Tirtayasa', 'Kabupaten Maju', 'Jawa Tengah', '42121'),
('Desa Puri Indah', 'Kecamatan Puri', 'Kabupaten Indah', 'Jawa Tengah', '30123'),
('Desa Bumi Ayu', 'Kecamatan Bumi', 'Kabupaten Asri', 'Jawa Tengah', '75123'),
('Desa Alam Sari', 'Kecamatan Alam', 'Kabupaten Sari', 'Jawa Tengah', '90123');

INSERT INTO pelanggan (nama, email, hp, id_alamat) VALUES
('John Doe', 'johndoe@example.com', 62123456789, 1),
('Jane Smith', 'janesmith@example.com', 62234567890, 2),
('Michael Johnson', 'michaeljohnson@example.com', 62345678901, 3),
('Emily Davis', 'emilydavis@example.com', 62456789012, 4),
('David Wilson', 'davidwilson@example.com', 62567890123, 5),
('Sarah Martinez', 'sarahmartinez@example.com', 62678901234, 6),
('Christopher Brown', 'christopherbrown@example.com', 62789012345, 7),
('Amanda Lee', 'amandalee@example.com', 62890123456, 8),
('Daniel Clark', 'danielclark@example.com', 62901234567, 9),
('Jessica Hall', 'jessicahall@example.com', 62012345678, 10);

INSERT INTO kategori (nama) VALUES
('Pakaian Wanita'),
('Pakaian Pria'),
('Sepatu dan Sandal'),
('Tas dan Koper'),
('Perhiasan'),
('Elektronik'),
('Kesehatan dan Kecantikan'),
('Mainan dan Games'),
('Otomotif'),
('Perlengkapan Rumah Tangga');

INSERT INTO produk (nama, harga, id_kategori) VALUES
('Baju Batik', 150000, 1),
('Gaun Pesta', 300000, 1),
('Kemeja Lengan Panjang', 120000, 2),
('Celana Jeans', 180000, 2),
('Sandal Santai', 80000, 3),
('Sepatu Olahraga', 200000, 3),
('Tas Tangan Kulit', 250000, 4),
('Ransel Sekolah', 150000, 4),
('Cincin Perak', 500000, 5),
('Kalung Berlian', 1000000, 5),
('Laptop ASUS', 6000000, 6),
('Smartphone Samsung', 3500000, 6),
('Lipstik Matte', 80000, 7),
('Krim Malam', 120000, 7),
('Mainan Robot Edukatif', 250000, 8),
('Puzzle Kayu', 100000, 8),
('Oli Mobil', 50000, 9),
('Sarung Jok Motor', 70000, 9),
('Panci Aluminium', 90000, 10),
('Set Peralatan Makan', 75000, 10),
('Kaos Polo', 100000, 1),
('Jas Pria', 500000, 2),
('Sepatu Boots', 250000, 3),
('Tas Selempang', 70000, 4),
('Anting Emas', 400000, 5),
('Kamera Canon', 2000000, 6),
('Parfum Floral', 180000, 7),
('Mainan Mobil Remote', 120000, 8),
('Ban Mobil', 300000, 9),
('Kompor Gas', 350000, 10);

INSERT INTO pembayaran(provider) VALUES
('BRI VA/Transfer'),
('BCA VA/Transfer'),
('BNI VA/Transfer'),
('Mandiri VA/Transfer'),
('Dana'),
('OVO'),
('GoPay'),
('ShopeePay'),
('Qris'),
('Bayar Ditempat');

INSERT INTO pesanan(id_pelanggan, id_pembayaran, tanggal_pesan) VALUES
(1, 5, '2023-09-10'),
(1, 1, '2023-09-12'),
(2, 6, '2023-09-15'),
(3, 2, '2023-09-19'),
(4, 3, '2023-09-20'),
(3, 5, '2023-09-25'),
(5, 10, '2023-09-29'),
(6, 8, '2023-09-30'),
(2, 4, '2023-10-01'),
(7, 7, '2023-10-03'),
(8, 9, '2023-10-05'),
(9, 8, '2023-10-08'),
(10, 4, '2023-10-10'),
(7, 5, '2023-10-12'),
(8, 6, '2023-10-15'),
(5, 2, '2023-10-17');

INSERT INTO item_pesanan(id_pesanan, id_produk, kuantitas) VALUES
(1, 17, 1),
(1, 23, 1),
(2, 6, 1),
(3, 9, 1),
(4, 11, 1),
(5, 1, 1),
(5, 5, 2),
(5, 8, 1),
(6, 24, 1),
(6, 21, 3),
(7, 22, 1),
(7, 8, 1),
(8, 13, 2),
(8, 2, 1),
(9, 14, 1),
(9, 13, 1),
(10, 12, 1),
(11, 25, 1),
(11, 7, 1),
(12, 3, 2),
(12, 4, 1),
(13, 10, 1),
(13, 13, 1),
(14, 18, 2),
(14, 19, 1),
(14, 20, 1),
(15, 11, 1),
(16, 7, 1),
(16, 21, 5),
(16, 26, 1),
(16, 5, 2),
(16, 4, 1);
-- End Menambahkan Values ke Tabel

-- start Mengubah nama kolom yang ambigu
ALTER TABLE kategori
CHANGE nama nama_kategori VARCHAR(50);

ALTER TABLE produk
CHANGE nama nama_produk VARCHAR(255);
-- End mengubah nama kolom


-- Start Retrive data from tabel
SELECT * FROM pelanggan;

SELECT * FROM alamat;

SELECT * FROM produk;

SELECT * FROM kategori;

SELECT * FROM pesanan;

SELECT * FROM item_pesanan;

SELECT * FROM pembayaran;

SELECT pelanggan.id, pelanggan.nama, pelanggan.email, pelanggan.hp,
       CONCAT(alamat.desa, ', ', alamat.kecamatan, ', ', alamat.kabupaten, ', ', alamat.provinsi, ', ', alamat.kode_pos) AS alamat_lengkap
FROM pelanggan 
JOIN alamat ON pelanggan.id_alamat = alamat.id;

SELECT produk.id, produk.nama_produk, 
       CONCAT('Rp', FORMAT(produk.harga, 0)) AS harga, 
       kategori.nama_kategori AS kategori 
FROM produk 
JOIN kategori ON produk.id_kategori = kategori.id;

SELECT pesanan.id, 
       pelanggan.nama AS pelanggan, 
       GROUP_CONCAT(CONCAT(produk.nama_produk, '[',CONCAT('Rp', FORMAT(produk.harga, 0)),'*',item_pesanan.kuantitas,']')) AS produk,
       SUM(item_pesanan.kuantitas) AS total_produk,
       CONCAT('Rp', FORMAT(SUM(produk.harga * item_pesanan.kuantitas) , 0)) AS total_harga,
       pembayaran.provider AS pembayaran, 
       pesanan.tanggal_pesan
FROM pesanan
JOIN item_pesanan ON pesanan.id = item_pesanan.id_pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id
JOIN pembayaran ON pesanan.id_pembayaran = pembayaran.id
JOIN produk ON item_pesanan.id_produk = produk.id
GROUP BY pesanan.id;
-- End Retrive data from tabel

-- Start Mengubah values data Tabel
UPDATE pelanggan
SET nama = 'Galang Arsandy', email = 'glangarsandy@gmail.com', hp = 6285157994646
WHERE id = 1;

UPDATE alamat
SET desa = 'Desa Perubahan', kecamatan = 'Kecamatan Baru-Baru'
WHERE id = 1;

UPDATE produk
SET harga = 7000000
WHERE id = 11;
-- End Mengubah values data Tabel

-- Start Menghapus data values Tabel
DELETE FROM pelanggan WHERE id = 1;
DELETE FROM alamat WHERE id = 1;

DELETE FROM produk WHERE id = 10;

DELETE FROM pesanan;
DELETE FROM item_pesanan;
-- End Menghapus data values Tabel

-- Start menghapus tabel
DROP TABLE alamat;
DROP TABLE pelanggan;
DROP TABLE kategori;
DROP TABLE produk;
DROP TABLE item_pesanan;
DROP TABLE pembayaran;
DROP TABLE pesanan;
-- End menghapus tabel

-- Delete database
DROP DATABASE online_retail;