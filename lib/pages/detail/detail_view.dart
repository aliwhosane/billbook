import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class DetailScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${cartController.cartItems}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/addProduct');
                    },
                    child: Text(
                      "Add Product",
                    )),
                TextButton(
                    onPressed: () {
                      cartController.clearCart();
                    },
                    child: Text("Clear Cart"))
              ],
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
