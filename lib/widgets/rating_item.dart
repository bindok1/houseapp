import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    //melakukan pengkondisian
    return Image.asset(
      index <= rating ? 'assets/icon_star.png' : 'assets/Icon_star_grey.png',
      width: 20,
    );
  }
}
