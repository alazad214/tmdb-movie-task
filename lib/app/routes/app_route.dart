import 'package:get/get_navigation/src/routes/get_route.dart';

import '../moduils/auth/login/views/login_screen.dart';
import '../moduils/home/views/home_screen.dart';
import '../moduils/onboading/views/onboading_screen.dart';
import '../moduils/splash/bindigns/splash_bindings.dart';
import '../moduils/splash/views/splash_screen.dart';

//INITIAL UNIQUE ROUTE NAME
const String splash = '/splash_screen';
const String home = '/HomeScreen';
const String onboading = '/onboading_screen';
const String login = '/login_screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: onboading,
    page: () => const OnboadingScreen(),
  ),
  GetPage(
    name: login,
    page: () => const LoginScreen(),
  ),
];
