class CategoryModel {
  final String? cateId;
  final String cateName;

  CategoryModel({this.cateId, required this.cateName});

  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      cateId: data['cateId'] as String?,
      cateName: data['cateName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cateId': cateId,
      'cateName': cateName,
    };
  }
}
