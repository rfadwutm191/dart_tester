import 'package:dart_tester/model/produk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// // function untuk mengambil data produk ari API
// Future<void> ambilProduk() async {
//   // siapkan endpoint (url)
//   var alamat = Uri.parse("https://fakestoreapi.com/products/4");

//   print("Sedang mengambil data...");
//   // bungkus dengan eror handling
//   try {
//     // blok perintah yang dicoba dijalankan
//     // jika error lempar ke catch
//     var respon = await http.get(alamat);
//     if (respon.statusCode == 200) {
//       print("Ada respon dari server");
//       var hasil = jsonDecode(respon.body);
//       print(hasil["price"]);
//     } else {
//       print("Tidak ada respon");
//     }
//   } catch (e) {
//     print('Gagal : $e');
//   }
// }
class ProdukHelper {
  final Map<String, String> _header = {"Content-Type": "application/json"};

  Future<List<Produk>> getAllProduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);

        return (json as List)
            .map((item) => Produk.fromJson(item))
            .toList();
      } else {
        throw Exception("Error status code : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // UPDATE 
  Future<Produk> updateProduk(Produk p) async {
    var url = Uri.parse("https://fakestoreapi.com/products/${p.id}");
    try {
      var respon = await http.put(
        url,
        headers: _header,
        body: jsonEncode(p.toJson()),
      );

      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Produk.fromJson(json);
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // CREATE PRODUK 
  Future<int> createProduk(Produk p) async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.post(
        url,
        headers: _header,
        body: jsonEncode(p.toJson()),
      );

      if (respon.statusCode == 200 || respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // GET PRODUK BY ID
  Future<Produk> getProductById(int id) async {
    var url = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Produk.fromJson(json);
      } else {
        throw Exception("Error koneksi status : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}


// void main(List<String> arguments) {
//   ambilProduk();
// }
