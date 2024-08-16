import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/music/views/music_details.dart';
import 'package:tmdb_task/model/musicModel.dart';
import 'package:tmdb_task/widgtets/custom_card2.dart';
import '../../../../service/api_service.dart';
import '../../../../widgtets/simmer2.dart';
import '../../../../widgtets/text1.dart';

class MusicSeeall extends StatelessWidget {
  MusicSeeall({super.key});
  final ApiService apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music"),
        ),
        body: FutureBuilder(
            future: apiService.getMusic(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Track> tracks = snapshot.data!.tracks?.track ?? [];
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text1(text: "Filter"),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.filter_list))
                            ],
                          ),
                        ),
                        for (int i = 0; i < tracks.length; i++)
                          InkWell(
                            onTap: () {
                              Get.to(() => MusicDetails(music: tracks[i]));
                            },
                            child: CustomCard2(
                              title: tracks[i].name,
                              title2: tracks[i].artist?.name,
                              image: tracks[i].image![0].text ?? '',
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }
              return Shimmer2();
            }));
  }
}
