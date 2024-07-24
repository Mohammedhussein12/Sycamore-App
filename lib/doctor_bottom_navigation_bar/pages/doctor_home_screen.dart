import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sycamore_project/cubits/doctor_register_cubit/doctor_register_cubit.dart';
import 'package:sycamore_project/services/search_patients_service.dart';
import '../../components/doctor_app_bar.dart';
import '../../components/patients_list_view.dart';
import '../../components/search_text_field.dart';
import '../../constants.dart';
import '../../core/helper_methods.dart';
import '../../core/show_snackbar.dart';
import '../../cubits/doctor_get_patients_info_cubit/doctor_get_patients_info_cubit.dart';
import '../../cubits/doctor_get_patients_info_cubit/doctor_get_patients_info_state.dart';
import '../../cubits/doctor_login_cubit/doctor_login_cubit.dart';
import '../../cubits/doctor_logout_cubit/doctor_logout_cubit.dart';
import '../../cubits/doctor_logout_cubit/doctor_logout_state.dart';
import '../../services/doctor_get_patient_info_service.dart';
import '../../services/doctor_login_service.dart';
import '../../services/doctor_logout_service.dart';
import '../../services/doctor_register_service.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  bool isLoading = false;
  final patientsCubit = PatientsCubit(service: PatientService());
  PatientSearchService patientList = PatientSearchService();

  @override
  void initState() {
    super.initState();
    patientsCubit.fetchPatients();
  }

  @override
  void dispose() {
    patientsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  BlocProvider<DoctorRegisterCubit>(
                    create: (context) =>
                        DoctorRegisterCubit(service: DoctorRegisterService()),
                  ),
                  BlocProvider<DoctorLoginCubit>(
                    create: (context) =>
                        DoctorLoginCubit(service: DoctorLoginService()),
                  ),
                  BlocProvider<DoctorLogoutCubit>(
                    create: (context) =>
                        DoctorLogoutCubit(service: DoctorLogoutService()),
                  ),
                ],
                child: BlocConsumer<DoctorLogoutCubit, DoctorLogoutState>(
                  listener: (context, state) {
                    if (state is DoctorLogoutLoading) {
                      isLoading = true;
                    } else if (state is DoctorLogoutSuccess) {
                      isLoading = false;
                      navigateToLoginPage('doctor');
                    } else if (state is DoctorLogoutFailure) {
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
                          log(doctorToken.toString());
                          if (doctorToken != null) {
                            BlocProvider.of<DoctorLogoutCubit>(context)
                                .logoutDoctor();
                          }
                        },
                        child: const ListTile(
                          leading: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: kPrimaryColor,
                            size: 19,
                          ),
                          title: Text(
                            textAlign: TextAlign.center,
                            'Logout',
                            style: TextStyle(
                              color: kPrimaryColor,
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff90C8BF),
        scrolledUnderElevation: 6,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffAAD3C5),
                    const Color(0xff40A39C).withOpacity(0.6),
                  ],
                ),
              ),
              height: 310,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topCenter,
                    child: DoctorAppBar(
                      doctorName: 'ali',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Let\'s find your\n\tpatient information !',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0, right: 18.0),
                    child: SearchTextField(),
                  ),
                  SizedBox(height: 2.0),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'patients',
                  style: TextStyle(
                      color: const Color(0xff030303).withOpacity(0.7),
                      fontSize: 20),
                ),
                const Spacer(
                  flex: 10,
                ),
                Icon(
                  FontAwesomeIcons.arrowDownWideShort,
                  color: const Color(0xff030303).withOpacity(0.7),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: BlocBuilder<PatientsCubit, PatientsState>(
                bloc: patientsCubit,
                builder: (context, state) {
                  if (state is PatientsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PatientsLoaded) {
                    return PatientsListView(patients: state.patients);
                  } else if (state is PatientsError) {
                    showSnackBar(context, state.error);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
