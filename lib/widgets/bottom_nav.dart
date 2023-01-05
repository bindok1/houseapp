import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const BottomNavItem({super.key, required this.imageUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
          height: 26,
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(1000)),
                  color: purpleColor,
                ),
              )
            : Container(),
      ],
    );
  }
}
