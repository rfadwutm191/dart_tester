import 'package:http/http.dart' as http;
import 'package:dart_tester/model/user.dart';

// function ambil data user dari server
Future<User> getUserById(int id) async {
  var alamat = Uri.parse("https://fakestoreapi.com/users/1");
  print("Sedang mengambil data user...");

  // error handler jika terjadi error
  try {
    // lakukan request http ke endpoint
    var respon = await http.get(alamat);
    // cek status code dari server
    if (respon.statusCode == 200) {
      User pengguna = User.fromJson(respon.body);
      return pengguna;
    } else {
      // jika gagal
      throw Exception("Gagal mengambil data");
    }
  } catch (e) {
    throw Exception("Terjadi kesalahan : $e");
  }
}