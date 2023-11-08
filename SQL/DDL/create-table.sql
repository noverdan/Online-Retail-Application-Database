-- tabel alamat
CREATE TABLE alamat(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    desa VARCHAR(50),
    kecamatan VARCHAR(50),
    kabupaten VARCHAR(50),
    provinsi VARCHAR(50),
    kode_pos INT(5)
);

-- tabel pelanggan
CREATE TABLE pelanggan(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    hp INT(13) NOT NULL,
    id_alamat INT,
    FOREIGN KEY (id_alamat) REFERENCES alamat(id)
);

-- tabel pembayaran
CREATE TABLE pembayaran(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    provider VARCHAR(50) NOT NULL
);

-- tabel pesanan
CREATE TABLE pesanan(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    id_pembayaran INT,
    tanggal_pesan DATE NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id),
    FOREIGN KEY (id_pembayaran) REFERENCES pembayaran(id)
);

-- tabel kategori
CREATE TABLE kategori(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50) NOT NULL
);

-- tabel product
CREATE TABLE produk(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    harga INT NOT NULL,
    id_kategori INT,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id)
);

-- tabel item_pesanan
CREATE TABLE item_pesanan(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pesanan INT,
    id_produk INT,
    kuantitas INT NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id),
    FOREIGN KEY (id_produk) REFERENCES produk(id)
);