import 'package:billbook/controller/page/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(100),
          child: Form(
            key: homeController.createOrderFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: homeController.customerNameController,
                  onSaved: (value) {
                    homeController.customerName = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Customer Name')),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: homeController.locationController,
                  onSaved: (value) {
                    homeController.location = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Location')),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () => {homeController.createOrder()},
                    child: Text("Create Order")),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => {Get.toNamed('/orderHistory')},
                          child: Text('Order History'),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
