import '../models/on_boarding_model.dart';

class OnBoardingController {
  int currentPage = 0;
  List<Model> models = [
    Model(
      title: "welcome to\n sycamore",
      image: "assets/images/Doctors-bro 1.png",
    ),
    Model(
        title: "The diagnosis\n become easier !",
        image: "assets/images/Oxygen mask-bro 1.png",
        subtitle:
            '"Welcome to sycamore Your personal\n guide to optimal oxygen levels. Breathe confidently\n knowing we\'re here to support you"'),
    Model(
        title: "Take Control of\n Your Health",
        image: "assets/images/Online Doctor-amico 1.png",
        subtitle:
            '"Empower your well-being with sycamore.\n Monitor your oxygen, receive personalized\n insights, and manage your therapy all in one place"'),
  ];
}
