import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SearchScreen", style: appStyle(30, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
