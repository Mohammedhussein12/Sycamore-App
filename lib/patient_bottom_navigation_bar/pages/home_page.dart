import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/components/patient_oxygen_rate_container.dart';
import 'package:sycamore_project/controllers/tips_patient_home_page_controller.dart';
import 'package:sycamore_project/core/show_snackbar.dart';
import 'package:sycamore_project/cubits/patient_logout_cubit/patient_logout_cubit.dart';
import 'package:sycamore_project/services/patient_logout_service.dart';
import '../../components/list_view_patient_home_tips.dart';
import '../../components/patient_heart_rate_item.dart';
import '../../components/patient_oxygen_rate_item.dart';
import '../../constants.dart';
import '../../core/helper_methods.dart';
import '../../cubits/patient_login_cubit/patient_login_cubit.dart';
import '../../cubits/patient_logout_cubit/patient_logout_state.dart';
import '../../cubits/patient_register_cubit/patient_register_cubit.dart';
import '../../services/patient_login_service.dart';
import '../../services/patient_register_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePatientTipsController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Column(
            children: [
              Text(
                'Hi, mohamed',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'How is your health !',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: CircleAvatar(
                child: Image.asset('assets/images/patient_profile.png'),
              ),
            ),
          ],
        ),
        drawer: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Drawer(
            width: 200,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                MultiBlocProvider(
                  providers: [
                    BlocProvider<PatientRegisterCubit>(
                      create: (context) => PatientRegisterCubit(
                          service: PatientRegisterService()),
                    ),
                    BlocProvider<PatientLoginCubit>(
                      create: (context) =>
                          PatientLoginCubit(service: PatientLoginService()),
                    ),
                    BlocProvider<PatientLogoutCubit>(
                      create: (context) =>
                          PatientLogoutCubit(service: PatientLogoutService()),
                    ),
                  ],
                  child: BlocConsumer<PatientLogoutCubit, PatientLogoutState>(
                    listener: (context, state) {
                      if (state is PatientLogoutLoading) {
                        isLoading = true;
                      } else if (state is PatientLogoutSuccess) {
                        isLoading = false;
                        navigateToLoginPage('patient');
                      } else if (state is PatientLogoutFailure) {
                        isLoading = false;
                        showSnackBar(context, "Logout failed: ${state.error}");
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(60, 70),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () {
                            log(patientToken.toString());
                            if (patientToken != null) {
                              BlocProvider.of<PatientLogoutCubit>(context)
                                  .logoutPatient();
                            }
                          },
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.arrowLeft,
                              size: 19,
                              color: kPrimaryColor,
                            ),
                            title: Text(
                              textAlign: TextAlign.center,
                              'Logout',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PatientOxygenRateItem(),
                  PatientHeartRateItem(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Daily Progress',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PatientOxygenRateContainer(
                      color: const Color(0xff1D938F),
                      text: 'minimum\noxygen rate',
                      oxygenRate: min.toString(),
                      width: 95,
                      height: 100,
                      textColor: Colors.black,
                      fontSize: 15,
                    ),
                    PatientOxygenRateContainer(
                      color: const Color(0xff000000),
                      text: 'maximum\noxygen rate',
                      oxygenRate: max.toString(),
                      width: 95,
                      height: 100,
                      textColor: Colors.black,
                      fontSize: 15,
                    ),
                    PatientOxygenRateContainer(
                      color: const Color(0xffF81A1A),
                      text: 'average\noxygen rate',
                      oxygenRate: avgSpo2.toStringAsFixed(1),
                      width: 95,
                      height: 100,
                      textColor: Colors.black,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Tips for your health',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListViewPatientHomeTips(controller: controller),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
