# Tugas 5 Mobile Developer

Project ini dibuat untuk latihan Routing dan Navigation di Flutter. Aplikasinya
sederhana: halaman awal menampilkan beberapa katalog, lalu saat salah satu item
diklik aplikasi akan pindah ke halaman detail.

## Isi Aplikasi

Di halaman beranda ada 3 katalog yang ditampilkan dalam bentuk card. Setiap card
bisa ditekan dan akan membuka halaman detail menggunakan `Navigator.push`.

Di halaman detail, data katalog ditampilkan lebih lengkap. Ada icon, nama katalog,
harga, deskripsi singkat, dan tombol `Follow`. Tombol ini bisa berubah menjadi
`Following`, jadi halaman detail dibuat sebagai `StatefulWidget`.

## Struktur Utama

- `lib/screens/home_screen.dart`: Screen 1 atau beranda katalog. File ini memakai
  `StatelessWidget`, `ListView`, dan 3 card katalog.
- `lib/screens/catalog_detail_screen.dart`: Screen 2 atau detail katalog. File ini
  memakai `StatefulWidget`, `Column`, AppBar, icon kembali, data katalog, container
  deskripsi pastel, dan perubahan state tombol.
- `lib/data/catalog_items.dart`: Data dummy untuk 3 katalog yang tampil di beranda.

## Cara Menjalankan

Pertama ambil dependency Flutter:

```bash
flutter pub get
```

Lalu jalankan aplikasinya:

```bash
flutter run
```

Kalau mau dibuka lewat Chrome:

```bash
flutter run -d chrome
```

## Test

Untuk menjalankan test:

```bash
flutter test
```

## Catatan Database

Untuk tugas ini belum memakai database MySQL. Data katalog masih dibuat langsung
di file `lib/data/catalog_items.dart`, jadi aplikasi bisa langsung dijalankan tanpa
setup database.

Kalau nanti perlu import database MySQL, biasanya perintahnya seperti ini:

```bash
mysql -u root -p nama_database < database.sql
```
