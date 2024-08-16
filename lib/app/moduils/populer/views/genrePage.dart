import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/service/api_service.dart';

class Genre {
  final int id;
  final String name;
  Genre({required this.id, required this.name});
}
class GenreSelectionPage extends StatelessWidget {
  final Function(List<int>) onSubmit;
  GenreSelectionPage({required this.onSubmit});
  final ApiService apiService = Get.put(ApiService());
  final List<int> _selectedGenres = [];
  void _onGenreSelected(bool selected, int genreId) {
    if (selected) {
      _selectedGenres.add(genreId);
    } else {
      _selectedGenres.remove(genreId);
    }
  }
  void _onSubmit(BuildContext context) {
    onSubmit(_selectedGenres);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Genres"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _onSubmit(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Genre>>(
        future: _fetchGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final genres = snapshot.data!;
            return ListView.builder(
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                return CheckboxListTile(
                  title: Text(genre.name),
                  value: _selectedGenres.contains(genre.id),
                  onChanged: (selected) {
                    _onGenreSelected(selected!, genre.id);
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No genres available'));
          }
        },
      ),
    );
  }

  Future<List<Genre>> _fetchGenres() async {
    try {
      final response = await apiService.getMovieGenres();
      return response
          .map((genre) => Genre(id: genre['id'], name: genre['name']))
          .toList();
    } catch (e) {
      throw Exception('Failed to load genres');
    }
  }
}
