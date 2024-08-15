import 'package:flutter/material.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../widgtets/button1.dart';
import '../../../../../widgtets/custom_appbar.dart';
import '../../../../../widgtets/text1.dart';
import '../../../../../widgtets/text2.dart';
import '../../../../../widgtets/textfield1.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              text: "Hello user you have a gratefull journey!",
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Textfield1(
              hinttext: Text("Name"),
              suffixicon: Icons.person,
            ),
            const SizedBox(height: 10.0),
            const Textfield1(
              hinttext: Text("Email"),
              suffixicon: Icons.email_outlined,
            ),
            const SizedBox(height: 10.0),
            const Textfield1(
              hinttext: Text("Mobile"),
              suffixicon: Icons.phone,
            ),
            const SizedBox(height: 10.0),
            const Textfield1(
              hinttext: Text("Password"),
              suffixicon: Icons.remove_red_eye,
              obscuretext: true,
            ),
            const SizedBox(height: 10.0),
            const Textfield1(
              hinttext: Text("Confirm Password"),
              suffixicon: Icons.remove_red_eye,
              obscuretext: true,
            ),
            const SizedBox(height: 30.0),
            Button1(
              text: 'REGISTER',
              ontap: () {},
            ),
            const SizedBox(height: 60.0),
            const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text2(
                  text: "Already have an account?  ",
                ),
                Text2(
                  text: "Register",
                  fontweight: FontWeight.bold,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
