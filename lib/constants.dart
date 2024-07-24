import 'dart:ui';

import 'package:sycamore_project/models/predict_response_model.dart';

const kPrimaryColor = Color(0xff1D938F);

String langNow = 'en';

String? patientToken;
String? doctorToken;
int? patientId;

Map<String, String> kCOPDAnswers = {};
Map<String, String> kPulmonaryEmbolismAnswers = {};
Map<String, String> kPulmonaryFibrosisAnswers = {};
Map<String, String> kPneumoniaAnswers = {};
Map<String, String> kInterstitialLungAnswers = {};

List<String> kCOPDYesAnswers = [];
List<String> kPulmonaryEmbolismYesAnswers = [];
List<String> kPulmonaryFibrosisYesAnswers = [];
List<String> kPneumoniaYesAnswers = [];
List<String> kInterstitialLungYesAnswers = [];

String myChoise = '';
List<double> heartRates = [0,0,0,0,0,0,0];
List<double> spo2s = [0,0,0,0,0,0,0];
double max=0;
double min=0;
PredictResponseModel? prediction ;

double minSpo2 = 0;
double avgSpo2 = 0;
String predictionLiters = "5";