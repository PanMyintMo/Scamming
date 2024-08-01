import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/module/category/categorymodule.dart';
import 'package:student_registration/routes/home/home_route.dart';
import 'package:student_registration/screens/home/mainpage.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeRoutes.homepage,
            child: (context, args) => const MainPage(
                  currentIndex: 0,
                )),
        ModuleRoute(HomeRoutes.category, module: CategoryModule()),
      ];
}
