import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/order.dart';

class OrderhistoryController extends GetxController {
  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<Order> existingOrders = RxList<Order>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("orders");
    existingOrders.bindStream(getAllOrders());
  }

  Stream<List<Order>> getAllOrders() => collectionReference
      .snapshots()
      .map((query) => query.docs.map((item) => Order.fromMap(item)).toList());
}
