import 'package:flutter/material.dart';
import 'package:sycamore_project/patient_const.dart';
import '../../../../components/item_list_view_report.dart';
import '../../../../constants.dart';
import '../../../../core/get_report_questions_answers.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    List<String> myList = getQuestionsList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  CustomListItem(
                    title: 'Name: ',
                    value: name??'',
                  ),
                  CustomListItem(
                    title: 'Age: ',
                    value: age??'',
                  ),
                  CustomListItem(
                    title: 'Id: ',
                    value: patientId.toString()??'',
                  ),
                  CustomListItem(
                    title: 'weight: ',
                    value: weight??'',
                  ),
                  CustomListItem(
                    title: 'Height: ',
                    value: height??'',
                  ),
                  CustomListItem(
                    title: 'Chronic Disease: ',
                    value: chronicDiseases.isEmpty?'':chronicDiseases[0]
                  ),
                  CustomListItem(
                    title: 'type of diagnosis : ',
                    value: myChoise??'',
                  ),
                  CustomListItem(
                    title: 'Anemia : ',
                    value: isAnemia? 'yes' : 'no',
                  ),
                  CustomListItem(
                    title: 'Heart rate : ',
                    value: avgSpo2.toStringAsFixed(1)??'',
                  ),
                  CustomListItem(
                    title: 'Minimum oxygen rate : ',
                    value: min.toString()??'',
                  ),
                  CustomListItem(
                    title: 'Maximum oxygen rate : ',
                    value: max.toString()??'',
                  ),
                  CustomListItem(
                    title: 'Temperature : ',
                    value: temp??'',
                  ),
                  CustomListItem(
                    title: 'Rheumatoid : ',
                    value: isRheumatoid? 'yes' : 'no',
                  ),
                  CustomListItem(
                    title: 'Hepatitis B : ',
                    value: chronicDiseases.contains('Hepatitis B')? 'yes' : 'no',
                  ),
                  CustomListItem(
                    title: 'Hepatitis C : ',
                    value: chronicDiseases.contains('Hepatitis B')? 'yes' : 'no',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(myList[index],
                                style: const TextStyle(
                                  fontFamily: 'Alice',
                                  color: Color(0xff76BCBA),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            const SizedBox(width: 4),
                            const Text(
                              'Yes',
                              style: TextStyle(
                                  color: Color(0xff8E8E93),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: myList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
