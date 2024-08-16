import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: screenSize.height / 1,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/tmdb.jpg",
                  width: screenSize.width / 2.5,
                )),
          ],
        ),
      ),
    );
  }
}
