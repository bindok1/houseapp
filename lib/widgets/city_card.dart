import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

import '../models/City.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(18),
      child: Container(
        width: 120,
        height: 150,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                //menambahkan populer

                city.isPopular != null
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30)),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icon_star.png',
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
