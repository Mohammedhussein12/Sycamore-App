import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/item_list_view_report.dart';
import '../../constants.dart';
import '../../core/result_show_dialog.dart';
import '../../cubits/predict_patient_oxygen_cubit/predict_oxygen_cubit.dart';
import '../../custom_widgets/custom_button.dart';
import '../../patient_const.dart';
import '../../services/predict_patient_oxygen_service.dart';

class PatientAutomatedSessionPage extends StatefulWidget {
  const PatientAutomatedSessionPage({
    super.key,
    this.patientName,
    this.image,
  });

  final String? patientName;
  final String? image;

  @override
  State<PatientAutomatedSessionPage> createState() =>
      _PatientAutomatedSessionPageState();
}

class _PatientAutomatedSessionPageState extends State<PatientAutomatedSessionPage> {
  late PredictOxygenCubit _predictOxygenCubit;
  double? predictionLiters;

  @override
  void initState() {
    super.initState();
    _predictOxygenCubit = PredictOxygenCubit(PredictOxygenService());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _predictOxygenCubit,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.4),
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
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                          widget.image ?? 'assets/images/patient1.png'),
                    ),
                    Text(
                      'Medical History of ${widget.patientName ?? 'Patient'}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CustomListItem(
                      title: 'Name: ',
                      value: name ?? '',
                    ),
                    CustomListItem(
                      title: 'Age: ',
                      value: age ?? '',
                    ),
                    CustomListItem(
                      title: 'Chronic Disease: ',
                      value: chronicDiseases.isEmpty ? '' : chronicDiseases[0],
                    ),
                    CustomListItem(
                      title: 'type of diagnosis : ',
                      value: myChoise ?? '',
                    ),
                    CustomListItem(
                      title: 'Anemia : ',
                      value: isAnemia ? 'yes' : 'no',
                    ),
                    CustomListItem(
                      title: 'Spo2 : ',
                      value: avgSpo2.toString() ?? '',
                    ),
                    CustomListItem(
                      title: 'Temperature : ',
                      value: temp ?? '',
                    ),
                    CustomListItem(
                      title: 'Hepatitis B : ',
                      value: chronicDiseases.contains('Hepatitis C')
                          ? 'yes'
                          : 'no',
                    ),
                    CustomListItem(
                      title: 'Hepatitis C : ',
                      value: chronicDiseases.contains('Hepatitis B')
                          ? 'yes'
                          : 'no',
                    ),
                    const CustomListItem(
                      title: 'Heart rate : ',
                      value: '90',
                    ),
                    CustomListItem(
                      title: 'weight : ',
                      value: weight ?? "",
                    ),
                    CustomListItem(
                      title: 'Height : ',
                      value: height ?? "",
                    ),
                    const CustomListItem(
                      title: 'in body : ',
                      value: '.0027',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'next',
                  onTap: () {
                    _predictOxygenCubit.predictAmountOfOxygen();
                    showResultDialog(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}