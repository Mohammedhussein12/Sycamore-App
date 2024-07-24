import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';
import 'package:sycamore_project/helper/motor.dart';
import '../cubits/predict_patient_oxygen_cubit/predict_oxygen_cubit.dart';
import '../cubits/predict_patient_oxygen_cubit/predict_oxygen_state.dart';
import '../services/predict_patient_oxygen_service.dart';

void showResultDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => PredictOxygenCubit(PredictOxygenService()),
        child: BlocBuilder<PredictOxygenCubit, PredictOxygenState>(
          builder: (context, state) {
            if (state is PredictOxygenLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PredictOxygenLoaded) {
              predictionLiters = state.response.prediction.toString();
            } else if (state is PredictOxygenError) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xffF5F8FF),
                      radius: 35,
                      child: Icon(
                        Icons.check,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'you need ${prediction?.prediction.toStringAsFixed(1) ?? '1'} liter of\noxygen',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'please press here to start the\n process',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTap: () => sendDataToNodeMCU(prediction.toString()),
                      text: 'start',
                      borderRadius: 25,
                    ),
                    SizedBox(height: 10,)
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
