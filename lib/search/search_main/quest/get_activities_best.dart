import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/model/response_error_model.dart';
import '../../../common/model/response_model.dart';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../../user/register/model/user_information.dart';

//인기공고
Future<dynamic> GetActivitiesBest(String type) async {
  UserInformation user = await GetUserInformation();
  String accesstoken = user.accessToken;
  try {
    var response = await http.get(
      Uri.parse('$urls/activities/best/$type'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': 'Bearer $accesstoken',
      },

    );
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode==200){
      ResponseModel responsemodel = ResponseModel.fromJson(body);
      // print(responsemodel.data['todolist']);
      return responsemodel.data['todolist'];
    }
    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
    //에러반환
    return responsemodel.statusCode;

  } catch (e) {
    throw e;
  }
}