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
            SalomonBottomBarItem(

              icon: const Icon(
                Icons.home_outlined,
                color: Colors.black54,
              ),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.black54,
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
              icon: const Icon(Icons.directions_boat),
              title: const Text("Tag"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text("Settings"),
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
