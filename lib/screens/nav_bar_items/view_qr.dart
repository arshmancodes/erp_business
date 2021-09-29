import 'package:erp_business/constant/base_url.dart';
import 'package:erp_business/controllers/qrcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewQR extends StatefulWidget {
  const ViewQR({Key? key}) : super(key: key);

  @override
  _ViewQRState createState() => _ViewQRState();
}

class _ViewQRState extends State<ViewQR> {
  final QrController controller = Get.find<QrController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: QrData,
              size: 200,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
