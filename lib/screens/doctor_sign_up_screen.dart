import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/core/show_snackbar.dart';
import 'package:sycamore_project/screens/success_register_screen.dart';
import 'package:sycamore_project/services/doctor_register_service.dart';
import '../constants.dart';
import '../cubits/doctor_register_cubit/doctor_register_cubit.dart';
import '../cubits/doctor_register_cubit/doctor_register_state.dart';
import '../custom_widgets/custom_appBar.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_text_field.dart';

class DoctorSignUpScreen extends StatelessWidget {
  DoctorSignUpScreen({Key? key}) : super(key: key);

  String? email, password, confirmPassword, name;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorRegisterCubit(service: DoctorRegisterService()),
      child: BlocConsumer<DoctorRegisterCubit, DoctorRegisterState>(
        listener: (context, state) {
          if (state is DoctorRegisterLoading) {
            isLoading = true;
          } else if (state is DoctorRegisterFailure) {
            isLoading = false;
            showSnackBar(context, state.error);
          } else if (state is DoctorRegisterSuccess) {
            isLoading = false;
            navigateTo(
                page: const SuccessRegisterScreen(selectedUserType: 'doctor'),
                withHistory: false);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'sign up',
                              style: TextStyle(
                                  fontSize: 25,
                                  color:
                                      const Color(0xff030303).withOpacity(0.58),
                                  fontFamily: 'Poppins'),
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
                                  BlocProvider.of<DoctorRegisterCubit>(context)
                                      .registerDoctor(
                                          name: name!,
                                          email: email!,
                                          password: password!,
                                          confirmPassword: confirmPassword!);
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
                                    navigateToLoginPage('doctor');
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
