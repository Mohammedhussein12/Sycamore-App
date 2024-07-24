import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/doctor_register_response_model.dart';

class DoctorRegisterService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<DoctorRegistrationResponse> registerDoctor(
      String email,String name, String password, String confirmPassword) async {
    Response response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: {
        "Name" : name,
        "Email": email,
        "Password": password,
        "Password_Confirmation": confirmPassword,
      },
    );
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      if (data['message'] == "Doctor successfully registered") {
        return DoctorRegistrationResponse.fromJson(data);
      }
    } else if (response.statusCode == 400 &&
        response.body.contains("The email has already been taken")) {
      throw Exception("The email has already been taken.")
          .toString()
          .substring(10);
    } else if (response.statusCode == 400 &&
        response.body
            .contains("The password field must be at least 7 characters.")) {
      throw Exception("The password field must be at least 7 characters.")
          .toString()
          .substring(10);
    } else if (response.statusCode == 400 &&
        response.body.contains("Password_Confirmation")) {
      throw Exception(
              "The password confirmation field must be at least 7 characters.")
          .toString()
          .substring(10);
    }
    throw Exception("Failed to register doctor.");
  }
}
