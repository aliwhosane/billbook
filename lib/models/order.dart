import 'package:billbook/models/cartItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String? id;
  Map<String, dynamic>? customer;
  List<dynamic>? cartItems;
  double? tax_rate;
  double? total_before_tax;

  static const ID = "id";
  static const CUSTOMER = "customer";
  static const CARTITEMS = "cartItems";
  static const TAXRATE = "tax_rate";
  static const TOTALBEFORETAX = "total_before_tax";

  Order(
      {this.id,
      this.customer,
      this.tax_rate = 5,
      this.cartItems,
      this.total_before_tax = 0});

  Order.setId(id) {
    this.id = id;
  }

  Order.fromMap(QueryDocumentSnapshot<Object?> data) {
    id = data.id;
    customer = data[CUSTOMER];
    cartItems = data[CARTITEMS];
    tax_rate = data[TAXRATE].toDouble();
    total_before_tax = data[TOTALBEFORETAX].toDouble();
  }

  Map toJson() => {
        id: id,
        customer: customer,
        cartItems: cartItems,
        tax_rate: tax_rate,
        total_before_tax: total_before_tax
      };
}
