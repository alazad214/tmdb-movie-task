import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tmdb_task/app/moduils/auth/register/views/register_screen.dart';


class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        _buildPageViewModel(
            title: "If You Looking For Latest Movies",
            body: "This is the first screen of the onboarding.",
            image: const AssetImage(
              'assets/images/poster1.jpg',
            ) //
            ),
        _buildPageViewModel(
          title: "Hello Welcome To Best Movies",
          body: "Here are some features of the app.",
          image: const AssetImage('assets/images/poster2.jpg'), //
        ),
        _buildPageViewModel(
          title: "Only With Us Only For You",
          body: "Let's get started with using the app!",
          image: const AssetImage('assets/images/poster3.jpg'), //
        ),
      ],
      onDone: () {
        Get.to(() =>  RegisterScreen());
      },
      onSkip: () {
        Get.to(() =>  RegisterScreen());
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
    required ImageProvider image,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image(
        image: image,
        width: double.infinity,
        height: 500,
        fit: BoxFit.cover,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
        bodyTextStyle: TextStyle(fontSize: 16.0, color: Colors.black54),
        imageFlex: 3,
        fullScreen: true,
        pageMargin: EdgeInsets.only(),
        imagePadding: EdgeInsets.all(24.0),
      ),
    );
  }
}
