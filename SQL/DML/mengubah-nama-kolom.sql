-- Mengubah nama kolom, untuk mengatasi ambiguitas
ALTER TABLE kategori
CHANGE nama nama_kategori VARCHAR(50);

ALTER TABLE produk
CHANGE nama nama_produk VARCHAR(255);
