import '../constants.dart';
import '../controllers/nutrition_tips_controller.dart';
import '../models/nutrition_tips_model.dart';

List<NutritionTipsModel> getNutritionTips() {
  NutritionTipsController controller = NutritionTipsController();
  List<NutritionTipsModel> tips = [];
  tips.addAll(controller.copdTips);
  switch (myChoise) {
    case 'Pulmonary fibrosis':
      tips.addAll(controller.pulmonaryFibrosisTips);
      break;
    case 'Pulmonary embolism':
      tips.addAll(controller.pulmonaryEmbolismTips);
      break;
    case 'Pneumonia':
      tips.addAll(controller.pneumoniaTips);
      break;
    case 'Interstitial lung disease':
      tips.addAll(controller.interstitialLungTips);
      break;
    default:
      tips.addAll(controller.pulmonaryFibrosisTips);
  }
  return tips;
}