import 'package:http/http.dart' as http;

import 'end_points.dart';

class EmployeeApi {
  EmployeeApi._();

  static Future<String> getEmployees() async {
    var request = http.Request('GET', Uri.parse('${EndPoints.baseApiLink}${EndPoints.getEmployeesEndPoint}'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    } else {
      return response.reasonPhrase.toString();
    }
  }

  static Future<String> getVacations() async {
    var request = http.Request('GET', Uri.parse('${EndPoints.baseApiLink}${EndPoints.getVacationRequestsEndPoint}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    } else {
      return (response.reasonPhrase).toString();
    }
  }
}
