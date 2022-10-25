import 'package:billbook/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order item;
  OrderCard({Key? key, required this.item}) : super(key: key);
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
                      'CustomerName Name:' + item.customer!['name'],
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Order Amount: ' + item.total_before_tax.toString(),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Download PDF',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
