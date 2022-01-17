import 'package:billbook/controller/page/addproduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  final addProductController = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Form(
                key: addProductController.addProductFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text('Product Name')),
                      controller: addProductController.productNameController,
                      onSaved: (value) {
                        addProductController.productName = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text('Product Quantity')),
                      controller:
                          addProductController.productQuantityController,
                      onSaved: (value) {
                        addProductController.productQuantity = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text('Product Price')),
                      controller: addProductController.productRateController,
                      onSaved: (value) {
                        addProductController.productRate = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              addProductController.addProduct();
                            },
                            child: Text('Add')),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'))
                      ],
                    )
                  ],
                ))),
      ),
    );
    throw UnimplementedError();
  }
}
