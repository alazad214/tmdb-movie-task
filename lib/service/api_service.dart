import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_task/model/musicModel.dart';
import 'package:tmdb_task/model/tv_model.dart';
import '../model/populer_model.dart';

class ApiService extends GetxController {
  Future<PopulerModel> getPopulerMovies() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=52382e42442992bd5f0045d50a66a584"));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return PopulerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed ');
    }
  }

  Future<Tvmodel> getTvSeries() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/tv?api_key=52382e42442992bd5f0045d50a66a584"));
    if (response.statusCode == 200) {
      return Tvmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild');
    }
  }

  Future<MusicModel> getMusic() async {
    final response = await http.get(Uri.parse(
        "https://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=1b065b7e91377ded9c905ee01c595a6e&format=json&page=1"));
    if (response.statusCode == 200) {
      return MusicModel.fromJson(jsonDecode(response.body));
    } else {
      throw Fluttertoast.showToast(msg: "Some Problem");
    }
  }
}
