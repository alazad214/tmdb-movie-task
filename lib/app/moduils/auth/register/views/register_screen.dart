import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../widgtets/button1.dart';
import '../../../../../widgtets/custom_appbar.dart';
import '../../../../../widgtets/text1.dart';
import '../../../../../widgtets/text2.dart';
import '../../../../../widgtets/textfield1.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController tokenController = TextEditingController();
  final controller = Get.put(AuthController());

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
                text: "Register",
                fontweight: FontWeight.bold,
                size: 20.0,
                padding: EdgeInsets.only(bottom: 10),
              ),
              const Text2(
                text: "Hello user you have a great journey!",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: const Text2(
                  maxline: 4,
                  text:
                      "Please enter your Token ID and move to the next screen.",
                ),
              ),
              const SizedBox(height: 20.0),
              Textfield1(
                hinttext: Text("Token id"),
                suffixicon: Icons.email_outlined,
                controller: tokenController,
              ),
              SizedBox(height: 30.0),
              Button1(
                text: 'REGISTER',
                ontap: () {
                  final tokenId = tokenController.text;
                  controller.Register(tokenId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
