import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/module/auth/auth_module.dart';
import 'package:student_registration/routes/scammer_route.dart';
import 'package:student_registration/splash_screen.dart';
class ScammerModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(ScamRoute.root,
            child: (context, args) => const SplashScreen()),
        ModuleRoute(ScamRoute.register, module: AuthModule()),
     
      ];
}