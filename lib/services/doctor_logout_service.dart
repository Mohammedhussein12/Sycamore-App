import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/doctor_logout_response_model.dart';

class DoctorLogoutService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<DoctorLogoutResponse> logoutDoctor(String token) async {
    Map<String, String> headers = {};
    headers.addAll({'Authorization': 'Bearer $token'});
      log(token);
    print(headers);
    Response response =
    await http.post(Uri.parse("$baseUrl/logout"), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return DoctorLogoutResponse.fromJson(data);
    } else {
      throw Exception("oops,there was a problem..please try again")
          .toString()
          .substring(10);
    }
  }
}
