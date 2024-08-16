import 'package:flutter/material.dart';
import 'package:tmdb_task/model/musicModel.dart';
import 'package:tmdb_task/widgtets/custom_image.dart';

class MusicDetails extends StatelessWidget {
  final Track music;
  MusicDetails({required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(music.name ?? '...'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                image: music.image![0].text ?? '',
              ),
              SizedBox(height: 20.0),
              Text(
                "Artist: ${music.artist?.name ?? '...'}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5.0),
              Text(
                music.artist?.name ?? '...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
