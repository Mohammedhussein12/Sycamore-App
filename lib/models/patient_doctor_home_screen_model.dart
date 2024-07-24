class PatientModel {
  final int id;
  final String name;
  final String email;
  final int doctorId;
  final int age;
  final int height;
  final int weight;
  final String temperature;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.doctorId,
    required this.age,
    required this.height,
    required this.weight,
    required this.temperature,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['Name']??'Ali Ahmed',
      email: json['Email'],
      doctorId: json['Doctor_id'],
      age: json['Age'],
      height: json['Height'],
      weight: json['Weight'],
      temperature: json['Temperature'],
      phoneNumber: json['phoneNumber']??'0101462680',
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
  @override
  String toString() {
    return 'Patient: {name: $name, age: $age}';
    // Include other properties in the string representation if needed
  }
}