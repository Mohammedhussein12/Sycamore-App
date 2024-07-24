import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sycamore_project/models/doctor_login_response_model.dart';

class DoctorLoginService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<DoctorLoginResponse> loginDoctor(
      String name,String email, String password) async {
    Response response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {
        "Name" : name,
        "Email": email,
        "Password": password,
      },
    );

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return DoctorLoginResponse.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception("${data['error']}")
          .toString()
          .substring(10);
    } else if (response.statusCode == 422) {
      if (data.containsKey('Password')) {
        throw Exception("${data['Password'].first}")
            .toString()
            .substring(10);
      } else if (data.containsKey('Email')) {
        throw Exception("${data['Email'].first}")
            .toString()
            .substring(10);
      } else {
        throw Exception("Validation Error: ${response.body}")
            .toString()
            .substring(10);
      }
    } else {
      throw Exception("Error: ${response.statusCode}").toString().substring(10);
    }
  }
}
