import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  hintText: 'Search Here.....',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      widget.onSearch('');
                    },
                  ),
                ),
                onChanged: (value) {
                  widget.onSearch(value);
                },
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  widget.onSearch(searchController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
