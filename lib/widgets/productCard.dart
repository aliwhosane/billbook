import 'package:billbook/controller/cart_controller.dart';
import 'package:billbook/models/cartItem.dart';
import 'package:billbook/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final CartItem item;
  ProductCard({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.parse('20'),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(20)),
        // border: Border.all(width: 1, color: Colors.black12)),
        // // margin: EdgeInsets.all(20),
        // child: Padding(
        //   padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name: ' + item.product.name,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Product Rate: ' + item.product.rate.toString(),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Product Quantity: ' + item.quantity.toString(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Cost: ' + item.total.toString(),
                    )
                  ],
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      cartController.removeFromCart(item.product.id);
                    },
                    child: Text('Remove')),
              ],
            )
          ],
        ),
        // ),
      ),
    );
  }
}
