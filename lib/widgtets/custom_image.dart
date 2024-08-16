import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final image;
  const CustomImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
