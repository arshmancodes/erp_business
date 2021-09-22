import 'package:erp_business/models/certificateModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CertificateController extends GetxController {
  List<CertificateModel> certificates = [
    CertificateModel(
      title: 'Certificado de Experiencia',
      description:
          'This is some shit which i dnont know taht id tks but itsh has eto be herr!',
      date: '01/01/2020',
    )
  ].obs;
}
