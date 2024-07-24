import 'package:bloc/bloc.dart';
import '../../constants.dart';
import '../../services/predict_patient_oxygen_service.dart';
import 'predict_oxygen_state.dart';

class PredictOxygenCubit extends Cubit<PredictOxygenState> {
  final PredictOxygenService predictOxygenService;

  PredictOxygenCubit(this.predictOxygenService) : super(PredictOxygenInitial());

  Future<void> predictAmountOfOxygen() async {
    try {
      emit(PredictOxygenLoading());
       prediction = await predictOxygenService.predictAmountOfOxygen();
      emit(PredictOxygenLoaded(prediction!));
    } catch (e) {
      emit(PredictOxygenError(e.toString()));
    }
  }
}
