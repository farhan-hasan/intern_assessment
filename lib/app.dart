import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_assessment/controller_binder.dart';
import 'package:intern_assessment/screens/main_bottom_nav_bar_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intern Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MainBottomNavBarScreen(),
      initialBinding:ControllerBinder(),
    );
  }
}