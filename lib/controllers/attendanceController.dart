import 'package:erp_business/models/attendanceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AttendanceController extends GetxController {
  late List<AttendanceModel> attendance;

  Future<http.Response> getAttendance() async {
    var url = Uri.parse('https://10.0.2.2:3000/api/attendance/1');
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      var response = await http.get(url);
      return response;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
