import 'package:sycamore_project/controllers/breathing_exercises_controller.dart';
import '../constants.dart';
import '../models/breathing_exercises_model.dart';

List<BreathingExerciseModel> getBreathingTips() {
  BreathingExerciseController controller = BreathingExerciseController();
  List<BreathingExerciseModel> tips = [];
  tips.addAll(controller.copdExercises);
  switch (myChoise) {
    case 'fibrosis':
      tips.addAll(controller.pulmonaryFibrosisExercises);
      break;
    case 'embolism':
      tips.addAll(controller.pulmonaryEmbolismExercises);
      break;
    case 'pneumonia':
      tips.addAll(controller.pneumoniaExercises);
      break;
    case 'interstitial':
      tips.addAll(controller.interstitialLungExercises);
      break;
    default:
      tips.addAll(controller.exercises);
  }
  return tips;
}