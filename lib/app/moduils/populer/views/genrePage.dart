import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/service/api_service.dart';

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}

class GenreSelectionPage extends StatefulWidget {
  final Function(List<int>) onSubmit;

  GenreSelectionPage({required this.onSubmit});

  @override
  _GenreSelectionPageState createState() => _GenreSelectionPageState();
}

class _GenreSelectionPageState extends State<GenreSelectionPage> {
  final ApiService apiService =
      Get.put(ApiService()); // GetX এর মাধ্যমে ApiService এর ইনস্ট্যান্স পাই
  List<Genre> _genres = [];
  List<int> _selectedGenres = [];

  @override
  void initState() {
    super.initState();
    _fetchGenres();
  }

  Future<void> _fetchGenres() async {
    try {
      final response = await apiService.getMovieGenres();
      setState(() {
        _genres = response
            .map((genre) => Genre(id: genre['id'], name: genre['name']))
            .toList();
      });
    } catch (e) {
      print('Error fetching genres: $e');
    }
  }

  void _onGenreSelected(bool selected, int genreId) {
    setState(() {
      if (selected) {
        _selectedGenres.add(genreId);
      } else {
        _selectedGenres.remove(genreId);
      }
    });
  }

  void _onSubmit() {
    widget.onSubmit(_selectedGenres);
    Navigator.pop(context); // ফিরে যান PopulerSeeall এ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Genres"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _onSubmit,
          ),
        ],
      ),
      body: _genres.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _genres.length,
              itemBuilder: (context, index) {
                final genre = _genres[index];
                return CheckboxListTile(
                  title: Text(genre.name),
                  value: _selectedGenres.contains(genre.id),
                  onChanged: (selected) {
                    _onGenreSelected(selected!, genre.id);
                  },
                );
              },
            ),
    );
  }
}
