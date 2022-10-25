import 'package:billbook/controller/cart_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/order.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> createOrderFormKey = GlobalKey<FormState>();
  final cartController = Get.find<CartController>();
  late TextEditingController customerNameController, locationController;
  var location, customerName;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("orders");
    customerNameController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    customerNameController.dispose();
    locationController.dispose();
  }

  String? validateName() {
    if (customerName == null) {
      return 'Please enter a product name';
    }
    if (customerName.length < 2) {
      return 'Name should be atleast 3 characters long';
    }
  }

  String? validateLocation() {
    if (location == null || location.length < 4) {
      return 'Enter Location name 4 characters long';
    }
  }

  Future<void> createOrder() async {
    final isValid = createOrderFormKey.currentState!.validate();
    if (!isValid) {
      print(createOrderFormKey.currentState.toString());
      return;
    }
    createOrderFormKey.currentState!.save();
    cartController.addCustomerName(customerName);
    cartController.addLocation(location);
    createOrderFormKey.currentState?.reset();
    var addedDoc = await collectionReference.add({
      'customer': {'name': customerName, 'location': location},
      'tax_rate': 5,
      'total_before_tax': 0,
      'cartItems': []
    });
    cartController.setOrderId(addedDoc.id);
    Get.toNamed('/details');
  }
}
