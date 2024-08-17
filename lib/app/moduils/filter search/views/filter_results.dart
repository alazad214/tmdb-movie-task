import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/filter%20search/controller/tag_controller.dart';

class FilterResults extends StatelessWidget {
  FilterResults({super.key});
  final controller = Get.put(TagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Response"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.directions_boat, color: Colors.deepPurpleAccent),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                      child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                        "Sorry, as an AI language model, i do not have access to lists of movies with specific tags. Can you please provide me with the specific tags you are lookin for?"),
                  )),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                    "Give me a list of movies wihch contains those tags \n${controller.chips}"),
              ),
            ],
          ),
        ));
  }
}
