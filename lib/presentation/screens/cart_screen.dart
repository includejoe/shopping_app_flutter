import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("CartScreen", style: appStyle(30, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
