import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/model/response_error_model.dart';
import '../../../common/model/response_model.dart';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../../user/register/model/user_information.dart';

//개강.종강 날짜 수정
Future<dynamic> PatchDatesSchedule(String types,String date) async {
  UserInformation user = await GetUserInformation();
  String accesstoken = user.accessToken;
  try {
    var response = await http.patch(
      Uri.parse('$urls/dates/schedule'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': 'Bearer $accesstoken',
      },
      body: jsonEncode({
        "schedule": types,
        "updateDate": date
      }),
    );
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    print(body);
    if(response.statusCode==201){
      ResponseModel responsemodel = ResponseModel.fromJson(body);
      print(responsemodel);
      print(body['data']);
      return body['data'];
    }

    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
    //에러반환
    return responsemodel.statusCode;

  } catch (e) {
    throw e;
  }
}
