import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../constants.dart';
import '../../services/doctor_logout_service.dart';
import 'doctor_logout_state.dart';

class DoctorLogoutCubit extends Cubit<DoctorLogoutState> {
  final DoctorLogoutService service;

  DoctorLogoutCubit({required this.service}) : super(DoctorLogoutInitial());

  Future<void> logoutDoctor() async {
    emit(DoctorLogoutLoading());
    try {
      log(doctorToken.toString());
      await service.logoutDoctor(doctorToken.toString());
      emit(DoctorLogoutSuccess());
    } catch (e) {
        emit(DoctorLogoutFailure(e.toString()));
    }
  }
}

