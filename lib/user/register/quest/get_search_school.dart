import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../../common/urls.dart';


//이메일 입력
Future<List<dynamic>> GetSearchSchool(String text) async {
  text=Uri.encodeFull(text.toString());
  try {
    final dio=Dio();
    var response = await dio.get(
      '$schoolUrls$text',
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data['dataSearch']['content'];
  } catch (e) {
    throw e;
  }
}
