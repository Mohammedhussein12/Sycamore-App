import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/doctor_home_screen.dart';
import '../pages/patient_profile_session_screen.dart';
import '../pages/patient_report_screen/patient_report_screen.dart';

class DoctorBottomNavController extends StatefulWidget {
  const DoctorBottomNavController({
    super.key,
  });
  @override
  _DoctorBottomNavControllerState createState() => _DoctorBottomNavControllerState();
}

class _DoctorBottomNavControllerState extends State<DoctorBottomNavController> {
  final _pages = [
    const DoctorHomePage(),
    const PatientReportScreen(),
    const PatientSessionScreen(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: const Color(0xff1D938F),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle: const TextStyle(
          color: Color(0xff1D938F),
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.clipboardList), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Patient Session"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
