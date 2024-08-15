import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tmdb_task/model/tv_model.dart';

import '../../../../service/api_service.dart';
import '../../../../widgtets/custom_card.dart';

class TvSeriesCard extends StatelessWidget {
  TvSeriesCard({Key? key}) : super(key: key);

  final apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tvmodel>(
      future: apiService.getTvSeries(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Results> results = snapshot.data!.results ?? [];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < results.length; i++)
                  CustomCard(
                    title: results[i].originalName ?? 'No Title',
                    title2: results[i].overview ?? 'No Title2',
                    rate: results[i].voteAverage ?? " ",
                    image: results[i].posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${results[i].posterPath}'
                        : '',
                  ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
