import 'package:flutter/material.dart';
import 'package:student_registration/firebase_services/firebase_auth.dart';
import 'package:student_registration/model/categorymodel.dart';
class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  List<CategoryModel> categoreisList = [];
  CategoryModel? categoryModel;
  @override
  void initState() {
    super.initState();
    retreveAllCategory();
  }

  Future<void> retreveAllCategory() async {
    categoreisList = await Auth.fetchAllCategoryData();
    

    setState(() {
      categoreisList = categoreisList;
    
    });
  }

  void handleSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        categoreisList = categoreisList;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category'),
      ),
      body: ListView.builder(
          itemCount: categoreisList.length,
          itemBuilder: ((context, index) {
            categoryModel = categoreisList[index];
            return ListTile(
              title: Text(categoryModel!.cateName.toString()),
            );
          })),
    );
  }
}
