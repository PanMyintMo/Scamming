import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/util/app_color.dart';
import 'package:student_registration/util/appstring.dart';
class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          secondaryHeaderColor: AppColors.secondaryColor,
          fontFamily: 'Gilroy'),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}