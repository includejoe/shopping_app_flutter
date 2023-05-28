import 'package:flutter/material.dart';

class LatestCards extends StatelessWidget {
  const LatestCards({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 0.8,
                    offset: Offset(0, 1)
                )
              ]
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.28,
          child: Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
          )
      ),
    );
  }
}
