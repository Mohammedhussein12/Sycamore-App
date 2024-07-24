abstract class PatientFormRegistrationState {}

class PatientFormRegistrationInitial extends PatientFormRegistrationState {}

class PatientFormRegistrationLoading extends PatientFormRegistrationState {}

class PatientFormRegistrationSuccess extends PatientFormRegistrationState {}

class PatientFormRegistrationFailure extends PatientFormRegistrationState {
  final String error;

  PatientFormRegistrationFailure(this.error);
}
