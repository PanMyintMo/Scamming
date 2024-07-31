import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_registration/util/applogger.dart';

class AuthStore {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//to add user to firestore
  static Future<void> addUserToFirestore({
    required String userId,
    required String name,
    required String email,
    required String phonenumber,
    required String role,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'phonenumber': phonenumber,
        'role': role
      });

      logger.e("uccessful user adding to firestore.");
    } catch (error) {
      logger.e("Error adding user data to Firestore: $error");

      rethrow;
    }
  }
}
