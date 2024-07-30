import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/routes/auth_routes/authroute.dart';
import 'package:student_registration/screens/auth/registerscreen.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        // ChildRoute(AuthRoutes.login,
        //     child: (context, args) => const LoginScreen()),
        ChildRoute(AuthRoutes.root,
            child: (context, args) => const RegisterScreen())
      ];
}
