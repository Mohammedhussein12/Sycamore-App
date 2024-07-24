import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/send_notification_show_dialog.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';
import '../../components/warning_list_view.dart';
import '../../components/warning_rich_text.dart';

class WarningPage extends StatelessWidget {
  const WarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.4),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Container(
                height: 480,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const WarningRichText(),
                    SizedBox(
                      height: 280,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: WarningsListView(),
                      ),
                    ),
                     Center(
                      child: CustomButton(onTap: () {
                        sendNotificationShowDialog(context);
                      },
                        text: 'send notification to doctor',
                        borderRadius: 18,
                        width: 220,
                        textFontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: (MediaQuery.of(context).size.width - 100) / 2,
              right: (MediaQuery.of(context).size.width - 100) / 2,
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor, // Change color as needed
                ),
                child: const Center(
                  child: Icon(
                    Icons.warning,
                    color: Colors.white, // Change icon color as needed
                    size: 55, // Change icon size as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
