import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/predict_response_model.dart';

class PredictOxygenService {
  final String _baseUrl = 'https://sycamoreproject-b2664826e8c6.herokuapp.com/api';

  Future<PredictResponseModel> predictAmountOfOxygen() async {
    final response = await http.get(Uri.parse('$_baseUrl/predict'));
    print(response.body);

    if (response.statusCode == 200) {
      return PredictResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load prediction');
    }
  }
}
