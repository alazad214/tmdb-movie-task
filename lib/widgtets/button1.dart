import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final text;
  final ontap;
  const Button1({super.key, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55.0,
        width: w / 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.redAccent,

          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
