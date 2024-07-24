import 'package:flutter/material.dart';
import 'package:sycamore_project/components/patient_list_view_item.dart';
import '../models/patient_doctor_home_screen_model.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({
    Key? key,
    required this.patients,
  }) : super(key: key);

  final List<PatientModel> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PatientItem(item: patients[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: patients.length,
    );
  }
}
