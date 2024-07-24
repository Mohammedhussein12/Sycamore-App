class PatientLoginResponse {
  final String accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? email;
  final String? password;

  PatientLoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.email,
    required this.password,
  });

  factory PatientLoginResponse.fromJson(Map<String, dynamic> json) {
    return PatientLoginResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      email: json['email'],
      password: json['password'],
    );
  }
}
