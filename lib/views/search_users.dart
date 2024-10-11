import 'package:chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({super.key});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
                color: kSecondaryColor, borderRadius: BorderRadius.circular(6)),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter phone number"),
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
          )),
    );
  }
}
