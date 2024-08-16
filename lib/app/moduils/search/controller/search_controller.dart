import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/app_api.dart';
import '../../../../model/SearchModel.dart';

class SearchItem extends GetxController {
  var movies = <SearchResults>[].obs;
  Future<void> searchMovies(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$SearchMovieUrl$apiKey&query=$query'));
      if (response.statusCode == 200) {
        final List results = json.decode(response.body)['results'];
        movies.value =
            results.map((movie) => SearchResults.fromJson(movie)).toList();
      } else {
        throw Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
    } catch (e) {}
  }
}
