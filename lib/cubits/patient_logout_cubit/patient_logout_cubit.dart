import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/cubits/patient_logout_cubit/patient_logout_state.dart';
import '../../services/patient_logout_service.dart';

class PatientLogoutCubit extends Cubit<PatientLogoutState> {
  final PatientLogoutService service;

  PatientLogoutCubit({required this.service}) : super(PatientLogoutInitial());

  Future<void> logoutPatient() async {
    emit(PatientLogoutLoading());
    try {
      log(patientToken.toString());
      await service.logoutPatient(patientToken.toString());
      emit(PatientLogoutSuccess());
    } catch (e) {
      emit(PatientLogoutFailure(e.toString()));
    }
  }
}
