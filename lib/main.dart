import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:beijing/utils/themes.dart';
import 'package:beijing/views/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: BeijingTheme.lightThemeData,
      darkTheme: BeijingTheme.darkThemeData,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
