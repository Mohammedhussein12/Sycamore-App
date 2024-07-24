import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PatientFormRegistrationService {
  final String baseUrl = "https://sycamoreproject-b2664826e8c6.herokuapp.com/api";

  Future<void> registerPatientForm(String name, String age,
      String temperature, String height, String weight,
      String phoneNumber, int patientId) async {
    Response response = await http.post(
      Uri.parse("$baseUrl/patients/$patientId/form"),
      body: {
        "Name": name,
        "Age": age,
        "Temperature": temperature,
        "Height": height,
        "Weight": weight,
        "Phone number": phoneNumber
      },
    );
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['message'] == "Profile updated successfully") {
        return data;
      }
      else if (response.statusCode == 404){
        if(data['error'] == 'Patient not found'){
           throw Exception("Patient not found").toString().substring(10);
        }
      }
    }
  }
}
