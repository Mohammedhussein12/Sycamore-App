class PatientRegistrationResponse {
  final String message;
  final Patient patient;
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  PatientRegistrationResponse({
    required this.message,
    required this.patient,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory PatientRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return PatientRegistrationResponse(
      message: json['message'],
      patient: Patient.fromJson(json['Patient']),
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}

class Patient {
  final String doctorId;
  final String email;
  final String updatedAt;
  final String createdAt;
  final int id;

  Patient({
    required this.doctorId,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      doctorId: json['Doctor_id'],
      email: json['Email'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
