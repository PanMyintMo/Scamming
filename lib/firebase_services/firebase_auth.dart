import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_registration/firebase_services/fire_store.dart';
import 'package:student_registration/util/applogger.dart';

class Auth {
 static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 static User? get currenUser => _firebaseAuth.currentUser;

  Stream<User?> get authStageChanges => _firebaseAuth.authStateChanges();

 static Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      rethrow;
    }
  }

 static Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String phonenumber,
    required String name,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (currenUser != null) {
        AuthStore().addUserToFirestore(
            userId: currenUser!.uid,
            name: name,
            email: email,
            phonenumber: phonenumber);
      }
    } catch (error) {
      logger.e("Sign up error $error");
      rethrow;
    }
  }

  Future<String> getUserName() async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final String uid = _firebaseAuth.currentUser!.uid;

      final result = await users.doc(uid).get();

      final Map<String, dynamic>? data = result.data() as Map<String, dynamic>?;

      if (data != null && data.containsKey('name')) {
        return data['name'].toString();
      } else {
        throw Exception("Display name not found in Firestore data");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      //  logger.e('Sign out success');
    } catch (e) {
      //logger.e('Sign out error $e');
    }
  }
}
