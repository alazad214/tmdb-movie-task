import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/populer/views/populer_details.dart';
import '../../../../model/populer_model.dart';
import '../../../../service/api_service.dart';
import '../../../../widgtets/simmer.dart';
import '../../../../widgtets/custom_card.dart';

class PopulerCard extends StatelessWidget {
  PopulerCard({Key? key}) : super(key: key);

  final apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopulerModel>(
      future: apiService.getPopulerMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PopulerResults> results = snapshot.data!.results ?? [];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  CustomCard(
                    title: results[i].originalTitle ?? 'No Title',
                    title2: results[i].overview ?? 'No Title',
                    rate: results[i].voteAverage ?? " ",
                    image: results[i].posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${results[i].posterPath}'
                        : '',
                    ontap: () {
                      Get.to(
                        () => PopulerDetails(movie: results[i]),
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
