import 'package:bloc/bloc.dart';
import 'package:sycamore_project/cubits/doctor_search_patients_cubit/search_patient_state.dart';
import 'package:sycamore_project/models/patient_doctor_home_screen_model.dart';
import '../../services/search_patients_service.dart';

class PatientSearchCubit extends Cubit<PatientSearchState> {
  final PatientSearchService service;
  List<PatientModel>? patients;

  PatientSearchCubit({required this.service}) : super(PatientsSearchLoading());

  void searchPatients(String patientName) async {
    try {
      emit(PatientsSearchLoading());
      patients = await service.searchPatient(patientName);
      emit(PatientSearchSuccess(patients!));
    } catch (e) {
      emit(PatientsSearchError(e.toString()));
    }
  }
}
