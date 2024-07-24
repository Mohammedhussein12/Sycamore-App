abstract class PatientRegisterState {}

class PatientRegisterInitial extends PatientRegisterState {}

class PatientRegisterLoading extends PatientRegisterState {}

class PatientRegisterSuccess extends PatientRegisterState {
  final int patientId;

  PatientRegisterSuccess({required this.patientId});
}

class PatientRegisterFailure extends PatientRegisterState {
  final String error;

  PatientRegisterFailure(this.error);
}
