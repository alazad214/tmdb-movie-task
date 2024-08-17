import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tmdb_task/app/moduils/filter%20search/views/filter_results.dart';
import 'package:tmdb_task/app/moduils/filter%20search/views/more_caterories.dart';
import 'package:tmdb_task/widgtets/button1.dart';
import 'package:tmdb_task/widgtets/textfield1.dart';
import '../../ads controller/ads_controller.dart';
import '../controller/tag_controller.dart';

class FilterScreen extends StatelessWidget {
  final tagController = Get.put(TagController());
  final _textEditingController = TextEditingController();
  final adController = Get.put(AdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search By Tag",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: Text("Movies"),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: Text(
                    "Tv Series",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: Text("Music"),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                  child: Textfield1(
                    controller: _textEditingController,
                    hinttext2: "Enter tag",
                    onchanged: (value) {
                      tagController.textController.value = value;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      tagController.addChip(_textEditingController.text);
                      _textEditingController.clear();
                    },
                  ),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Get.to(() => MoreCaterories());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 25,
                    child:
                        Icon(Icons.account_tree_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Obx(() => Wrap(spacing: 8.0, children: [
                  for (int i = 0; i < tagController.chips.length; i++)
                    Chip(
                      label: Text(tagController.chips[i]),
                      onDeleted: () {
                        tagController.removeChip(tagController.chips[i]);
                      },
                    )
                ])),
            Spacer(),
            Button1(
              width: double.infinity,
              text: "Search",
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.purple,
              ontap: () {
                if (tagController.chips.isNotEmpty) {
                  adController.showInterstitialAd();
                  Timer(Duration(seconds: 2), () {
                    Get.to(() => FilterResults());
                  });
                } else {
                  Fluttertoast.showToast(msg: "Please Enter Tag");
                  adController.showInterstitialAd();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
