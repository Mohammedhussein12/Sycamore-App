import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sycamore_project/screens/splash_screen.dart';
import 'core/helper_methods.dart';
import 'localization_service/localization_service.dart';

void main() {
  runApp(SycamoreApp());
}

class SycamoreApp extends StatelessWidget {
  SycamoreApp({super.key});

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      init: localizationController,
      builder: (LocalizationController controller) {
        return MaterialApp(
          localeResolutionCallback:
              LocalizationService.localeResolutionCallBack,
          supportedLocales: LocalizationService.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // Add your custom localization delegate here if any
            ...LocalizationService.localizationsDelegate,
          ],
          locale: controller.currentLanguage.isNotEmpty
              ? Locale(controller.currentLanguage)
              : null,
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: false,
          ),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
