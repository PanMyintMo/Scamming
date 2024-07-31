import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/routes/home/home_route.dart';
import 'package:student_registration/screens/home/homescreen.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeRoutes.homepage,
            child: (context, args) => const HomePageScreen())
      ];
}
