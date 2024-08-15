import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tmdb_task/app/moduils/Tv%20Series/views/tv_details.dart';
import 'package:tmdb_task/app/moduils/populer/views/populer_details.dart';
import 'package:tmdb_task/model/tv_model.dart';
import 'package:tmdb_task/widgtets/custom_card2.dart';

import '../../../../model/populer_model.dart';
import '../../../../service/api_service.dart';

class TvSeeall extends StatelessWidget {
  TvSeeall({super.key});
  final ApiService apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tv Series"),
        ),
        body: FutureBuilder(
            future: apiService.getTvSeries(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TvResults> results = snapshot.data!.results ?? [];
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < results.length; i++)
                          InkWell(
                            onTap: () {
                              Get.to(() => TvDetails(tv: results[i]));
                            },
                            child: CustomCard2(
                              title: results[i].name,
                              title2: results[i].overview,
                              image: results[i].posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500${results[i].posterPath}'
                                  : '',

                            ),
                          )
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
