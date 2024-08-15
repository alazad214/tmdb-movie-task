import 'package:flutter/material.dart';

class Iconbox1 extends StatelessWidget {
  final image;
  final color;
  const Iconbox1({super.key, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: color ?? Colors.blue, shape: BoxShape.circle),
            child: Image.asset(image??"assets/images/fb.png", height: 40,)));
  }
}
