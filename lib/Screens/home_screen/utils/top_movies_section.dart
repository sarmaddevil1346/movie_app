import 'package:flutter/material.dart';

class TopMoviesSection {
  ListView topMoviesContainer() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
              height: 180, width: 170, "assets/images/top_movie.png"),
        );
      },
    );
  }
}
