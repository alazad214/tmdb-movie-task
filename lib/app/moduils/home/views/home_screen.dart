import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tmdb_task/app/moduils/Tv%20Series/views/tv_series_card.dart';
import 'package:tmdb_task/app/moduils/populer/views/populer_seeall.dart';
import 'package:tmdb_task/app/moduils/populer/widgets/populer_card.dart';
import 'package:tmdb_task/widgtets/text1.dart';

import '../../../../widgtets/text2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text1(
          text: " Filtrate",
          size: 22.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text1(
                    text: "Movies",
                  ),
                  Text1(
                    text: "See all",
                    size: 14.0,
                    color: Colors.blue,
                    ontap: () {
                      Get.to(() => PopulerSeeall());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              PopulerCard(),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text1(
                    text: "Movies",
                  ),
                  Text1(
                    text: "See all",
                    size: 14.0,
                    color: Colors.blue,
                    ontap: () {
                      Get.to(() => PopulerSeeall());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              TvSeriesCard()
            ],
          ),
        ),
      ),
    );
  }
}
