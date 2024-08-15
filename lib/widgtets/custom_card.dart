import 'package:flutter/material.dart';
import 'package:tmdb_task/widgtets/text2.dart';

class CustomCard extends StatelessWidget {
  final image;
  final ontap;
  final title;
  final rate;
  final title2;
  CustomCard(
      {super.key, this.image, this.ontap, this.title, this.rate, this.title2});
  var _image =
      "https://m.media-amazon.com/images/M/MV5BNjQwZDIyNjAtZGQxMC00OTUwLWFiOWYtNzg2NDc5Mjc1MDQ5XkEyXkFqcGdeQXVyMTAxNzQ1NzI@._V1_.jpg";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 210.0,
        width: 145.0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            image ?? _image,
            fit: BoxFit.cover,
            height: 140.0,
            width: double.infinity,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text2(
            text: title ?? "The Infinity war",
            size: 15.0,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Flexible(
                  child: Text2(
                    text: title2 ?? "The Infinity warhe Infinity war",
                    size: 12.0,
                    color: Colors.purple,
                  ),
                ),
                Icon(
                  Icons.star_rate,
                  size: 12.0,
                  color: Colors.amber,
                ),
                Text(
                  rate != null ? rate!.toStringAsFixed(1) : "7.5",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
