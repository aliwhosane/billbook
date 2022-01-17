import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is home screen nigga"),
              TextButton(
                  onPressed: () => Get.toNamed('/details'),
                  child: Text("Go to Add Page")),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
