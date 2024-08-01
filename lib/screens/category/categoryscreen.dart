import 'package:flutter/material.dart';
import 'package:student_registration/model/categorymodel.dart';
import 'package:student_registration/firebase_services/fire_store.dart';
import 'package:student_registration/module/home/home_module.dart';
import 'package:student_registration/routes/app_routers/scammer_router.dart';
import 'package:student_registration/routes/home/home_route.dart';
import 'package:student_registration/util/auth_decor/app_textfield.dart';
import 'package:student_registration/util/app_button/app_button_style.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final cateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 5,
              ),
              appTextField(
                controller: cateController,
                labelText: "Cate Name",
              ),
              const SizedBox(
                height: 20,
              ),
              appbutton(context, btnText: 'Create Category', () async {
                _formKey.currentState?.validate();

                await AuthStore.addCategoryToFirestore(
                        categoryModel: CategoryModel(
                            cateName:
                                cateController.text.trim().toString()))
                    .then((_) => ScammerRouter.changeRoute<HomeModule>(
                        HomeRoutes.homepage));
              })
            ],
          ),
        ),
      ),
    );
  }
}
