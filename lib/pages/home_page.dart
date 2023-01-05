import 'package:cozy_app/models/City.dart';
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/providers/space_providers.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/bottom_nav.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// extension ResponseCast<T> on SpaceProvider {
//   SpaceProvider cast<U>() {
//     return getRecomendedSpaces()<U>()..data = getRecomendedSpaces() as U;
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    spaceProvider.getRecomendedSpaces;
    // spaceProvider = spaceProvider.cast<List<Space>>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(children: [
          //NOTE: HEADER/TITLE
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Explore Now',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Mencari kosan yang cozy?',
              style: greyTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // NOTE:POPULAR CITIES
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Popular Cities',
              style: regulerTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 24,
                ),
                CityCard(
                    City(id: 1, imageUrl: 'assets/city1.png', name: 'Jakarta')),
                SizedBox(
                  width: 20,
                ),
                CityCard(City(
                    id: 2,
                    imageUrl: 'assets/city2.png',
                    name: 'Bandung',
                    isPopular: true)),
                SizedBox(
                  width: 20,
                ),
                CityCard(City(
                    id: 3, imageUrl: 'assets/city3.png', name: 'Surabaya')),
                SizedBox(
                  width: 20,
                ),
                CityCard(City(
                    id: 4, imageUrl: 'assets/city4.png', name: 'Palembang')),
                SizedBox(
                  width: 20,
                ),
                CityCard(City(
                    id: 5,
                    imageUrl: 'assets/city5.png',
                    name: 'Aceh',
                    isPopular: true)),
                SizedBox(
                  width: 20,
                ),
                CityCard(
                    City(id: 6, imageUrl: 'assets/city6.png', name: 'Bogor')),
                SizedBox(width: 24),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
//NOTE : RECOMENDED SPACE
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Recomended Space',
              style: regulerTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge),
            child: FutureBuilder<List<Space>>(
                future: spaceProvider.getRecomendedSpaces(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(
                            item,
                            SizedBox(),
                          ));
                    }).toList());
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          SizedBox(
            height: 30,
          ),
          //NOTE TIPS & GUIDE
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Tips & Guidance',
              style: regulerTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Column(
              children: [
                TipsCard(Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/tips1.png',
                    updatedAt: '20 Apr')),
                SizedBox(
                  height: 24,
                ),
                TipsCard(Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/tips2.png',
                    updatedAt: '11 Dec'))
              ],
            ),
          ),
          SizedBox(
            height: 50 + edge,
          ),
        ]),
      ),

//Membuat widget terlihat meskipun di scroll
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: bottomColor, borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              imageUrl: 'assets/Icon_home.png',
              isActive: true,
            ),
            BottomNavItem(imageUrl: 'assets/Icon_mail.png', isActive: false),
            BottomNavItem(imageUrl: 'assets/Icon_card.png', isActive: false),
            BottomNavItem(imageUrl: 'assets/Icon_love.png', isActive: false)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
