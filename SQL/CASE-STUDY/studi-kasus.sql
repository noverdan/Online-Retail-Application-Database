
-- NO 1
-- 1 pelanggan membeli 3 barang yang berbeda.

-- pelanggan dengan id_pelanggan = 1 melakukan pemesanan dengan id_pembayaran = 3, pada tgl = 10 Nov 2023. id pesanannya = 1111
INSERT INTO pesanan(id, id_pelanggan, id_pembayaran, tanggal_pesan) VALUES
    (1111, 1, 3, '2023-11-10');
-- pesanan dengan id = 1111 memiliki item_produk yang dipesan yaitu produk dengan id = (21 sebanyak 3), (4 sebanyak 1), (22 sebanyak 1). 
INSERT INTO item_pesanan(id_pesanan, id_produk, kuantitas) VALUES
    (1111, 21, 3),
    (1111, 4, 1),
    (1111, 22, 1);
-- Kemudian ambil dan tampilkan data pesanan dengan id = 1111 beserta produk-produk yang dipesan dan total harga-nya
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
    WHERE pesanan.id = 1111
    GROUP BY pesanan.id;

-- ============================================================================================
-- ============================================================================================

-- NO 2
-- Melihat 3 produk yang paling sering dibeli oleh pelanggan.
SELECT id_produk, nama_produk, SUM(kuantitas) AS total_terjual
    FROM item_pesanan
    JOIN produk ON item_pesanan.id_produk = produk.id
    GROUP BY id_produk
    ORDER BY SUM(kuantitas) DESC
    LIMIT 3;

-- ============================================================================================
-- ============================================================================================

-- NO 3
-- Melihat Kategori barang yang paling banyak barangnya.
SELECT kategori.nama_kategori, COUNT(produk.id_kategori) AS total_produk
    FROM produk
    JOIN kategori ON produk.id_kategori = kategori.id
    GROUP BY kategori.id
    ORDER BY COUNT(produk.id_kategori) DESC;

-- ============================================================================================
-- ============================================================================================

-- NO 4
-- Nominal rata-rata transaksi yang dilakukan oleh pelanggan dalam 1 bulan terakhir.
SELECT nama_pelanggan, CONCAT('Rp', FORMAT(AVG(total_harga),0)) AS rata_transaksi_1_bulan_terakhir
    FROM (
        SELECT SUM(produk.harga * item_pesanan.kuantitas) AS total_harga,
        pelanggan.nama AS nama_pelanggan
        FROM pesanan
        JOIN item_pesanan ON pesanan.id = item_pesanan.id_pesanan
        JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id
        JOIN produk ON item_pesanan.id_produk = produk.id
        WHERE pesanan.tanggal_pesan >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
        AND  pesanan.id_pelanggan = 8 -- ditampilkan berdasarkan id pelanggan
        GROUP BY pesanan.id
    )AS rata_transaksi_1_bulan_terakhir;