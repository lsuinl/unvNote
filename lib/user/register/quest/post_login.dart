import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../model/user_information.dart';

//로그인
Future<int> PostLogin() async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": user.email,
        "password": user.password,
      }),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
