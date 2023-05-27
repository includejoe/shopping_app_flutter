import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ProfileScreen", style: appStyle(30, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
