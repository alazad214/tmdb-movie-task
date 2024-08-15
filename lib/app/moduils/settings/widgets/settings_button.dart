import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final title;
  final ontap;
  final icon;
  const SettingsButton({super.key, this.title, this.ontap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Colors.indigoAccent,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Icon(icon)],
        ),
      ),
    );
  }
}
