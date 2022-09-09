import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salary_calc/screens/HomePage.dart';
import 'package:get/get.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: false, systemNavigationBarContrastEnforced: false
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

