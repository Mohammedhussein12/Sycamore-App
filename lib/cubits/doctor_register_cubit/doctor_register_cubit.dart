import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/constants.dart';
import '../../services/doctor_register_service.dart';
import 'doctor_register_state.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterState> {
  final DoctorRegisterService service;

  DoctorRegisterCubit({required this.service}) : super(DoctorRegisterInitial());

  Future<void> registerDoctor(
      {required String email,
      required String password,
      required String confirmPassword,
      required String name}) async {
    emit(DoctorRegisterLoading());
    try {
      final response =
          await service.registerDoctor(email, password, confirmPassword, name);
      doctorToken = response.accessToken;
      emit(DoctorRegisterSuccess());
    } catch (e) {
      emit(DoctorRegisterFailure(e.toString()));
    }
  }
}
