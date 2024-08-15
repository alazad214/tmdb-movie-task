import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../widgtets/button1.dart';
import '../../../../../widgtets/custom_appbar.dart';
import '../../../../../widgtets/text1.dart';
import '../../../../../widgtets/text2.dart';
import '../../../../../widgtets/textfield1.dart';
import '../../../bottom nav/views/bottom_nav_screen.dart';
import '../../forget/forget_screen.dart';
import '../../register/views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteC,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const Text1(
              text: "Login",
              fontweight: FontWeight.bold,
              size: 20.0,
              padding: EdgeInsets.only(bottom: 10),
            ),
            const Text2(
              text: "Glad to meet you again!",
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Textfield1(
              hinttext: Text("Email"),
              suffixicon: Icons.email_outlined,
            ),
            const SizedBox(height: 15.0),
            const Textfield1(
              hinttext: Text("Password"),
              suffixicon: Icons.remove_red_eye,
            ),
            const SizedBox(height: 15.0),
            Text2(
              text: "Forget password?",
              color: Colors.blueAccent,
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              ontap: () {
                Get.to(() => const ForgetScreen());
              },
            ),
            const SizedBox(height: 30.0),
            Button1(
              text: 'LOG IN',
              ontap: () {
                Get.offAll(() => BottomNavScreen());
              },
            ),
            const SizedBox(height: 30.0),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text2(
                  text: "Don't have an accoutn?  ",
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: const Text2(
                    text: "Register",
                    fontweight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
