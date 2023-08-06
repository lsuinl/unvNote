import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../../../user/register/model/user_information.dart';

//글 수정하기
Future<int> PostRecords(
    int id,
    String category,
    String title,
    String content,
    String? impression,
    String start,
    String end
    ) async {

  UserInformation user = await GetUserInformation();
  String accesstoken = user.accessToken;
  try {
    var response = await http.patch(
      Uri.parse('$urls/records:$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': 'Bearer $accesstoken',
      },
      body: jsonEncode({
        "category": category,
        "title": title,
        "content": content,
        "impression": impression, // 필수 입력 아닙니당 입력 안 하면 null 값으로 저장돼용
        "start": start, // 2023-12-31 날짜형식(시간까지 넣어도 가능!)
        "end": end // 2023-12-31 날짜형식
      }),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
