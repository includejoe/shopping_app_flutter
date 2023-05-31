import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
              child: Text(
                text,
                style: appStyle(20, Colors.white, FontWeight.bold),
              )
          ),
        ),
      ),
    );
  }
}
