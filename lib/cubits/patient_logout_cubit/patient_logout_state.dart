abstract class PatientLogoutState {}

class PatientLogoutInitial extends PatientLogoutState {}

class PatientLogoutLoading extends PatientLogoutState {}

class PatientLogoutSuccess extends PatientLogoutState {}

class PatientLogoutFailure extends PatientLogoutState {
  final String error;

  PatientLogoutFailure(this.error);
}
