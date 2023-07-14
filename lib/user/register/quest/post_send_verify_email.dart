import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../model/user_information.dart';

//이메일 입력
Future<int> PostSendVerifyEmail() async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/send-verify-email'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": user.email,
      }),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
