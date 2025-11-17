import 'dart:convert';

import 'package:dart_tester/model/user.dart';
import 'package:http/http.dart' as http;

class UserHelper {
  final Map<String, String> _header = {"Content-type": "application/json"};

  // method mendapatkan semua data user
  Future<List<dynamic>> getAllUser() async {
    var url = Uri.parse("https://fakestoreapi.com/users");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        // konversi respon body menjadi dynamic
        var json = jsonDecode(respon.body);

        // tester return
        return json.map((item) => User.fromMap(item)).toList();
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method update
  Future<User> updateUser(User u) async {
    var url = Uri.parse("https://fakestoreapi.com/users/${u.id}");
    try {
      var respon = await http.put(
        url,
        headers: _header,
        body: jsonEncode(u.toMap()),
      );
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return User.fromMap(json);
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method membuat user baru
  Future<int> createUser(User u) async {
    var url = Uri.parse("https://fakestoreapi.com/users");
    try {
      var respon = await http.post(
        url,
        headers: _header,
        body: jsonEncode(u.toMap()),
      );
      if (respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method ambil data user berdasarkan id
  Future<User> getUserById(int id) async {
    var url = Uri.parse("https://fakestoreapi.com/users/$id");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        // konversi respon ke format map
        var json = jsonDecode(respon.body);
        // konversi menjadi object user
        return User.fromMap(json);
      } else {
        int kode = respon.statusCode;
        throw Exception("Error koneksi status : $kode");
      }
    } catch (e) {
      throw Exception(" Error : $e");
    }
  }
}
