import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sycamore_project/patient_bottom_navigation_bar/pages/automated_session_page.dart';
import 'package:sycamore_project/patient_bottom_navigation_bar/pages/home_page.dart';
import 'package:sycamore_project/patient_bottom_navigation_bar/pages/report_page.dart';
import 'package:sycamore_project/patient_bottom_navigation_bar/pages/warning_page.dart';

class PatientBottomNavController extends StatefulWidget {
  const PatientBottomNavController({
    super.key,
  });

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<PatientBottomNavController> {
  final _pages = [
    HomePage(),
    const ReportPage(),
    const WarningPage(),
    const PatientAutomatedSessionPage(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle:
              const TextStyle(overflow: TextOverflow.visible, fontSize: 12),
          showUnselectedLabels: true,
          elevation: 5,
          selectedItemColor: const Color(0xff1D938F),
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          selectedLabelStyle: const TextStyle(
              color: Color(0xff1D938F),
              overflow: TextOverflow.visible,
              fontSize: 13),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.clipboardList), label: "Report"),
            BottomNavigationBarItem(
                icon: Icon(Icons.warning), label: "warning"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.clockRotateLeft),
                label: "automated session"),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
