import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'MyHome_page.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: searchController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Tìm kiếm',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          // TODO: Handle search query
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            searchController.clear();
          },
        ),
      ],
    );
  }
}
