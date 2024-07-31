class UserModel {
  final String name;
  final String email;
  final String phonenumber;

  UserModel({
    required this.name,
    required this.email,
    required this.phonenumber,
  });

  // Factory method to create a UserModel from a map
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phonenumber: data['phonenumber'] ?? '',
    );
  }
}
