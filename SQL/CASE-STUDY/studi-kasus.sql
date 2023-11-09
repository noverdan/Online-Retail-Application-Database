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