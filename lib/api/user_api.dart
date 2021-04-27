import 'package:exam/api/end_points.dart';
import 'package:http/http.dart' as http;

class UserApi{
  UserApi._();

  static Future<String> login(String userName, String password) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${EndPoints.baseApiLink}${EndPoints.loginEndPoint}'));
    request.body = '''{"userName":"$userName","password":"$password"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    else {
      return response.reasonPhrase.toString();
    }

  }
}