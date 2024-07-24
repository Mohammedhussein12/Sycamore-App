class DoctorLogoutResponse {
  final String message;
  final String status;

  DoctorLogoutResponse({required this.message, required this.status});

  factory DoctorLogoutResponse.fromJson(Map<String, dynamic> json) {
    return DoctorLogoutResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}