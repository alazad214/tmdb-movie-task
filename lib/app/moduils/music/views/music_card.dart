import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/music/views/music_details.dart';
import 'package:tmdb_task/model/musicModel.dart';
import 'package:tmdb_task/widgets/simmer.dart';
import 'package:tmdb_task/widgtets/custom_card.dart';
import '../../../../service/api_service.dart';

class MusicCard extends StatelessWidget {
  MusicCard({super.key});
  final ApiService apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MusicModel>(
      future: apiService.getMusic(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Track> tracks = snapshot.data!.tracks?.track ?? [];
          return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        CustomCard(
                          image: tracks[i].image![0].text ?? '',
                          title: tracks[i].name ?? '...',
                          title2: tracks[i].artist?.name ?? '...',
                          ontap: () {
                            Get.to(() => MusicDetails(music: tracks[i]));
                          },
                        )
                    ],
                  )));
        }
        return Shimmer();
      },
    );
  }
}
