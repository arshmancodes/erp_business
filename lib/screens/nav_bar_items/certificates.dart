import 'package:erp_business/controllers/auth_controller.dart';
import 'package:erp_business/controllers/certificate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

class Certificates extends StatefulWidget {
  const Certificates({Key? key}) : super(key: key);

  @override
  _CertificatesState createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  CameraController? controller;
  CertificateController _certificateController =
      Get.put(CertificateController());

  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(_authController.currentUser?.name ?? 'No user logged in'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _certificateController.certificates.isEmpty
                    ? Text(
                        "Your all certificates will be listed here!",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    : CertificateWidget(
                        certificateController: _certificateController),
                Card(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('Check In: '),
                    ),
                    ListTile(
                      title: Text('Date: '),
                    )
                  ],
                )),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/cameraScreen');
                  },
                  child: Text(
                    "Add New",
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff29dde3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    Key? key,
    required CertificateController certificateController,
  })  : _certificateController = certificateController,
        super(key: key);

  final CertificateController _certificateController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _certificateController.certificates.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          _certificateController.certificates[index].title!,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _certificateController
                              .certificates[index].description!,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          _certificateController.certificates[index].date!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
