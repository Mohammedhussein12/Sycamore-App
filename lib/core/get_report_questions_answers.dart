import '../constants.dart';

List<String> getQuestionsList() {
  List<String> myList = [];
  myList.addAll(kCOPDYesAnswers);
  switch (myChoise) {
    case 'copd':
      myList = kCOPDYesAnswers;
    case 'Pulmonary fibrosis':
      myList.addAll(kPulmonaryFibrosisYesAnswers);
      break;
    case 'Pulmonary embolism':
      myList.addAll(kPulmonaryEmbolismYesAnswers);
      break;
    case 'Pneumonia':
      myList.addAll(kPneumoniaYesAnswers);
      break;
    case 'Interstitial lung disease':
      myList.addAll(kInterstitialLungYesAnswers);
      break;
  }

  return myList;
}