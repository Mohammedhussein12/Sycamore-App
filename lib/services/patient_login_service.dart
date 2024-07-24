import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sycamore_project/models/patient_login_response_model.dart';

class PatientLoginService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<PatientLoginResponse> loginPatient(
      String email, String password, String doctorId) async {
    Response response = await http.post(
      Uri.parse("$baseUrl/plogin"),
      body: {"Email": email, "Password": password, "Doctor_id": doctorId},
    );

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return PatientLoginResponse.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception("${data['error']}").toString().substring(10);
    } else if (response.statusCode == 422) {
      if (data.containsKey('Password')) {
        throw Exception("${data['Password']}").toString().substring(10);
      } else if (data.containsKey('Email')) {
        throw Exception("${data['Email'].first}").toString().substring(10);
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
