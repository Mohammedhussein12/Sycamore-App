class PredictResponseModel {
  final double prediction;

  PredictResponseModel({required this.prediction});

  factory PredictResponseModel.fromJson(Map<String, dynamic> json) {
    return PredictResponseModel(
      prediction: json['prediction'].toDouble(),
    );
  }
}
