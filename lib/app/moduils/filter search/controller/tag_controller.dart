import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/app_api.dart';

class TagController extends GetxController {
  var chips = [].obs;
  var textController = ''.obs;

  void addChip(String chip) {
    if (chip.isNotEmpty && !chips.contains(chip)) {
      chips.add(chip);
    }
  }

  void removeChip(String chip) {
    chips.remove(chip);
  }

  Future<List<dynamic>> fetchMoviesByTags() async {
    final query = chips.join(",");
    final url = '$SearchMovieUrl$apiKey&query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'] as List<dynamic>;
    } else {
      throw Exception('Something Wrong');
    }
  }
}
