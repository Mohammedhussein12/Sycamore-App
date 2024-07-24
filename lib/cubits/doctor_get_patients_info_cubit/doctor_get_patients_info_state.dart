import '../../models/patient_doctor_home_screen_model.dart';

abstract class PatientsState {}

class PatientsInitial extends PatientsState {}

class PatientsLoading extends PatientsState {}

class PatientsLoaded extends PatientsState {
  final List<PatientModel> patients;

  PatientsLoaded({required this.patients});
}

class PatientsError extends PatientsState {
  final String error;

  PatientsError({required this.error});
}