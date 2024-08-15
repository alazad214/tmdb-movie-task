import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tmdb_task/app/moduils/auth/login/views/login_screen.dart';
import 'package:tmdb_task/app/moduils/home/views/home_screen.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        _buildPageViewModel(
            title: "Learn new skills everyday!",
            body: "This is the first screen of the onboarding.",
            image: const AssetImage(
              'assets/images/poster1.jpg',
            ) //
            ),
        _buildPageViewModel(
          title: "Choose your plan!",
          body: "Here are some features of the app.",
          image: const AssetImage('assets/images/poster2.jpg'), //
        ),
        _buildPageViewModel(
          title: "Get Started",
          body: "Let's get started with using the app!",
          image: const AssetImage('assets/images/poster3.jpg'), //
        ),
      ],
      onDone: () {
        Get.to(() => const LoginScreen());
      },
      onSkip: () {
        Get.to(() => const LoginScreen());
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      back: const Icon(Icons.arrow_forward),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.indigoAccent,
        color: Colors.grey,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
      ),
    );
  }

  PageViewModel _buildPageViewModel({
    required String title,
    required String body,
    required ImageProvider image, // Updated to ImageProvider
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image(image: image, width: double.infinity, height: 300),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16.0, color: Colors.black54),
        imagePadding: EdgeInsets.all(24.0),
      ),
    );
  }
}
