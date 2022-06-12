/// Jalankan laravel dengan perintah
/// php artisan serve --host="url yang akan digunakan" --port="port yang akan digunakan"
/// contoh: php artisan serve --host=127.0.0.1 --port=80

/// Sesuaikan URL yang digunakan saat menjalankan laravel 
String url = "http://192.168.43.158";

/// Sesuaikan Port yang digunakan saat menjalankan laravel 
String port = "80";

String baseUrl = url+":"+port+"/";

String baseApiUrl = baseUrl+"api/";