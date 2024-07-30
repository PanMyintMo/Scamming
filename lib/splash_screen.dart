import 'package:flutter/material.dart';
import 'package:student_registration/module/auth/auth_module.dart';
import 'package:student_registration/routes/app_routers/scammer_router.dart';
import 'package:student_registration/routes/auth_routes/authroute.dart';
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

        ScammerRouter.changeRoute<AuthModule>(AuthRoutes.register);
        // Auth().authStageChanges.listen((snapShot) {
        //   if (snapShot != null && snapShot.email != null) {
        //     AppRouter.changeRoute<AdminModule>(AppRoutes.root, context: context, isReplaceAll: true,);
        //   } else {
        //     AppRouter.changeRoute<AuthModule>(AppRoutes.login, context: context);
        //   }
        // });
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
