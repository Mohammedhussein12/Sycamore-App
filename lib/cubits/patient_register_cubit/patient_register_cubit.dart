import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/cubits/patient_register_cubit/patient_register_state.dart';
import '../../constants.dart';
import '../../models/patient_regsiter_model.dart';
import '../../services/patient_register_service.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  final PatientRegisterService service;
  PatientRegistrationResponse? response;

  PatientRegisterCubit({required this.service})
      : super(PatientRegisterInitial());

  Future<void> registerPatient(
      {required String email,
        required String password,
        required String confirmPassword,
        required String doctorId}) async {
    emit(PatientRegisterLoading());
    try {
      response = await service.registerPatient(
          email, password, confirmPassword, doctorId);
      patientId = response!.patient.id;
      patientToken = response!.accessToken;
      emit(PatientRegisterSuccess(patientId: patientId!));
    } catch (e) {
      emit(PatientRegisterFailure(e.toString()));
    }
  }
}
