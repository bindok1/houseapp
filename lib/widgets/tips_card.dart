import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard(this.tips, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 80,
            height: 80,
            child: Stack(children: [
              Image.asset(tips.imageUrl),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              tips.updatedAt,
              style: greyTextStyle.copyWith(fontWeight: FontWeight.w300),
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 24,
              color: greyColor,
            ))
      ],
    );
  }
}
