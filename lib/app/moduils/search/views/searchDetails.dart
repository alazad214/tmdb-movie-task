import 'package:flutter/material.dart';
import '../../../../model/SearchModel.dart';
import '../../../../model/populer_model.dart';

class Searchdetails extends StatelessWidget {
  final SearchResults movie;

  Searchdetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle ?? 'Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                movie.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    : 'https://via.placeholder.com/500',
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              SizedBox(height: 16.0),
              Text(
                movie.originalTitle ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Release Date- ${movie.releaseDate ?? 'Unknown Date'} ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Rating: ${movie.voteAverage}',
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              SizedBox(height: 8.0),
              Text(
                movie.overview ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
