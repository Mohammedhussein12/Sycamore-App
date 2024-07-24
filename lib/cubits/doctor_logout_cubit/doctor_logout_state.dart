abstract class DoctorLogoutState {}

class DoctorLogoutInitial extends DoctorLogoutState {}

class DoctorLogoutLoading extends DoctorLogoutState {}

class DoctorLogoutSuccess extends DoctorLogoutState {}

class DoctorLogoutFailure extends DoctorLogoutState {
  final String error;

  DoctorLogoutFailure(this.error);
}