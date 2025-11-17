import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_tester/model/carts.dart';

class CartsHelper {
  final String baseUrl = "https://fakestoreapi.com/carts";
  final Map<String, String> _header = {"Content-Type": "application/json"};

  Future<List<Cart>> getAllCarts() async {
    var url = Uri.parse(baseUrl);
    try {
      var respon = await http.get(url);

      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return (json as List).map((item) => Cart.fromJson(item)).toList();
      } else {
        throw Exception("Error status code : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // GET CART BY ID
  Future<Cart> getCartById(int id) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var respon = await http.get(url);

      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Cart.fromJson(json);
      } else {
        throw Exception("Error status code : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // CREATE CART
  Future<int> createCart(Cart cart) async {
    var url = Uri.parse(baseUrl);
    try {
      var respon = await http.post(
        url,
        headers: _header,
        body: jsonEncode(cart.toJson()),
      );

      if (respon.statusCode == 200 || respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // UPDATE
  Future<Cart> updateCart(Cart cart) async {
    var url = Uri.parse("$baseUrl/${cart.id}");
    try {
      var respon = await http.put(
        url,
        headers: _header,
        body: jsonEncode(cart.toJson()),
      );

      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Cart.fromJson(json);
      } else {
        throw Exception("Error status code : ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}
