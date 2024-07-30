import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_registration/scammer_module.dart';
import 'package:student_registration/student.dart';
import 'package:student_registration/util/applogger.dart';
import 'package:student_registration/firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  try {
    await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  } catch (error) {
    logger.e("Firebase initialize Failed $error");
  }
  runApp(ModularApp(module: ScammerModule(), child: const Student()));
}
