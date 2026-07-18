# Backup Otomatis Google Drive ke Server Lokal dan ZIP

Script Bash ini berfungsi untuk mengunduh folder tertentu dari Google Drive ke harddisk lokal server Ubuntu menggunakan Rclone, lalu membungkusnya menjadi file ZIP setiap hari.

Sistem ini menggunakan metode copy (bukan sync), sehingga file di server tetap aman meskipun file di Google Drive utama tidak sengaja terhapus.

## Fitur
- Backup aman: File di server tidak ikut terhapus jika file di cloud hilang.
- Arsip harian: Hasil backup otomatis dikompres menjadi file .zip terpisah berdasarkan tanggal hari itu.
- Filter data: Hanya mengunduh folder yang didaftarkan aja, sehingga menghemat ruang penyimpanan.

## Cara Penggunaan

1. Siapkan Rclone
Pastikan Rclone sudah terinstall di server Ubuntu dan sudah terhubung ke akun Google Drive Anda via perintah rclone config.

2. Buat Daftar Folder Target
Buat file teks di /home/user/daftar_folder.txt dan isi dengan nama folder Google Drive yang ingin dibackup:
/Nama Folder Satu/**
/Nama Folder Dua/**

3. Atur Skrip
Unduh file backup_gdrive.sh dari repositori ini, lalu buka dengan text editor. Sesuaikan variabel di bagian atas skrip dengan konfigurasi server anda (nama remote Rclone, folder tujuan, dan lokasi file filter).

Aktifkan izin eksekusi script dengan perintah:
chmod +x backup_gdrive.sh

4. Atur Jadwal Otomatis
Buka penjadwal tugas Linux dengan perintah:
crontab -e

Tambahkan baris berikut di paling bawah agar skrip berjalan otomatis setiap jam 11 malam:
0 23 * * * /jalur/ke/file/backup_gdrive.sh

Selesai. Server akan berjalan otomatis setiap malam tanpa perlu dipantau manual.
