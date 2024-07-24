abstract class DoctorRegisterState {}

class DoctorRegisterInitial extends DoctorRegisterState {}

class DoctorRegisterLoading extends DoctorRegisterState {}

class DoctorRegisterSuccess extends DoctorRegisterState {}

class DoctorRegisterFailure extends DoctorRegisterState {
  final String error;

  DoctorRegisterFailure(this.error);
}
