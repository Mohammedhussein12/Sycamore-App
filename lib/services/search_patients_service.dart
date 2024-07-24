import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/patient_doctor_home_screen_model.dart';

class PatientSearchService {
  Future<List<PatientModel>> searchPatient(String patientName) async {
    const baseUrl = 'https://sycamoreproject-b2664826e8c6.herokuapp.com/api';
    final response = await http.get(Uri.parse("$baseUrl/search/$patientName"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
       List<PatientModel> patients = [];
      for (var patient in data) {
        patients.add(PatientModel.fromJson(patient));
      }
      return patients;
    } else {
      throw Exception('Failed to fetch patient information');
    }
  }
}