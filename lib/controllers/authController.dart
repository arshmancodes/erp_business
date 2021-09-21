import 'package:erp_business/models/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  UserModel? currentUser;

  var url = Uri.parse("http://10.0.2.2:3000/api/users");

  void login(uname, pass, name) async {
    var response = await http.post(url, body: {
      "username": uname,
      "password": pass,
      "name": name,
    }).then((value) {
      print(value.body);
    });

    print(response.body);
  }
}
