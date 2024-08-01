import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:student_registration/firebase_services/firebase_auth.dart';
import 'package:student_registration/model/usermodel.dart';
import 'package:student_registration/module/home/home_module.dart';
import 'package:student_registration/routes/app_routers/scammer_router.dart';
import 'package:student_registration/routes/home/home_route.dart';
import 'package:student_registration/util/app_button/app_button_style.dart';
import 'package:student_registration/util/app_color.dart';
import 'package:student_registration/util/auth_decor/app_textfield.dart';
import 'package:student_registration/util/auth_decor/decoration.dart';
import 'package:student_registration/util/validation/validation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  FocusNode focusNode = FocusNode();
  //final FocusNode _passwordFocus = FocusNode();

  bool _hidePwd = true;
  String? countryCode;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                appTextField(
                  controller: nameController,
                  labelText: "Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                appTextField(
                  controller: emailController,
                  labelText: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  controller: phoneNumberController,
                  focusNode: focusNode,
                  decoration: authdecor(labelText: 'Phone Number'),
                  languageCode: "en",
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                  },
                  onCountryChanged: (country) {
                    countryCode = country.code;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    obscureText: _hidePwd,
                    validator: FormValidator.validatePassword,
                    controller: passwordController,
                    enableSuggestions: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: authdecor(
                      labelText: 'Password',
                      suffixIcon: InkWell(
                        child: _hidePwd
                            ? const Icon(
                                Icons.remove_red_eye,
                                color: AppColors.greenColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.greenColor,
                              ),
                        onTap: () => setState(() => _hidePwd = !_hidePwd),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                appbutton(context, btnText: 'Register', () async {
                  _formKey.currentState?.validate();

                  await Auth.createUserWithEmailAndPassword(
                          password: passwordController.text.trim().toString(),
                          role: 'user',
                          userModel: UserModel(
                              name: nameController.text.trim().toString(),
                              email: emailController.text.trim().toString(),
                              phonenumber: phoneNumber ??
                                  phoneNumberController.text.trim().toString()))
                      .then((_) => ScammerRouter.changeRoute<HomeModule>(
                          HomeRoutes.homepage));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
