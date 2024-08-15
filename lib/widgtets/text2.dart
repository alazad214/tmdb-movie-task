import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  final String? text;
  final color;
  final size;
  final fontweight;
  final padding;
  final alignment;
  final ontap;
  final maxline;
  final textaign;
  const Text2(
      {super.key,
      this.text,
      this.color,
      this.size,
      this.fontweight,
      this.padding,
      this.alignment,
      this.ontap, this.maxline, this.textaign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0.0),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Text(
            text!,
            textAlign:textaign?? TextAlign.left,
            maxLines: maxline??1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: color ?? Colors.black,
                fontSize: size ?? 14.0,
                fontWeight: fontweight ?? FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
