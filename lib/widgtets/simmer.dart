import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=0; i<5; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 210.0,
            width: 145.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4.0)),
            child: Lottie.asset("assets/anim/shimmer.json", fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}
