-- =================================================================================================
-- Retrive data dibawah ini bisa jalan jika file ../DML/mengubah-nama-kolom.sql sudah dijalankan.
-- =================================================================================================

-- Mengambil semua data dari tabel pelanggan
SELECT * FROM pelanggan;

-- Mengambil semua data dari tabel alamat
SELECT * FROM alamat;

-- Mengambil semua data dari tabel produk
SELECT * FROM produk;

-- Mengambil semua data dari tabel kategori
SELECT * FROM kategori;

-- Mengambil semua data dari tabel pesanan
SELECT * FROM pesanan;

-- Mengambil semua data dari tabel item_pesanan
SELECT * FROM item_pesanan;

-- Mengambil semua data dari tabel pembayaran
SELECT * FROM pembayaran;

-- Mengambil data pelanggan beserta alamatnya
SELECT pelanggan.id, pelanggan.nama, pelanggan.email, pelanggan.hp,
    CONCAT(alamat.desa, ', ', alamat.kecamatan, ', ', alamat.kabupaten, ', ', alamat.provinsi, ', ', alamat.kode_pos) AS alamat_lengkap
FROM pelanggan 
JOIN alamat ON pelanggan.id_alamat = alamat.id;

-- Mengambil data produk beserta kategorinya
SELECT produk.id, produk.nama_produk, 
    CONCAT('Rp', FORMAT(produk.harga, 0)) AS harga, 
    kategori.nama_kategori AS kategori 
FROM produk 
JOIN kategori ON produk.id_kategori = kategori.id;

-- Mengambil data pesanan beserta dengan pelanggan yang memesan dan produk yang dipesan serta menampilkan total dari produk dan harga.
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