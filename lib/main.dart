import 'package:flutter/material.dart';
import 'package:geotagging_marketplace_mobile/widget/bottom_bar.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/bottom-bar',
      getPages: [
        // GetPage(name: '/home', page: () => const HomePage()),
        // GetPage(name: '/iot', page: () => const IotPage()),
        GetPage(name: '/bottom-bar', page: () => const BottomBar()),
      ],
    );
  }
} 