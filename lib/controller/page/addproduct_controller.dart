import 'package:billbook/controller/cart_controller.dart';
import 'package:billbook/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();
  final cartController = Get.find<CartController>();
  late TextEditingController productNameController,
      productRateController,
      productQuantityController;
  var productName, productRate, productQuantity;
  @override
  void onInit() {
    super.onInit();
    productNameController = TextEditingController();
    productQuantityController = TextEditingController();
    productRateController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    productNameController.dispose();
    productRateController.dispose();
    productQuantityController.dispose();
  }

  String? validateName() {
    if (productName == null) {
      return 'Please enter a product name';
    }
    if (productName.length < 4) {
      return 'Name should be atleast 4 characters long';
    }
  }

  String? validateQuantity() {
    if (productQuantity == null || productQuantity == 0) {
      return 'Minimum quantity to add a product is 1';
    }
  }

  String? validateRate() {
    if (productRate == null || productRate == 0) {
      return 'Minimum rate to add a product is 1';
    }
  }

  void addProduct() {
    final isValid = addProductFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addProductFormKey.currentState!.save();
    var product = Product(name: productName, price: productRate);
    for (var i = 0; i < int.parse(productQuantity); i++) {
      cartController.addToCart(product);
    }
    // addProductFormKey.currentState?.dispose();
  }
}
