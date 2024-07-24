import 'package:flutter/material.dart';
import 'package:sycamore_project/doctor_bottom_navigation_bar/pages/patient_report_screen/pages/about_page.dart';
import 'package:sycamore_project/doctor_bottom_navigation_bar/pages/patient_report_screen/pages/graph_page.dart';


class PatientReportScreen extends StatefulWidget {
  const PatientReportScreen({Key? key, this.patientName})
      : super(key: key);

  final String? patientName;
  @override
  State<PatientReportScreen> createState() => _PatientReportScreenState();
}

class _PatientReportScreenState extends State<PatientReportScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          AboutPage(),
          GraphPage(),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset('assets/images/patient_picture.jpeg'),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'patient report',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: const Color(0xff359E98),
          padding: const EdgeInsets.symmetric(horizontal: 50),
          labelColor: Colors.black,
          tabs: const [
            Tab(
              text: 'About',
            ),
            Tab(
              text: 'Graph',
            ),
          ],
        ),
      ),
    );
  }
}
