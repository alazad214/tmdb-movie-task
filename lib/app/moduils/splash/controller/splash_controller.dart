import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_task/app/moduils/onboading/views/onboading_screen.dart';
import '../../bottom nav/views/bottom_nav_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  void checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');
    Timer(const Duration(seconds: 2), () {
      if (savedToken != null) {
        Get.offAll(() => BottomNavScreen());
      } else {
        Get.offAll(() => OnboadingScreen());
      }
    });
  }
}
