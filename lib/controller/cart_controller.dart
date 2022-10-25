import 'package:billbook/models/cartItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _orderId = ''.obs;
  var _customerName = ''.obs;
  var _location = ''.obs;
  var _cartItems = List.empty(growable: true).obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference orderRef;
  late CollectionReference productRef;
  late CollectionReference customerRef;

  @override
  void onInit() {
    super.onInit();
    orderRef = firebaseFirestore.collection("orders");
    productRef = firebaseFirestore.collection("products");
    customerRef = firebaseFirestore.collection("customers");
  }

  List<CartItem> get cartItems {
    return [..._cartItems];
  }

  int get count => _cartItems.length;
  double get cartTotal => _cartItems.fold(0, (sum, item) => sum += item.total);

  String get customerName => _customerName.toString();
  String get location => _location.toString();
  String get orderId => _orderId.toString();

  addCustomerName(name) {
    _customerName.value = name;
  }

  setOrderId(orderId) {
    _orderId.value = orderId;
  }

  addLocation(place) {
    _location.value = place;
  }

  addToCart(cartItem) async {
    var productToBeAdded = {
      "id": cartItem.product.id,
      "name": cartItem.product.name,
      "rate": cartItem.product.rate
    };
    _cartItems.add(cartItem);
    var addedProduct = await productRef.add(productToBeAdded);
    orderRef.doc(this.orderId).update({
      "cartItems": FieldValue.arrayUnion([productToBeAdded]),
      "total_before_tax": this.cartTotal
    });
  }

  removeFromCart(productId) async {
    var productToBeRemoved = await productRef
        .where('id', isEqualTo: productId)
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
    this._cartItems.removeWhere((element) => element.product.id == productId);
    orderRef.doc(this.orderId).update({
      "cartItems": FieldValue.arrayRemove(productToBeRemoved),
      "total_before_tax": this.cartTotal
    });
  }

  clearCart() {
    this._cartItems.clear();
  }
}
