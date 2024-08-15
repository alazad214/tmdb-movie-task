import 'package:flutter/material.dart';
import 'package:tmdb_task/app/moduils/settings/ulits/terms_data.dart';

import '../../../../widgtets/text1.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Terms And Condition"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                      "By downloading and using the this mobile application you agree to be bound by the following terms and conditions",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  for (int i = 0; i < termsdata.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            termsdata[i]["title"],
                            style: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            termsdata[i]["description"],
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              )),
        ));
  }
}
