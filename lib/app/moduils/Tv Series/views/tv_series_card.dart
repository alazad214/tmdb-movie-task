import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/Tv%20Series/views/tv_details.dart';
import 'package:tmdb_task/model/tv_model.dart';
import '../../../../service/api_service.dart';
import '../../../../widgets/simmer.dart';
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
          List<TvResults> results = snapshot.data!.results ?? [];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  CustomCard(
                    title: results[i].originalName ?? 'No Title',
                    title2: results[i].overview ?? 'No Title2',
                    rate: results[i].voteAverage ?? " ",
                    image: results[i].posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${results[i].posterPath}'
                        : '',
                    ontap: () {
                      Get.to(
                        () => TvDetails(tv: results[i]),
                      );
                    },
                  ),
              ],
            ),
          );
        }
        return Shimmer();
      },
    );
  }
}
