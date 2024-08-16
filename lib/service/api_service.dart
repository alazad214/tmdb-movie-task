import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_task/model/musicModel.dart';
import 'package:tmdb_task/model/tv_model.dart';
import '../core/app_api.dart';
import '../model/populer_model.dart';

class ApiService extends GetxController {
  //Get Movie Genre
  Future<List<dynamic>> getMovieGenres() async {
    final response = await http.get(Uri.parse(moviegenreUlr));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['genres'];
    } else {
      throw Exception('Failed"');
    }
  }

  Future<PopulerModel> getPopulerMovies({List<int>? genreIds}) async {
    String genres = genreIds != null && genreIds.isNotEmpty
        ? '&with_genres=${genreIds.join(',')}'
        : '';
    final response = await http.get(Uri.parse("$getmovie$genres"));
    if (response.statusCode == 200) {
      return PopulerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  Future<Tvmodel> getTvSeries() async {
    final response = await http.get(Uri.parse(gettv));
    if (response.statusCode == 200) {
      return Tvmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild');
    }
  }

  Future<MusicModel> getMusic() async {
    final response = await http.get(Uri.parse(getmusic));
    if (response.statusCode == 200) {
      return MusicModel.fromJson(jsonDecode(response.body));
    } else {
      throw Fluttertoast.showToast(msg: "Some Problem");
    }
  }
}
