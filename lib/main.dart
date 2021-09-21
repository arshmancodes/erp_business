import 'package:erp_business/controllers/authController.dart';
import 'package:erp_business/screens/dashboard.dart';
import 'package:erp_business/screens/nav_bar_items/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Dashboard(),
      routes: {
        '/cameraScreen': (context) => CameraScreen(),
      },
    );
  }
}
