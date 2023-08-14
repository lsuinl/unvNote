import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/model/response_error_model.dart';
import '../../../common/model/response_model.dart';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../../user/register/model/user_information.dart';

//특정 목표 수정
Future<dynamic> PatchTodosId(String id,String content, String date) async {
  UserInformation user = await GetUserInformation();
  String accesstoken = user.accessToken;
  try {
    var response = await http.patch(
      Uri.parse('$urls/todos/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': 'Bearer $accesstoken',
      },
      body: jsonEncode({
        "content": content,
        "year": date
      }),
    );
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode==200){
      // ResponseModel responsemodel = ResponseModel.fromJson(body);
      // print(responsemodel);
      print(body['data']);
      return response.statusCode;
    }
    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
    //에러반환
    return responsemodel.statusCode;

  } catch (e) {
    throw e;
  }
}
