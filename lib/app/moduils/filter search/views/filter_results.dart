import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/tag_controller.dart';

class FilterResults extends StatelessWidget {
  final TagController tagController = Get.find<TagController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: FutureBuilder<List<dynamic>>(
            future: tagController.fetchMoviesByTags(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                final movies = snapshot.data!;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.directions_boat,
                            color: Colors.deepPurpleAccent),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Sorry, as an AI language model, i do not have access to lists of movies with specific tags.Still I have tried to give some movie list as per your sacrifice: \n\n"),
                                    for (int i = 0; i < movies.length; i++)
                                      Row(
                                        children: [
                                          Text(
                                            '${i + 1}. ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Text(movies[i]['title'] ??
                                                'No title'),
                                          ),
                                        ],
                                      ),
                                  ],
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                          "Give me a list of movies wihch contains those tags \n${tagController.chips}"),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
