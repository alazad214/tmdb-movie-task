import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Shimmer2 extends StatelessWidget {
  const Shimmer2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 5; i++)
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              height: 110.0,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.0)),
              child:
                  Lottie.asset("assets/anim/shimmer.json", fit: BoxFit.cover),
            )
        ],
      ),
    );
  }
}
