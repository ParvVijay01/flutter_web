import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact_page.dart';
// import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/theme/color_scheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: lightMode,
        home: ContactPage());
  }
}
