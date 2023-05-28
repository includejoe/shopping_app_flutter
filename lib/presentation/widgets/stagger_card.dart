import 'package:flutter/material.dart';
import 'package:shopping_app/utils/app_style.dart';

class StaggerCard extends StatefulWidget {
  const StaggerCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price, required this.height
  }) : super(key: key);

  final double height;
  final String image;
  final String name;
  final String price;

  @override
  State<StaggerCard> createState() => _StaggerCardState();
}

class _StaggerCardState extends State<StaggerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset( widget.image, fit: BoxFit.fill),
            Container(
              height: widget.height,
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.name, style: appStyleWithHt(25, Colors.black, FontWeight.w700, 1)),
                  const SizedBox(height: 8,),
                  Text(widget.price, style: appStyleWithHt(18, Colors.black, FontWeight.w500, 1))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
