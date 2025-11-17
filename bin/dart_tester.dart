import 'package:dart_tester/helper/carts_helper.dart';
import 'package:dart_tester/helper/produk_helper.dart';
import 'package:dart_tester/helper/user_helper.dart';
import 'package:dart_tester/model/user.dart';
import 'package:dart_tester/model/produk.dart';
import 'package:dart_tester/model/carts.dart';

void main(List<String> args) async {
  print("SEDANG MENGAMBIL DATA...");

  print("--------------------------------------------------------");

  List<dynamic> user = await UserHelper().getAllUser();
  print("Jumlah Users : ${user.length}");

  //membuat objek untuk menampung data user
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("Email :${pengguna.email}");

  //Membuat User baru
  User u = User(
    id: 10,
    username: "rfadw",
    email: "rfdw@gmail.com",
    password: "12345",
  );

  //Kirim data ke endpoint
  int idUserBaru = await UserHelper().createUser(u);
  print("id user yang baru dibuat : $idUserBaru");

  // mengundate user baru
  User up = User(
    id: 2,
    username: "cinta",
    email: "cinta12@gmail.com",
    password: "12345",
  );
  // Simpan hasil respon
  User hasil = await UserHelper().updateUser(up);
  print("Ini hasil update : $hasil");

  print("--------------------------------------------------------");

  // GET ALL PRODUCT
  List<dynamic> data = await ProdukHelper().getAllProduct();
  print("Jumlah produk : ${data.length}");

  // GET PRODUCT BY ID
  Produk p = await ProdukHelper().getProductById(1);
  print(p.title);
  print("price : ${p.price}");
  print("deskripsi : ${p.description}");
  print("kategori : ${p.category}");
  print("gambar : ${p.image}");

  // CREATE PRODUCT
  Produk produkBaru = Produk(
    id: 20,
    title: "Produk pakaian",
    price: 150.0,
    description: "Kemeja wishpie",
    category: "fashion",
    image: "https://i.pravatar.cc",
  );

  int idBaru = await ProdukHelper().createProduk(produkBaru);
  print("ID produk baru yang dibuat : $idBaru");

  // UPDATE PRODUCT
  Produk produkUpdate = Produk(
    id: 4,
    title: "Kulkas 2 pintu",
    price: 200.0,
    description: "Alat pendingin",
    category: "electronics",
    image: "https://i.pravatar.cc",
  );
  Produk hasilUpdate = await ProdukHelper().updateProduk(produkUpdate);
  print("Ini hasil update : $hasilUpdate");

  print("--------------------------------------------------------");

  Future<void> printCart(Cart cart) async {
    print("id       : ${cart.id}");
    print("userId   : ${cart.userId}");
    print("Products : [");

    for (var item in cart.products) {
      var p = await ProdukHelper().getProductById(item.productId);

      print("  {");
      print("Nama Produk : ${p.title}");
      print("Harga       : ${p.price}");
      print("Qty         : ${item.quantity}");
      print(" }");
    }

    print("]");
  }

  Cart cart1 = await CartsHelper().getCartById(1);
  await printCart(cart1);
}
