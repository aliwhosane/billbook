import 'package:billbook/controller/cart_controller.dart';
import 'package:billbook/controller/page/home/home_controller.dart';
import 'package:billbook/controller/page/orderhistory_controller.dart';
import 'package:billbook/pages/addproduct/add_product_view.dart';
import 'package:billbook/pages/detail/detail_view.dart';
import 'package:billbook/pages/orderhistory/order_history_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/page/addproduct_controller.dart';
import 'pages/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(OrderhistoryController());
  Get.put(CartController());
  Get.put(HomeController());
  Get.put(AddProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BillBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: "/home", page: () => HomeScreen()),
        GetPage(name: '/details', page: () => DetailScreen()),
        GetPage(name: '/addProduct', page: () => AddProductScreen()),
        GetPage(name: '/orderHistory', page: () => OrderHistoryScreen())
      ],
      initialRoute: '/home',
    );
  }
}
