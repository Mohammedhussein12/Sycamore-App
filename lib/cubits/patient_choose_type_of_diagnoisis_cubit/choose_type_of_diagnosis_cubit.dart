import 'package:bloc/bloc.dart';

import '../../services/patient_choose_type_of_diagnoses_service.dart';
import 'choose_type_of_diagnosis_state.dart';

class ChooseTypeOfDiagnosisCubit extends Cubit<ChooseTypeOfDiagnosisState> {
  ChooseTypeOfDiagnosisCubit() : super(ChooseTypeOfDiagnosisInitial());

  Future<void> chooseTypeOfDiagnosis(int patientId, String choice) async {
    emit(ChooseTypeOfDiagnosisLoading());

    try {
      final response = await PatientChooseTypeOfDiagnosisService.chooseTypeOfDiagnosis(patientId, choice);
      emit(ChooseTypeOfDiagnosisSuccess(response));
    } catch (e) {
      emit(ChooseTypeOfDiagnosisError(e.toString()));
    }
  }
}
