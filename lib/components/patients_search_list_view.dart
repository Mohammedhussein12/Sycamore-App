import 'package:flutter/Material.dart';
import 'package:sycamore_project/components/search_patient.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/doctor_bottom_navigation_bar/pages/patient_report_screen/patient_report_screen.dart';
import '../constants.dart';
import '../models/patient_doctor_home_screen_model.dart';
import '../services/doctor_get_patient_info_service.dart';

class PatientsSearchListView extends StatelessWidget {
  PatientsSearchListView({Key? key}) : super(key: key);

  final PatientService _patientList = PatientService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Patients List'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchPatient());
              },
              icon: const Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder<List<PatientModel>>(
            future: _patientList.fetchPatientInfo(),
            builder: (context, snapshot) {
              print('FutureBuilder state: ${snapshot.connectionState}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(
                  child: Text('An error occurred: ${snapshot.error}'),
                );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No results found'),
                );
              }

              List<PatientModel> data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigateTo(page: const PatientReportScreen(), withHistory: true);
                      },
                      child: ListTile(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${data[index].id}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data[index].email,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
