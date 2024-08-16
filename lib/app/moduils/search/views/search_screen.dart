import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/search/views/searchDetails.dart';
import 'package:tmdb_task/widgtets/textfield1.dart';
import '../../../../widgtets/custom_card2.dart';
import '../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();
  final controller = Get.put(SearchItem());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Column(
        children: [
          Textfield1(
            hinttext2: "Search here..",
            suffixicon: Icons.search,
            onchanged: (value) {
              controller.searchMovies(value);
            },
          ),
          SizedBox(height: 20),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  final movie = controller.movies[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => Searchdetails(movie: movie));
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
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
