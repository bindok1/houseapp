import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SpaceCard extends StatelessWidget {
  

//tmbh models space
  final Space space;
  const SpaceCard(this.space, SizedBox sizedBox);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => DetailPage(space))));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(children: [
                Image.network(
                  space.imageUrl,
                  width: 130,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(30)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text('${space.rating}/5',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                space.name.toString(),
                style: blackTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text.rich(TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )),
                  Text.rich(TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w300)))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${space.city}, ${space.country}',
                style: greyTextStyle.copyWith(fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    );
  }
}
