import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final text;
  final ontap;
  final width;
  final margin;
  final color;
  const Button1({super.key, this.text, this.ontap, this.width, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55.0,
        width: width ?? w / 2,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:color?? Colors.redAccent,
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
