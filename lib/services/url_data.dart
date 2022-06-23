/// Jalankan laravel dengan perintah
/// php artisan serve --host="url yang akan digunakan" --port="port yang akan digunakan"
/// contoh: php artisan serve --host=192.168.43.158 --port=80

/// Sesuaikan url dengan host yang digunakan saat menjalankan laravel 
/// Bisa menggunakan IP address sendiri
String url = "http://192.168.43.158";

/// Sesuaikan port dengan port yang digunakan saat menjalankan laravel 
String port = "80";


/// Bagian dibawah ini ga perlu diubah
String baseUrl = url+":"+port+"/";

String baseApiUrl = baseUrl+"api/";