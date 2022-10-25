import 'package:billbook/models/product.dart';
import 'package:billbook/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../api/pdfInvoiceApi.dart';
import '../../api/pdf_api.dart';
import '../../controller/cart_controller.dart';

class DetailScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    print('Save as file...');
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  // final actions = <PdfPreviewAction>[
  //   if (!kIsWeb)
  //     PdfPreviewAction(
  //       icon: const Icon(Icons.save),
  //       onPressed: _saveAsFile,
  //     )
  // ];

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
            Obx(() => Text(
                  'Order ID: ' + cartController.orderId,
                  style: TextStyle(fontSize: 14),
                )),
            Obx(() => Text(
                  'Customer Name: ' + cartController.customerName,
                  style: TextStyle(fontSize: 18),
                )),
            Obx(() => Text('Location: ' + cartController.location,
                style: TextStyle(fontSize: 18))),
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: Obx(
                  () => ListView.builder(
                      itemCount: cartController.count,
                      itemBuilder: (context, i) {
                        final items = cartController.cartItems;
                        return ProductCard(item: items[i]);
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Obx(() => Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Order Total: ${cartController.cartTotal.toString()}',
                    style: TextStyle(fontSize: 24),
                  ))),
            ),
            SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Row(
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
              ),
            ),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  // final invoice = Invoic
                  final pdfFile = await PdfInvoiceApi.generate();
                  PdfApi.openFile(pdfFile);
                },
                child: Text('Generate Pdf'),
              ),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
