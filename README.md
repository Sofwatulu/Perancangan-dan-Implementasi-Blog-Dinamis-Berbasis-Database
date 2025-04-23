# Blog Wisata Malang

Ini adalah proyek blog dinamis tentang wisata dan kuliner, yang dibuat menggunakan PHP, MySQL, dan HTML/CSS. Proyek ini mencakup halaman utama dengan daftar artikel serta halaman detail untuk setiap artikel. Gambar, penulis, dan kategori artikel diambil dari database MySQL yang diatur untuk memberikan pengalaman dinamis.

## Struktur Database

### Tabel `article`
Tabel ini menyimpan informasi tentang artikel yang dipublikasikan di blog.

| Nama Kolom    | Tipe Data        | Deskripsi                              |
|---------------|------------------|----------------------------------------|
| `id_article`  | `INT`            | ID unik untuk setiap artikel           |
| `title`       | `VARCHAR(255)`    | Judul artikel                          |
| `content`     | `TEXT`           | Isi konten artikel                     |
| `image`       | `VARCHAR(255)`    | Nama file gambar yang terkait dengan artikel |
| `publish_date`| `DATE`           | Tanggal publikasi artikel              |

### Tabel `author`
Tabel ini menyimpan informasi tentang penulis artikel.

| Nama Kolom   | Tipe Data      | Deskripsi                              |
|--------------|----------------|----------------------------------------|
| `id_author`  | `INT`          | ID unik untuk setiap penulis           |
| `name`       | `VARCHAR(100)` | Nama penulis                           |

### Tabel `category`
Tabel ini menyimpan kategori yang terkait dengan artikel.

| Nama Kolom      | Tipe Data      | Deskripsi                               |
|-----------------|----------------|-----------------------------------------|
| `id_category`   | `INT`          | ID unik untuk setiap kategori           |
| `category_name` | `VARCHAR(100)` | Nama kategori (misalnya, Wisata atau Kuliner) |

### Tabel `article_author`
Tabel ini menghubungkan artikel dengan penulis.

| Nama Kolom    | Tipe Data      | Deskripsi                                   |
|---------------|----------------|---------------------------------------------|
| `id_article`  | `INT`          | ID artikel (relasi dengan tabel `article`)  |
| `id_author`   | `INT`          | ID penulis (relasi dengan tabel `author`)   |

### Tabel `article_category`
Tabel ini menghubungkan artikel dengan kategori.

| Nama Kolom    | Tipe Data      | Deskripsi                                   |
|---------------|----------------|---------------------------------------------|
| `id_article`  | `INT`          | ID artikel (relasi dengan tabel `article`)  |
| `id_category` | `INT`          | ID kategori (relasi dengan tabel `category`)|

## Cara Menjalankan Query

1. **Menjalankan Query untuk Menampilkan Artikel**  
   Untuk menampilkan daftar artikel, Anda bisa menjalankan query berikut:

   ```sql
   SELECT article.*, author.name, category.category_name
   FROM article
   JOIN article_author ON article.id_article = article_author.id_article
   JOIN author ON article_author.id_author = author.id_author
   JOIN article_category ON article.id_article = article_category.id_article
   JOIN category ON article_category.id_category = category.id_category;

Query ini akan mengambil semua artikel, beserta nama penulis dan kategori yang terkait.

Menambahkan Artikel Baru
Untuk menambahkan artikel baru ke dalam tabel article, Anda bisa menggunakan query seperti berikut:
INSERT INTO article (title, content, image, publish_date)
VALUES ('Judul Artikel', 'Isi artikel...', 'gambar.jpg', '2025-04-23');

Setelah itu, Anda bisa menambahkan relasi dengan penulis dan kategori di tabel article_author dan article_category:
INSERT INTO article_author (id_article, id_author)
VALUES (1, 1);  -- Relasikan artikel pertama dengan penulis pertama

INSERT INTO article_category (id_article, id_category)
VALUES (1, 1);  -- Relasikan artikel pertama dengan kategori pertama

# Deskripsi Template Web
Website ini menggunakan desain minimalis dan responsif, menggunakan HTML dan CSS untuk tampilan depan dan PHP untuk mengambil data dari database.

# Struktur Halaman
## Halaman Utama (index.php)
1. Menampilkan daftar artikel dari database.
2. Setiap artikel menampilkan gambar, judul, tanggal publikasi, penulis, dan kategori.
3. Tautan Baca Selengkapnya mengarah ke halaman detail artikel.

## Halaman Detail (detail.php)
1. Menampilkan konten lengkap artikel.
2. Gambar artikel ditampilkan di atas konten.
3. Menampilkan nama penulis dan kategori artikel.

# Desain CSS
1. Header dan Footer: Digunakan warna latar belakang biru dengan teks putih untuk bagian header dan footer.
2. Card untuk Artikel: Artikel ditampilkan dalam bentuk "card" dengan gambar di bagian atas, judul artikel, dan informasi singkat di bawahnya.
3. Responsif: Menggunakan flexbox untuk menampilkan artikel dengan tata letak yang responsif. Artikel akan ditata dalam grid pada ukuran layar yang lebih besar dan ditampilkan secara vertikal pada ukuran layar kecil.

# Struktur CSS:
1. File CSS utama (style.css) mengatur tampilan halaman utama dan detail, dengan desain sebagai berikut:
2. Font: Menggunakan font Arial, sans-serif.
3. Warna Latar Belakang: Background halaman utama adalah warna #f0f2f5, dengan header dan footer berwarna biru (#0077b6).
4. Tata Letak: Artikel ditata dalam kolom menggunakan flexbox. Gambar artikel menggunakan ukuran 100% untuk memastikan responsif.

# Cara Menjalankan Website
1. Pastikan Anda telah menginstal XAMPP atau LAMP untuk menjalankan server lokal.
2. Pindahkan proyek ke dalam folder htdocs jika menggunakan XAMPP.
3. Jalankan Apache dan MySQL di XAMPP Control Panel.
4. Akses website melalui browser di http://localhost/pemweb_T/.