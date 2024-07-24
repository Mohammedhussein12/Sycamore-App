import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/patient_type_of_diagnosis_choice_model.dart';

class PatientChooseTypeOfDiagnosisService {
  static Future<ChoiceModel> chooseTypeOfDiagnosis(
      int patientId, String choice) async {
    log(choice);
    log(patientId.toString());
    final url = Uri.parse(
        'https://sycamoreproject-b2664826e8c6.herokuapp.com/api/user-choice/$patientId');
    final body = jsonEncode({'choice': choice});

    final response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      return ChoiceModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to store choice');
    }
  }
}
