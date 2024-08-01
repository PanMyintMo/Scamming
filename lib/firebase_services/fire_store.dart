import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_registration/model/categorymodel.dart';
import 'package:student_registration/model/usermodel.dart';
import 'package:student_registration/util/applogger.dart';

class AuthStore {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //add category to firestore
  static Future<void> addCategoryToFirestore(
      {required CategoryModel categoryModel}) async {
    try {
      String cateId =
          categoryModel.cateId ?? _firestore.collection('categories').doc().id;

      await _firestore.collection('categories').doc(categoryModel.cateId).set({
        'cateId': cateId,
        'cateName': categoryModel.cateName,
      });

      logger.e("Successful category adding to firestore.");
    } catch (error) {
      logger.e("Error adding category data to Firestore: $error");

      rethrow;
    }
  }

//to add user to firestore
  static Future<void> addUserToFirestore({
    required String userId,
    required UserModel userModel,
    required String role,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': userModel.name,
        'email': userModel.email,
        'phonenumber': userModel.phonenumber,
        'role': role
      });

      logger.e("Successful user adding to firestore.");
    } catch (error) {
      logger.e("Error adding user data to Firestore: $error");

      rethrow;
    }
  }
}
