import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/util/app_color.dart';
import 'package:student_registration/util/appstring.dart';
import 'package:student_registration/util/scroll_provider.dart';
import 'package:student_registration/util/drawer/drawerprovider.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            secondaryHeaderColor: AppColors.secondaryColor,
            fontFamily: 'Gilroy'),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
