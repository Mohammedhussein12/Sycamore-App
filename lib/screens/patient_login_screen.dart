import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/cubits/patient_login_cubit/patient_login_cubit.dart';
import 'package:sycamore_project/cubits/patient_login_cubit/patient_login_state.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';
import 'package:sycamore_project/custom_widgets/custom_label_text_form_field.dart';
import 'package:sycamore_project/custom_widgets/custom_text_field.dart';
import 'package:sycamore_project/screens/forget_password_screen.dart';
import 'package:sycamore_project/services/patient_login_service.dart';
import '../core/show_snackbar.dart';
import '../custom_widgets/custom_appBar.dart';
import '../custom_widgets/custom_text_button.dart';

class PatientLoginScreen extends StatelessWidget {
  PatientLoginScreen({super.key});

  String? email, password, doctorId;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientLoginCubit(service: PatientLoginService()),
      child: BlocConsumer<PatientLoginCubit, PatientLoginState>(
        listener: (context, state) {
          if (state is PatientLoginLoading) {
            isLoading = true;
          } else if (state is PatientLoginFailure) {
            isLoading = false;
            showSnackBar(context, state.error);
          } else if (state is PatientLoginSuccess) {
            isLoading = false;
            navigateToHomePage('patient');
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
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
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 150.0),
                                child: Text(
                                  'sign in',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color(0xff030303)
                                          .withOpacity(0.6),
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
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
                            const CustomLabelText(text: 'your doctor id'),
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
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomTextButton(
                                color: kPrimaryColor,
                                text: 'forget password ?',
                                onPressed: () {
                                  navigateTo(
                                      page: const ForgetPasswordScreen(),
                                      withHistory: true);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: CustomButton(
                                text: 'Sign In',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    BlocProvider.of<PatientLoginCubit>(context)
                                        .loginPatient(
                                      email: email!,
                                      password: password!,
                                      doctorId: doctorId!,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
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
