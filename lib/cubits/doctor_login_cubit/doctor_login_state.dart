abstract class DoctorLoginState {}

class DoctorLoginInitial extends DoctorLoginState {}

class DoctorLoginLoading extends DoctorLoginState {}

class DoctorLoginSuccess extends DoctorLoginState {}

class DoctorLoginFailure extends DoctorLoginState {
  final String error;

  DoctorLoginFailure(this.error);
}
