class PatientLogoutResponse {
  final String message;
  final String status;

  PatientLogoutResponse({required this.message, required this.status});

  factory PatientLogoutResponse.fromJson(Map<String, dynamic> json) {
    return PatientLogoutResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}
