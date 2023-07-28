import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../model/user_information.dart';

//회원가입
Future<int> PostSignUp() async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": user.email,
        "password": user.password,
        "name": user.name,
        "univ": user.univ,
        "department": user.department,
        "admissionDate": user.admissionDate, // 23-02-01 형식
        "expectedGraduationDate": user.expectedGraduationDate // 23-02-01 형식
      }),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
