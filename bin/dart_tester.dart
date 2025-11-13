// import 'package:dart_tester/helper/produk_helper.dart';
import 'package:dart_tester/helper/user_helper.dart' as users;
import 'package:dart_tester/model/user.dart';

void main(List<String> args) async {
  // ambilProduk();
  print("Ambil data dari user...");
  User pengguna = await users.getUserById(5);
  print(pengguna.email);
}
