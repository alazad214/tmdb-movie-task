import 'package:flutter/material.dart';
import '../../../../model/tv_model.dart';

class TvDetails extends StatelessWidget {
  final TvResults tv;
  TvDetails({required this.tv});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tv.originalName ?? 'Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              SizedBox(height: 16.0),
              Text(
                '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'First Year Date- ${tv.firstAirDate ?? 'Unknown Date'} ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Rating: ${tv.voteAverage}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Country for: ${tv.originCountry}',
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              SizedBox(height: 8.0),
              Text(
                tv.overview ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
