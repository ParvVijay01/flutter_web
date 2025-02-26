import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/routes/app_pages.dart';
import 'package:portfolio/theme/color_scheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Portfolio",
      theme: lightMode,
      initialRoute: AppPages.HOME,
      unknownRoute: GetPage(name: '/notFound', page: () => HomePage()),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
  }
}
