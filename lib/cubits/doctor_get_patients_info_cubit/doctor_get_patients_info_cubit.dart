import 'package:bloc/bloc.dart';
import '../../models/patient_doctor_home_screen_model.dart';
import '../../services/doctor_get_patient_info_service.dart';
import 'doctor_get_patients_info_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  final PatientService service;
  List<PatientModel>? patients;

  PatientsCubit({required this.service}) : super(PatientsInitial());

  Future<void> fetchPatients() async {
    try {
      emit(PatientsLoading());
      patients = await service.fetchPatientInfo();
      emit(PatientsLoaded(patients: patients!));
    } catch (e) {
      emit(PatientsError(error: e.toString()));
    }
  }
}
