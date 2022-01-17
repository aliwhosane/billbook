import 'package:billbook/controller/cart_controller.dart';
import 'package:billbook/pages/addproduct/add_product_view.dart';
import 'package:billbook/pages/detail/detail_view.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/page/addproduct_controller.dart';
import 'pages/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Get.put(CartController());
  Get.put(AddProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: "/home", page: () => HomeScreen()),
        GetPage(name: '/details', page: () => DetailScreen()),
        GetPage(name: '/addProduct', page: () => AddProductScreen())
      ],
      initialRoute: '/home',
    );
  }
}
