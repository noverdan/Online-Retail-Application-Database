-- Menambahkan data alamat
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

-- Menambahkan data pelanggan
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

-- Menambahkan data kategori
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

-- Menambahkan data produk
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
    ('Kompor Gas', 350000, 10),
    ('Piring', 35000, 10);

-- menambahkan data pembayaran
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

-- menambahkan data pesanan
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

-- menambahkan data item_pesanan
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