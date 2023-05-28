import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    this.onPress,
    required this.btnColor,
    required this.label, required this.width
  }) : super(key: key);

  final void Function()? onPress;
  final double width;
  final Color btnColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        width: width,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: btnColor,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9))
        ),
        child: Center(
          child: Text(
            label,
            style: appStyle(20, btnColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
