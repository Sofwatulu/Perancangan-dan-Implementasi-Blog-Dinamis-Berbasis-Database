<?php
include 'db/koneksi.php';

// Mendapatkan ID artikel dari URL
$id_article = $_GET['id'];

// Query untuk mengambil data artikel berdasarkan ID
$query = mysqli_query($conn, "SELECT article.*, author.name, category.category_name 
    FROM article
    JOIN article_author ON article.id_article = article_author.id_article
    JOIN author ON article_author.id_author = author.id_author
    JOIN article_category ON article.id_article = article_category.id_article
    JOIN category ON article_category.id_category = category.id_category
    WHERE article.id_article = $id_article");

// Jika artikel ditemukan, tampilkan
if ($data = mysqli_fetch_assoc($query)) {
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $data['title']; ?> - Blog Wisata Malang</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>📸 Blog Wisata Malang</h1>
        <p>Temukan destinasi menarik dan informatif dari database dinamis.</p>
    </header>

    <div class="detail-container">
        <h2><?php echo $data['title']; ?></h2>
        <p class="info">Dipublikasikan: <?php echo $data['publish_date']; ?> | Penulis: <?php echo $data['name']; ?> | Kategori: <?php echo $data['category_name']; ?></p>
        <img src="images/<?php echo $data['image']; ?>" alt="<?php echo $data['title']; ?>">
        <p><?php echo $data['content']; ?></p>
    </div>

    <footer>
        <p>&copy; 2025 Blog Wisata | Dibuat untuk Tugas Pemrograman Web</p>
    </footer>
</body>
</html>
<?php
} else {
    echo "Artikel tidak ditemukan!";
}
?>
