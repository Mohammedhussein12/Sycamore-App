import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sycamore_project/cubits/patient_form_registration_cubit/patient_form_registration_state.dart';
import '../../services/patient_form_registration_service.dart';

class PatientFormRegistrationCubit extends Cubit<PatientFormRegistrationState> {
  final PatientFormRegistrationService service;

  PatientFormRegistrationCubit({required this.service})
      : super(PatientFormRegistrationInitial());

  Future<void> registerPatientForm(
      {required String name,
      required String age,
      required String temperature,
      required String height,
      required String weight,
      required String phoneNumber,
      required int patientId}) async {
    emit(PatientFormRegistrationLoading());
    try {
      await service.registerPatientForm(
          name, age, temperature, height, weight, phoneNumber, patientId);
      log(phoneNumber);
      emit(PatientFormRegistrationSuccess());
    } catch (e) {
      emit(PatientFormRegistrationFailure(e.toString()));
    }
  }
}
