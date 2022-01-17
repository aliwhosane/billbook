import 'package:billbook/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _cartItems = List.empty(growable: true).obs;
  List get cartItems {
    return [..._cartItems];
  }

  int get count => _cartItems.length;
  double get cartTotal => _cartItems.fold(0, (sum, item) => sum += item.price);
  addToCart(product) {
    _cartItems.add(product);
  }

  clearCart() {
    this._cartItems.clear();
  }
}
