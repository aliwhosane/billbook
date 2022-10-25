import 'package:billbook/widgets/orderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:billbook/controller/page/orderhistory_controller.dart';

class OrderHistoryScreen extends GetView<OrderhistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.existingOrders.length,
            itemBuilder: (context, index) =>
                OrderCard(item: controller.existingOrders[index]))));
  }
}
