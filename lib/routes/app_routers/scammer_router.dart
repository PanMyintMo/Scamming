import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/routes/scammer_route.dart';
import 'package:student_registration/module/home/home_module.dart';
import 'package:student_registration/module/auth/auth_module.dart';
import 'package:student_registration/module/category/categorymodule.dart';
import 'package:student_registration/routes/category/category_routes.dart';

class ScammerRouter {
  static void _goToNextPage({
    required String routeName,
    Object? args,
    bool isReplace = false,
    bool isReplaceAll = false,
  }) {
    Logger().e(routeName);
    if (isReplace) {
      Modular.to.pushReplacementNamed(
        routeName,
        arguments: args,
      );
    } else if (isReplaceAll) {
      Modular.to.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: args,
      );
    } else {
      Modular.to.pushNamed(
        routeName,
        arguments: args,
      );
    }
  }

  static void changeRoute<M extends Module>(
    String routes, {
    Object? args,
    bool? isReplace,
    bool? isReplaceAll,
    bool? clearStack,
  }) {
    String tempRoute = "";
    switch (M) {
      case AuthModule:
        tempRoute = ScamRoute.register;
        break;

      case HomeModule:
        tempRoute = ScamRoute.home;

        break;

      case CategoryModule:
        tempRoute =  ScamRoute.home + CategoryRoutes.root;
        break;
    }

    _goToNextPage(
      routeName: "$tempRoute$routes",
      args: args,
      isReplace: isReplace ?? false,
      isReplaceAll: isReplaceAll ?? false,
    );
  }
}
