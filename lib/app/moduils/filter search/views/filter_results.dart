import 'package:flutter/material.dart';

class FilterResults extends StatelessWidget {
  const FilterResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results page"),
        titleSpacing: 0,
      ),
      body: Center(
        child: Text("No Results"),
      ),
    );
  }
}
