import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../register/model/user_information.dart';

//로그인
Future<int> PostLogin(String email, String password) async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    print(response.body);
    if(response.statusCode==200){
      //데이터저장하기
    }
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
