import 'dart:convert';

import 'package:erp_business/constant/base_url.dart';
import 'package:erp_business/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  UserModel? currentUser;


  @override
  void onInit() {
    // login('', '', '');
    super.onInit();
  }



  Future<http.Response> login(uname, pass) async {
    var url = Uri.parse("$BASE_URL/users/login");
    try{

      http.Response response = await http.post(url,
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username' : uname,
          'password' : pass,
        })
      );
      print(response.body);
      return response;

    }catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }


  Future<http.Response> register(uname, pass, email) async {
    var url = Uri.parse("$BASE_URL/users/register");
    try{
      http.Response response = await http.post(url,
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            'username' : uname,
            'password' : pass,
            'email' :email
          })
      );

      print(response.body);
      return response;

    }catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }

}
