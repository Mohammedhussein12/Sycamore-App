import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/cubits/patient_register_cubit/patient_register_state.dart';
import 'package:sycamore_project/custom_widgets/custom_appBar.dart';
import 'package:sycamore_project/screens/first_register_screen.dart';
import 'package:sycamore_project/screens/patient_login_screen.dart';
import 'package:sycamore_project/services/patient_register_service.dart';
import '../core/show_snackbar.dart';
import '../cubits/patient_register_cubit/patient_register_cubit.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_text_field.dart';

class PatientSignUpScreen extends StatelessWidget {
  PatientSignUpScreen({super.key});

  String? email, password, confirmPassword, doctorId;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PatientRegisterCubit(service: PatientRegisterService()),
      child: BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
        listener: (context, state) {
          if (state is PatientRegisterLoading) {
            isLoading = true;
          } else if (state is PatientRegisterFailure) {
            isLoading = false;
            showSnackBar(context, state.error);
          } else if (state is PatientRegisterSuccess) {
            isLoading = false;
            navigateTo(page: const FirstRegisterScreen(), withHistory: false);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'sign up',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                  color:
                                  const Color(0xff030303).withOpacity(0.58),
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomLabelText(
                            text: 'doctor id',
                            fontSize: 24,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (data) {
                              doctorId = data;
                            },
                            obscureText: false,
                            hintText: '••••••••••••••••••••',
                            suffixIcon: const Icon(
                              FontAwesomeIcons.idCard,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomLabelText(text: 'email'),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (data) {
                              email = data;
                            },
                            hintText: 'Drali200@gmail.com',
                            suffixIcon: const Icon(
                              Icons.email,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomLabelText(text: 'password'),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (data) {
                              password = data;
                            },
                            obscureText: true,
                            hintText: '••••••••••••••••••••',
                            suffixIcon: const Icon(
                              Icons.lock,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomLabelText(text: 'confirm your password'),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (data) {
                              confirmPassword = data;
                            },
                            obscureText: true,
                            hintText: '••••••••••••••••••••',
                            suffixIcon: const Icon(
                              Icons.lock,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: CustomButton(
                              text: 'Sign Up',
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  BlocProvider.of<PatientRegisterCubit>(context)
                                      .registerPatient(
                                      email: email!,
                                      password: password!,
                                      confirmPassword: confirmPassword!,
                                      doctorId: doctorId!);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(
                                        page: PatientLoginScreen(),
                                        withHistory: false);
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}