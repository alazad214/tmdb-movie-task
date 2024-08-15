import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/utils/app_string.dart';
import 'app/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.name,
      debugShowCheckedModeBanner: false,
      initialRoute: splash,
      getPages: getPages,
    );
  }
}
