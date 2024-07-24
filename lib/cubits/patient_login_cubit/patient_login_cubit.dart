import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/cubits/patient_login_cubit/patient_login_state.dart';
import '../../constants.dart';
import '../../services/patient_login_service.dart';

class PatientLoginCubit extends Cubit<PatientLoginState> {
  final PatientLoginService service;

  PatientLoginCubit({required this.service}) : super(PatientLoginInitial());

  Future<void> loginPatient({
    required String email,
    required String password,
    required String doctorId,
  }) async {
    emit(PatientLoginLoading());
    try {
      final response = await service.loginPatient(email, password, doctorId);
      patientToken = response.accessToken; // Store the access token
      log("$patientToken");
      emit(PatientLoginSuccess());
    } catch (e) {
      emit(PatientLoginFailure(e.toString()));
    }
  }
}
