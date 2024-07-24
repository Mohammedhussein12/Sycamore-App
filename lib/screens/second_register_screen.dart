import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import '../components/item_radio_button_register_screen.dart';
import '../constants.dart';
import '../core/show_snackbar.dart';
import '../cubits/patient_choose_type_of_diagnoisis_cubit/choose_type_of_diagnosis_cubit.dart';
import '../cubits/patient_choose_type_of_diagnoisis_cubit/choose_type_of_diagnosis_state.dart';
import '../cubits/patient_register_cubit/patient_register_cubit.dart';
import '../services/patient_register_service.dart';

class SecondRegisterScreen extends StatefulWidget {
  const SecondRegisterScreen({super.key});

  @override
  State<SecondRegisterScreen> createState() => _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends State<SecondRegisterScreen> {
  late ChooseTypeOfDiagnosisCubit _chooseTypeOfDiagnosisCubit;
  late PatientRegisterCubit _patientRegisterCubit;
  String? selectedDisease;

  @override
  void initState() {
    super.initState();
    _chooseTypeOfDiagnosisCubit = ChooseTypeOfDiagnosisCubit();
    _patientRegisterCubit =
        PatientRegisterCubit(service: PatientRegisterService());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                'To complete your register\nplease answer this\nquestions',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => _chooseTypeOfDiagnosisCubit,
                  ),
                  BlocProvider(
                    create: (context) => _patientRegisterCubit,
                  ),
                ],
                child: BlocConsumer<ChooseTypeOfDiagnosisCubit,
                    ChooseTypeOfDiagnosisState>(
                  listener: (context, state) {
                    if (state is ChooseTypeOfDiagnosisSuccess) {
                      log(selectedDisease.toString());
                      navigateToDiseaseQuestionsPage(myChoise);
                      // Do something with the choiceData
                    } else if (state is ChooseTypeOfDiagnosisError) {
                      final errorMessage = state.error;
                      log(errorMessage);
                      showSnackBar(context, errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is ChooseTypeOfDiagnosisLoading) {
                      // Show loading indicator
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              'which of them you are suffer from ?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: Color(0xff1D938F),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ItemRadioButtonRegisterScreen(
                            text: 'Pulmonary fibrosis',
                            groupValue: selectedDisease ?? '',
                            onChanged: (String? value) {
                              myChoise = 'Pulmonary fibrosis';
                              onDiseaseSelected(value, context);
                              if (selectedDisease != null) {
                                _chooseTypeOfDiagnosisCubit.chooseTypeOfDiagnosis(
                                    patientId!, selectedDisease!);
                              }
                            },
                          ),
                          ItemRadioButtonRegisterScreen(
                            text: 'Pulmonary embolism',
                            groupValue: selectedDisease ?? '',
                            onChanged: (String? value) {
                              myChoise = 'Pulmonary embolism';
                              onDiseaseSelected(value, context);
                              if (selectedDisease != null) {
                                _chooseTypeOfDiagnosisCubit.chooseTypeOfDiagnosis(
                                    patientId!, selectedDisease!);
                              }
                            },
                          ),
                          ItemRadioButtonRegisterScreen(
                            text: 'Pneumonia',
                            groupValue: selectedDisease ?? '',
                            onChanged: (String? value) {
                              myChoise = 'Pneumonia';
                              onDiseaseSelected(value, context);
                              if (selectedDisease != null) {
                                _chooseTypeOfDiagnosisCubit.chooseTypeOfDiagnosis(
                                    patientId!, selectedDisease!);
                              }
                            },
                          ),
                          ItemRadioButtonRegisterScreen(
                            text: 'Interstitial lung disease',
                            groupValue: selectedDisease ?? '',
                            onChanged: (String? value) {
                              myChoise = 'Interstitial lung disease';
                              onDiseaseSelected(value, context);
                              if (selectedDisease != null) {
                                _chooseTypeOfDiagnosisCubit.chooseTypeOfDiagnosis(
                                    patientId!, selectedDisease!);
                              }
                            },
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

void onDiseaseSelected(String? value, BuildContext context) {
    try {
      setState(() {
        selectedDisease = value;
        print('Selected Disease: $selectedDisease');
      });
    } catch (e) {
      print('Error setting selected disease: $e');
    }
  }
}



