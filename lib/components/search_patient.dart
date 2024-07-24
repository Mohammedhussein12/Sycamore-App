import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/doctor_bottom_navigation_bar/pages/patient_report_screen/patient_report_screen.dart';
import 'package:sycamore_project/models/patient_doctor_home_screen_model.dart';
import 'package:sycamore_project/services/search_patients_service.dart';

class SearchPatient extends SearchDelegate {
  final PatientSearchService _patientList = PatientSearchService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Please enter a search term'),
      );
    }

    return FutureBuilder<List<PatientModel>>(
      future: _patientList.searchPatient(query),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Patient'),
    );
  }
}
