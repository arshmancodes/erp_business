import 'package:erp_business/models/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AttendanceController extends GetxController {
  late List<AttendanceModel> attendance = [];

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

  void attendanceModel() {
    for (int i = 0; i < 5; i++) {
      AttendanceModel model = AttendanceModel(
          id: i, userid: i * 3, attendance: true, date: "24 Sept");
      print("Attendance model ran ${i}");

      attendance.add(model);
    }
  }
}
