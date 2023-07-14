import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../model/user_information.dart';

//이메일 인증
Future<int> PostVerifyEmailCode(String code) async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"email": user.email, "code": code}),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
