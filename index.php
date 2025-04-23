<?php
include 'db/koneksi.php';
$query = mysqli_query($conn, "SELECT article.*, author.name, category.category_name 
    FROM article
    JOIN article_author ON article.id_article = article_author.id_article
    JOIN author ON article_author.id_author = author.id_author
    JOIN article_category ON article.id_article = article_category.id_article
    JOIN category ON article_category.id_category = category.id_category");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Blog Wisata Malang</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>📸 Blog Wisata Malang</h1>
        <p>Temukan destinasi menarik dan informatif dari database dinamis.</p>
    </header>

    <div class="card-container">
        <?php while ($data = mysqli_fetch_assoc($query)) { ?>
        <div class="card">
            <img src="pemweb_T/images/<?php echo $data['image']; ?>" alt="<?php echo $data['title']; ?>">
            <h2><?php echo $data['title']; ?></h2>
            <p class="info">Dipublikasikan: <?php echo $data['publish_date']; ?> | Penulis: <?php echo $data['name']; ?> | Kategori: <?php echo $data['category_name']; ?></p>
            <p><?php echo substr($data['content'], 0, 100); ?>...</p>
            <a href="detail.php?id=<?php echo $data['id_article']; ?>">Baca Selengkapnya</a>
        </div>
        <?php } ?>
    </div>

    <footer>
        <p>&copy; 2025 Blog Wisata | Dibuat untuk Tugas Pemrograman Web</p>
    </footer>
</body>
</html>
