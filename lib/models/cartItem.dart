import 'package:billbook/models/product.dart';

class CartItem {
  Product product;
  double quantity;
  double total;
  String id;

  static const ID = "id";
  static const PRODUCT = "product";
  static const QUANTITY = "quantity";

  CartItem(
      {required this.product,
      required this.quantity,
      required this.id,
      this.total = 0});

  // CartItem.fromMap(Map<String, dynamic> data) {
  //   id = data[ID];
  //   product = data[PRODUCT];
  //   quantity = data[QUANTITY];
  //   cost = data[COST].toDouble();
  // }
  //
  // Map toJson() => {
  //       ID: id,
  //       QUANTITY: quantity,
  //       COST: product.price * quantity,
  //       product: product
  //     };
}
