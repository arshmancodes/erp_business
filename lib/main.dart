import 'package:erp_business/controllers/attendanceController.dart';
import 'package:erp_business/controllers/authController.dart';
import 'package:erp_business/screens/dashboard.dart';
import 'package:erp_business/screens/login.dart';
import 'package:erp_business/screens/nav_bar_items/attendance.dart';
import 'package:erp_business/screens/nav_bar_items/camera_screen.dart';
import 'package:erp_business/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  Get.put(AttendanceController());
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
      home: LoginPage(),
      routes: {
        '/cameraScreen': (context) => CameraScreen(),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
