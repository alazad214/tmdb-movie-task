import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../controller/bottom_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              selectedColor: Colors.teal.withOpacity(0.2),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.manage_search),
              title: const Text("Filter"),
              selectedColor: Colors.purple,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_open),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        );
      }),
      body: Obx(() {
        return controller.pages[controller.currentIndex.value];
      }),
    );
  }
}
