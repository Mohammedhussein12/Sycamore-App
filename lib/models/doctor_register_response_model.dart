class DoctorRegistrationResponse {
  final String message;
  final DoctorModel doctor;
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  DoctorRegistrationResponse({
    required this.message,
    required this.doctor,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory DoctorRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return DoctorRegistrationResponse(
      message: json['message'],
      doctor: DoctorModel.fromJson(json['Doctor']),
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}

class DoctorModel {
  final String email;
  final String password;
  final String passwordConfirmation;
  final String updatedAt;
  final String createdAt;
  final int id;

  DoctorModel({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      email: json['Email'],
      password: json['Password'],
      passwordConfirmation: json['Password_Confirmation'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
