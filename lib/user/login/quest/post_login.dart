import 'package:http/http.dart' as http;
import 'package:univ_note/common/response_model.dart';
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../register/model/user_information.dart';

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
    if(response.statusCode==200){
      //데이터 저장하기
      return "ok";
    }
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    ResponseModel responsemodel = ResponseModel.fromJson(body);
    return responsemodel.message[0].toString();

  } catch (e) {
    throw e;
  }
}
