import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomeScreen", style: appStyle(30, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
