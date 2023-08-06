import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/model/response_error_model.dart';
import '../../../common/model/response_model.dart';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../../user/register/model/user_information.dart';

//글 상세보기
Future<dynamic> GetRecordsId(int id) async {
  UserInformation user = await GetUserInformation();
  String accesstoken = user.accessToken;
  try {
    var response = await http.get(
      Uri.parse('$urls/records/:$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': 'Bearer $accesstoken',
      },
    );
    print(response.body);
    dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode==200){
      ResponseModel responsemodel = ResponseModel.fromJson(body);
      return responsemodel.data;
    }
    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);

    //에러반환
    return responsemodel.statusCode;

  } catch (e) {
    throw e;
  }
}
