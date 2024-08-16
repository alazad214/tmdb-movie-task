import 'package:flutter/material.dart';

class Textfield1 extends StatelessWidget {
  const Textfield1(
      {super.key,
      this.hinttext,
      this.suffixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.controller, this.hinttext2});

  final hinttext;
  final IconData? suffixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final controller;
  final hinttext2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, left: 20),
      child: TextFormField(
        onChanged: onchanged,
        validator: validation,
        controller: controller,
        obscureText: obscuretext ?? false,
        decoration: InputDecoration(
          label: hinttext,
          hintText: hinttext2,
          suffixIcon: Icon(suffixicon),
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.blueGrey),
          //enable-->
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
          ),
          //focus-->
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          //focus-->
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
