import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sycamore_project/models/patient_logout_response_model.dart';

class PatientLogoutService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<PatientLogoutResponse> logoutPatient(String token) async {
    Map<String, String> headers = {};
    headers.addAll({'Authorization': 'Bearer $token'});
      print(headers);
    Response response =
        await http.post(Uri.parse("$baseUrl/plogout"), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return PatientLogoutResponse.fromJson(data);
    } else {
      throw Exception("oops,there was a problem..please try again")
          .toString()
          .substring(10);
    }
  }
}
