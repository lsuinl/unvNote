import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/common/model/response_error_model.dart';
import 'package:univ_note/common/model/response_model.dart';
import 'dart:convert';
import '../../../common/urls.dart';

//로그인
Future<String> PostLogin(String email, String password) async {
  try {
    dynamic response = await http.post(
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
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode==200){
      SharedPreferences prefs= await SharedPreferences.getInstance();
      ResponseModel responsemodel = ResponseModel.fromJson(body);
      prefs.setString("accessToken", responsemodel.data["accessToken"]);
      prefs.setString("email", responsemodel.data["email"]);
      prefs.setString("name", responsemodel.data["name"]);
      prefs.setString("univ", responsemodel.data["univ"]);
      prefs.setString("department", responsemodel.data["department"]);
      prefs.setString("admissionDate", responsemodel.data["admissionDate"]);
      prefs.setString("expectedGraduationDate", responsemodel.data["expectedGraduationDate"]);
      print(responsemodel.data);
      return "ok";
    }
    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
    return responsemodel.message[0].toString();
  } catch (e) {
    throw e;
  }
}
