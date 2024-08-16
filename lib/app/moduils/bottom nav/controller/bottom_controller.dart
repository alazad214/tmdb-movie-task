import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../filter search/views/filter_screen.dart';
import '../../home/views/home_screen.dart';
import '../../search/views/search_screen.dart';
import '../../settings/views/settings_screen.dart';

class BottomController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FilterScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
