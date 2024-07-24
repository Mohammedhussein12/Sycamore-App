import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/cubits/patient_form_registration_cubit/patient_form_registration_cubit.dart';
import 'package:sycamore_project/cubits/patient_form_registration_cubit/patient_form_registration_state.dart';
import 'package:sycamore_project/screens/do_you_have_copd_question_screen.dart';
import 'package:sycamore_project/screens/language_screen.dart';
import 'package:sycamore_project/services/patient_form_registration_service.dart';
import '../constants.dart';
import '../core/show_snackbar.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_text_field.dart';
import '../localization_service/localization_service.dart';
import '../patient_const.dart';

class PatientFormRegister extends StatelessWidget {
  PatientFormRegister({
    super.key,
  });

  // String? name, phoneNumber, age, temperature, height, weight;
  bool? isLoading = false;
  final formKey = GlobalKey<FormState>();

  final localizationController = Get.find<LocalizationController>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientFormRegistrationCubit(
          service: PatientFormRegistrationService()),
      child: BlocConsumer<PatientFormRegistrationCubit,
          PatientFormRegistrationState>(
        listener: (context, state) {
          if (state is PatientFormRegistrationLoading) {
            isLoading = true;
          } else if (state is PatientFormRegistrationFailure) {
            isLoading = false;
            showSnackBar(context, state.error);
          } else if (state is PatientFormRegistrationSuccess) {
            isLoading = false;
            navigateTo(page: LanguageScreen(),withHistory: true);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ModalProgressHUD(
              inAsyncCall: isLoading!,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'To complete your register\n please answer these\n questions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomLabelText(
                      text: 'Patient name',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        name = data;
                      },
                      keyboardType: TextInputType.text,
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabelText(
                      text: 'Age',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (data) {
                        age = data;
                      },
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabelText(
                      text: 'Height',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        height = data;
                      },
                      keyboardType: TextInputType.number,
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabelText(
                      text: 'Weight',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        weight = data;
                      },
                      keyboardType: TextInputType.number,
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabelText(
                      text: 'Temperature',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        temp = data;
                      },
                      keyboardType: TextInputType.number,
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabelText(
                      text: 'Phone number',
                      fontSize: 16,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        phoneNumber = data;
                      },
                      keyboardType: TextInputType.number,
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Next',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<PatientFormRegistrationCubit>(
                                    context)
                                .registerPatientForm(
                                    name: name!,
                                    age: age!,
                                    temperature: temp!,
                                    height: height!,
                                    weight: weight!,
                                    phoneNumber: phoneNumber!,
                                    patientId: patientId!);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
