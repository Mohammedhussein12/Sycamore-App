import '../models/breathing_exercises_model.dart';

class BreathingExerciseController {
  final List<BreathingExerciseModel> exercises = [
    BreathingExerciseModel(
        image: 'assets/images/تنفس من خلال أنفك 2.png',
        title: "exercises1",
        subTitle: "exercises1.1"),
    BreathingExerciseModel(
      image: 'assets/images/قُم بضم شفتيك 2.png',
      title: "exercises2",
      subTitle: ("exercises12.1"),
    ),
    BreathingExerciseModel(
      image: 'assets/images/تنفس ببطء للغاية 3.png',
      title: "exercises3",
      subTitle: ("exercises3.1"),
    ),
    BreathingExerciseModel(
      image: 'assets/images/كرر 2.png',
      title: "exercises4",
      subTitle: ("exercises14.1"),
    ),
  ];
  final List<BreathingExerciseModel> exercisesWays = [
    BreathingExerciseModel(
        image: 'assets/images/ضع إحدى يديك على صدرك والأخرى على بطنك 1.png',
        title: "exercisesWays1",
        subTitle: "exercisesWays1.1"),
    BreathingExerciseModel(
      image: 'assets/images/ضع إحدى يديك على صدرك والأخرى على بطنك 1.png',
      title: "exercisesWays2",
      subTitle: ("exercisesWays2.1"),
    ),
    BreathingExerciseModel(
      image: 'assets/images/ضع إحدى يديك على صدرك والأخرى على بطنك 1.png',
      title: "exercisesWays3",
      subTitle: ("exercisesWays3.1"),
    ),
    BreathingExerciseModel(
      image: 'assets/images/كرر 2.png',
      title: "exercisesWays4",
      subTitle: ("exercisesWays4.1"),
    ),
  ];

  // final List<BreathingExerciseModel> pulmonaryFibrosisExercisesWays = [];
  final List<BreathingExerciseModel> pulmonaryFibrosisExercises = [
    BreathingExerciseModel(
        image: "",
        title: "pulmonaryFibrosisExercises1",
        subTitle: "pulmonaryFibrosisExercises1.1"),
    BreathingExerciseModel(
        image: "",
        title: "pulmonaryFibrosisExercises2",
        subTitle: "pulmonaryFibrosisExercises2.1"),
    BreathingExerciseModel(
        image: "",
        title: "pulmonaryFibrosisExercises3",
        subTitle: "pulmonaryFibrosisExercises3.1"),
    BreathingExerciseModel(
        image: "", title: "pulmonaryFibrosisExercises4", subTitle: ''),
    BreathingExerciseModel(title: "pulmonaryFibrosisExercises5", subTitle: ''),
    BreathingExerciseModel(title: "pulmonaryFibrosisExercises6", subTitle: ''),
    BreathingExerciseModel(title: "pulmonaryFibrosisExercises7", subTitle: ''),
    BreathingExerciseModel(title: "pulmonaryFibrosisExercises8", subTitle: ''),
    BreathingExerciseModel(title: "pulmonaryFibrosisExercises9", subTitle: ''),
  ];

  // final List<BreathingExerciseModel> pneumoniaExercisesWays = [];
  final List<BreathingExerciseModel> pneumoniaExercises = [
    BreathingExerciseModel(
        title: "pneumoniaExercise1", subTitle: "pneumoniaExercises1.1"),
    BreathingExerciseModel(
        title: "pneumoniaExercises2", subTitle: "pneumoniaExercises2.1"),
    BreathingExerciseModel(
        title: "pneumoniaExercises3", subTitle: "pneumoniaExercises3.1")
  ];

  final List<BreathingExerciseModel> pulmonaryEmbolismExercisesWays = [
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercisesWays1",
        subTitle: "pulmonaryEmbolismExercisesWays1.1"),
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercisesWays2",
        subTitle: "pulmonaryEmbolismExercisesWays2.1"),
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercisesWays3",
        subTitle: "pulmonaryEmbolismExercisesWays3.1"),
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercisesWays4",
        subTitle: "pulmonaryEmbolismExercisesWays4.1"),
  ];
  final List<BreathingExerciseModel> pulmonaryEmbolismExercises = [
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercises1",
        subTitle: "pulmonaryEmbolismExercises1.1"),
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercises2",
        subTitle: "pulmonaryEmbolismExercises2.1"),
    BreathingExerciseModel(
        title: "pulmonaryEmbolismExercises3",
        subTitle: "pulmonaryEmbolismExercises3.1")
  ];

  // final List<BreathingExerciseModel> interstitialLungExercisesWays = [];
  final List<BreathingExerciseModel> interstitialLungExercises = [
    BreathingExerciseModel(
        title: "interstitialLungExercises1",
        subTitle: "interstitialLungExercises1.1"),
    BreathingExerciseModel(
        title: "interstitialLungExercises2",
        subTitle: "interstitialLungExercises2.1"),
    BreathingExerciseModel(
        title: "interstitialLungExercises3",
        subTitle: "interstitialLungExercises3.1"),
    BreathingExerciseModel(
        title: "interstitialLungExercises4",
        subTitle: "interstitialLungExercises4.1"),
    BreathingExerciseModel(
        title: "interstitialLungExercises5",
        subTitle: "interstitialLungExercises5.1"),
    BreathingExerciseModel(
        title: "interstitialLungExercises6",
        subTitle: "interstitialLungExercises6.1"),
    BreathingExerciseModel(title: "interstitialLungExercises7", subTitle: ''),
  ];

  // final List<BreathingExerciseModel> copdExercisesWays = [];
  final List<BreathingExerciseModel> copdExercises = [
    BreathingExerciseModel(
        image: "assets/images/Reduce-Air-Pollution.jpg",
        title: "copdExercises1",
        subTitle: "copdExercises1.1"),
    BreathingExerciseModel(
        image: "assets/images/Maintaing healthy weight.jpeg",
        title: "copdExercises2",
        subTitle: "copdExercises2.1"),
    BreathingExerciseModel(
        image: "assets/images/practice simple excersises.webp",
        title: "copdExercises3",
        subTitle: "copdExercises3.1"),
    BreathingExerciseModel(
        image: "assets/images/infectious diseases.jpeg",
        title: "copdExercises4",
        subTitle: "copdExercises4.1"),
    BreathingExerciseModel(
        image: "assets/images/cold weather.jpeg",
        title: "copdExercises5",
        subTitle: "copdExercises5.1"),
    BreathingExerciseModel(
        image: "assets/images/treatment plan.jpeg",
        title: "copdExercises6",
        subTitle: "copdExercises6.1"),
    BreathingExerciseModel(
        image: "assets/images/quit smoking.png",
        title: "copdExercises7",
        subTitle: ''),
  ];
}

