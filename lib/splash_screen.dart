import 'package:flutter/material.dart';
import 'package:student_registration/firebase_services/firebase_auth.dart';
import 'package:student_registration/module/home/home_module.dart';
import 'package:student_registration/routes/app_routers/scammer_router.dart';
import 'package:student_registration/routes/home/home_route.dart';
import 'package:student_registration/util/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Auth.authStageChanges.listen((snapShot) {
        if (snapShot != null && snapShot.email != null) {
          ScammerRouter.changeRoute<HomeModule>(
            HomeRoutes.homepage,
          );
        } else {
          ScammerRouter.changeRoute<HomeModule>(
            HomeRoutes.homepage,
          );
          //ScammerRouter.changeRoute<AuthModule>(AuthRoutes.root);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Center(
          child: Image.asset('assets/images/ithub.png', width: 95, height: 95),
        ),
      ),
    );
  }
}
