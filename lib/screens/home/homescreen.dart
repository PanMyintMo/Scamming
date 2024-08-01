part of 'mainpage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<UserModel>? allUsers;
  List<UserModel>? filteredUsers;
  bool isHasUser = false;

  @override
  void initState() {
    super.initState();
    retrieveUsersFromFirestore();
  }

  Future<void> retrieveUsersFromFirestore() async {
    List<UserModel> users = await Auth.fetchAllUserData();

    setState(() {
      allUsers = users;
      filteredUsers = users;
    });
  }

  String normalizePhoneNumber(String phoneNumber) {
    String normalized = phoneNumber.replaceAll(RegExp(r'\D'), '');
    normalized = normalized.replaceFirst(RegExp(r'^\+'), '');
    return normalized;
  }

  void handleSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredUsers = allUsers;
        isHasUser = false;
      });
      return;
    }

    String normalizedQuery = query.toLowerCase();

    List<UserModel> filteredList = allUsers!.where((user) {
      String normalizedPhoneNumber = normalizePhoneNumber(user.phonenumber);
      return user.name.toLowerCase().contains(normalizedQuery) ||
          user.email.toLowerCase().contains(normalizedQuery) ||
          normalizedPhoneNumber.contains(normalizedQuery);
    }).toList();

    setState(() {
      filteredUsers = filteredList;
      isHasUser = filteredUsers!.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSearchBar(onSearch: handleSearch),
          isHasUser
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredUsers?.length ?? 0,
                  itemBuilder: (context, index) {
                    UserModel user = filteredUsers![index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Text(user.phonenumber),
                    );
                  },
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "You can search by name, email, or phone number",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
