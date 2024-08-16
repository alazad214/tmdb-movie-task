import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/settings/views/history.dart';
import 'package:tmdb_task/app/moduils/settings/views/terms_condition.dart';
import 'package:tmdb_task/app/moduils/settings/widgets/settings_button.dart';
import 'about_us.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
            child: Column(
              children: [
                SettingsButton(
                  title: "Terms and Condition",
                  icon: Icons.arrow_forward_ios,
                  ontap: () {
                    Get.to(() => const TermsCondition());
                  },
                ),
                SettingsButton(
                  title: "About Us",
                  icon: Icons.arrow_forward_ios,
                  ontap: () {
                    Get.to(() => const AboutUs());
                  },
                ),
                SettingsButton(
                  icon: Icons.arrow_forward_ios,
                  title: "History",
                  ontap: () {
                    Get.to(() => const History());
                  },
                ),
                SettingsButton(
                  icon: Icons.star_rate_outlined,
                  title: "Rate This App",
                  ontap: () {
                    Fluttertoast.showToast(msg: "Rating Done");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
