import 'package:flutter/material.dart';

import 'package:student_registration/util/app_color.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 100,
        backgroundImage: AssetImage(
          'assets/images/ithub.png',
        ),
      ),
    );
  }
}
