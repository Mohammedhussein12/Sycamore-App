import '../../models/patient_doctor_home_screen_model.dart';

abstract class PatientSearchState {}

class PatientSearchInitial extends PatientSearchState {}

class PatientsSearchLoading extends PatientSearchState {}

class PatientSearchSuccess extends PatientSearchState {
  final List<PatientModel> patients;

  PatientSearchSuccess(this.patients);
}

class PatientsSearchError extends PatientSearchState {
  final String error;

  PatientsSearchError(this.error);
}
