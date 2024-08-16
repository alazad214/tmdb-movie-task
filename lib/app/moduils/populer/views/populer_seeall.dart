import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/model/populer_model.dart';
import 'package:tmdb_task/service/api_service.dart';
import 'package:tmdb_task/widgtets/simmer2.dart';
import 'package:tmdb_task/widgtets/text1.dart';
import 'package:tmdb_task/widgtets/text2.dart';
import '../../../../widgtets/custom_card2.dart';
import 'genrePage.dart';
import 'populer_details.dart';

class PopulerSeeall extends StatelessWidget {
  final ApiService apiService = Get.put(ApiService());
  final List<int> _selectedGenres = [];

  void _navigateToGenreSelection(BuildContext context) {
    Get.to(() => GenreSelectionPage(onSubmit: (selectedGenres) {
          _selectedGenres.clear();
          _selectedGenres.addAll(selectedGenres);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      titleSpacing: 0,
      ),
      body: FutureBuilder<PopulerModel>(
        future: apiService.getPopulerMovies(genreIds: _selectedGenres),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data!.results ?? [];
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
                            IconButton(onPressed: (){
                              _navigateToGenreSelection(context);
                            }, icon: Icon(Icons.filter_list))

                          ],
                        ),
                      ),
                      Column(
                        children: movies.map((movie) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => PopulerDetails(movie: movie));
                            },
                            child: CustomCard2(
                              title: movie.originalTitle,
                              title2: movie.overview,
                              image: movie.posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                                  : '',
                              ontap: () {},
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
            );
          } else {
            return Shimmer2();
          }
        },
      ),
    );
  }
}
