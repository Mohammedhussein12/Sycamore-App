import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sycamore_project/constants.dart';
import '../../components/oxygen_rate_item.dart';

class PatientSessionScreen extends StatefulWidget {
  const PatientSessionScreen({super.key});

  @override
  State<PatientSessionScreen> createState() => _PatientSessionScreenState();
}

class _PatientSessionScreenState extends State<PatientSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        backgroundColor: const Color(0xff40A39C).withOpacity(0.01),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  showDatePickerBottomSheet(context);
                  setState(() {});
                },
                child: Text(
                  style: const TextStyle(color: Colors.white),
                  DateFormat('yMMMMEEEEd').format(selectedDate),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff40A39C).withOpacity(0.5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OxygenRateItem(height: 280, width: 300),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
      });
    }
  }

  void showDatePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return SizedBox(
          height: 300.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Select a Date',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate,
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        selectedDate = newDate;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  onPressed: () {
                    // Close the bottom sheet when the "Done" button is pressed
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
