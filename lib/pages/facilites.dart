import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class Facilites extends StatelessWidget {
  final String imageUrl;
  final int total;
  final String name;

  const Facilites(
      {super.key,
      required this.imageUrl,
      required this.total,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text.rich(TextSpan(text: '$total', style: purpleTextStyle)),
            SizedBox(
              width: 2,
            ),
            Text.rich(TextSpan(
                text: '$name',
                style: greyTextStyle.copyWith(fontWeight: FontWeight.w300)))
          ],
        ),
      ],
    );
  }
}
