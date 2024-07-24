import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/cubits/doctor_login_cubit/doctor_login_state.dart';
import '../constants.dart';
import '../core/show_snackbar.dart';
import '../cubits/doctor_login_cubit/doctor_login_cubit.dart';
import '../custom_widgets/custom_appBar.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_text_button.dart';
import '../custom_widgets/custom_text_field.dart';
import '../services/doctor_login_service.dart';
import 'forget_password_screen.dart';

class DoctorLoginScreen extends StatelessWidget {
  DoctorLoginScreen({super.key});

  String? name, email, password;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorLoginCubit(service: DoctorLoginService()),
      child: BlocConsumer<DoctorLoginCubit, DoctorLoginState>(
        listener: (context, state) {
          if (state is DoctorLoginLoading) {
            isLoading = true;
          } else if (state is DoctorLoginFailure) {
            isLoading = false;
            showSnackBar(context, state.error);
          } else if (state is DoctorLoginSuccess) {
            isLoading = false;
            navigateToHomePage('doctor');
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
                              height: 30,
                            ),
                            Center(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/doctor.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const CustomLabelText(text: 'name'),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (data) {
                                name = data;
                              },
                              hintText: 'Drali200@gmail.com',
                              suffixIcon: const Icon(
                                Icons.drive_file_rename_outline,
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
                              height: 10,
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
                                text: 'sign in',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    BlocProvider.of<DoctorLoginCubit>(context)
                                        .loginDoctor(
                                            name: name!,
                                            email: email!,
                                            password: password!);
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
