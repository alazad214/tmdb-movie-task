import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../service/api_service.dart';

class MusicCard extends StatelessWidget {
  MusicCard({super.key});
  final apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiService.getMusic(),
        builder: (context, shapshot) {
          if (shapshot.hasData) {}
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
