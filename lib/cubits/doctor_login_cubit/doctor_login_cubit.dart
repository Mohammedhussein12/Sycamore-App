import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:sycamore_project/constants.dart';
import '../../services/doctor_login_service.dart';
import 'doctor_login_state.dart';

class DoctorLoginCubit extends Cubit<DoctorLoginState> {
  final DoctorLoginService service;

  DoctorLoginCubit({required this.service}) : super(DoctorLoginInitial());

  Future<void> loginDoctor({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(DoctorLoginLoading());
    try {
      final response = await service.loginDoctor(name,email, password);
      doctorToken = response.accessToken; // Store the access token
      log("$doctorToken");
      emit(DoctorLoginSuccess());
    } catch (e) {
      emit(DoctorLoginFailure(e.toString()));
    }
  }
}
