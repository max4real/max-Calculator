import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:max_calculator/modules/calculator/v/v_calculator.dart';
import 'package:max_calculator/modules/shared/services/theme_services/c_theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'max Calculator',
      useInheritedMediaQuery: true,
      locale: const Locale('en', 'EN'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CalculatorPage(),
    );
  }

  void initializeTheme() {
    Get.put(ThemeController());
  }
}
