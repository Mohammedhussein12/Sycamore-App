import '../../models/patient_type_of_diagnosis_choice_model.dart';

abstract class ChooseTypeOfDiagnosisState {}

class ChooseTypeOfDiagnosisInitial extends ChooseTypeOfDiagnosisState {}

class ChooseTypeOfDiagnosisLoading extends ChooseTypeOfDiagnosisState {}

class ChooseTypeOfDiagnosisSuccess extends ChooseTypeOfDiagnosisState {
  ChoiceModel choice;

  ChooseTypeOfDiagnosisSuccess(this.choice);
}

class ChooseTypeOfDiagnosisError extends ChooseTypeOfDiagnosisState {
  final String error;

  ChooseTypeOfDiagnosisError(this.error);
}