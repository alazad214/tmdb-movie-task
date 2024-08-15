import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tmdb_task/app/moduils/populer/views/populer_details.dart';
import 'package:tmdb_task/widgtets/custom_card2.dart';

import '../../../../model/populer_model.dart';
import '../../../../service/api_service.dart';

class PopulerSeeall extends StatelessWidget {
  PopulerSeeall({super.key});
  final ApiService apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: FutureBuilder(
            future: apiService.getPopulerMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Results> results = snapshot.data!.results ?? [];
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < results.length; i++)
                          InkWell(
                            onTap: () {
                              Get.to(() => PopulerDetails(movie: results[i]));
                            },
                            child: CustomCard2(
                              title: results[i].originalTitle,
                              title2: results[i].overview,
                              image: results[i].posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500${results[i].posterPath}'
                                  : '',
                              ontap: () {},
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
