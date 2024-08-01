import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/routes/category/category_routes.dart';
import 'package:student_registration/screens/category/all_categoryscreen.dart';
import 'package:student_registration/screens/category/categoryscreen.dart';

class CategoryModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          CategoryRoutes.root,
          child: (context, args) => const CategoryScreen(),
        ),
        ChildRoute(
          CategoryRoutes.allCate,
          child: (context, args) => const AllCategoryScreen(),
        )
      ];
}
