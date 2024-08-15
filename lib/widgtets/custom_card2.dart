import 'package:flutter/material.dart';
import 'package:tmdb_task/widgtets/text2.dart';

class CustomCard2 extends StatelessWidget {
  final image;
  final ontap;
  final title;
  final rate;
  final title2;
  const CustomCard2(
      {super.key, this.image, this.ontap, this.title, this.rate, this.title2});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Property image
          Image.network(
            image ?? "assets/images/poster1.jpg",
            width: w / 3.9,
            fit: BoxFit.cover,
          ),

          //Property Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text2(
                    text: title ?? "The Infinity war",
                    size: 18.0,
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
                        Text2(
                          text: rate ?? "7.5",
                          size: 14.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
