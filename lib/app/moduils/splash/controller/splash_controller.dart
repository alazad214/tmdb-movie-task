import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_task/app/moduils/onboading/views/onboading_screen.dart';
import '../../auth/register/controller/auth_controller.dart';
import '../../bottom nav/views/bottom_nav_screen.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkSession();
  }

  void _checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');

    // Delay to show splash screen
    Timer(const Duration(seconds: 2), () {
      if (savedToken != null) {
        // Token exists, navigate to BottomNavScreen
        Get.offAll(() => BottomNavScreen());
      } else {
        // No token, navigate to OnboardingScreen
        Get.offAll(() => OnboadingScreen());
      }
    });
  }
}
