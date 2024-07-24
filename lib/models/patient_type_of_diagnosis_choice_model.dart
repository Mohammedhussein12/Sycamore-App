class ChoiceModel {
  final String message;
  final Map<String, dynamic> choice;

  ChoiceModel({required this.message, required this.choice});

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      message: json['message'],
      choice: json['choice'],
    );
  }
}