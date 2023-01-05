
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/pages/facilites.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final Uri url = Uri.parse('d');

final Uri wa = Uri.parse('https://wa.me/62895378147657');
final Uri ursl = Uri.parse('https://goo.gl/maps/HiKcRmtjE2if58aw7');

class DetailPage extends StatefulWidget {
  final Space space;
  const DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = true;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    launchUrl(ursl) async {
      if (await canLaunchUrl(ursl)) {
        launchUrl(ursl);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ErrorPage()),
        );
      }
    }

    Future<void> showConfirmation() async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Apakah Kamu ingin Menelpon Pemilik Kos?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      launchUrl(
                          Uri.parse('tel:${widget.space.phone.toString()}'));
                    },
                    child: const Text('Hubungi'))
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              //Membuat gambar selebar device
              Image.network(
                widget.space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),

              ListView(children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  height: 604,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      color: whiteColor),

                  //NOTE : TITLE

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      widget.space.name.toString(),
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text.rich(TextSpan(
                                          text: '\$${widget.space.price}',
                                          style: purpleTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                        Text.rich(TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300)))
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 2),
                                      child: RatingItem(
                                          index: index,
                                          rating: widget.space.rating),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

//Main Facilites

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Main Facilites',
                                  style: blackTextStyle.copyWith(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Facilites(
                                      imageUrl: 'assets/icon_kitchen.png',
                                      total: widget.space.numberOfKitchens,
                                      name: 'kitchen',
                                    ),
                                    Facilites(
                                      imageUrl: 'assets/icon_bedroom.png',
                                      total: widget.space.numberOfBedrooms,
                                      name: 'bedroom',
                                    ),
                                    Facilites(
                                      imageUrl: 'assets/icon_cupboard.png',
                                      total: widget.space.numberOfCupboards,
                                      name: 'Big Lemari',
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //NOTE : PHOTOS

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Photos',
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ClipRRect(
                          child: Container(
                              height: 88,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children:
                                      //mengambil data dari api

                                      widget.space.photos.map((item) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                        left: 24,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          item,
                                          width: 110,
                                          height: 88,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList())),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Location',
                                      style:
                                          blackTextStyle.copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '${widget.space.address}\n${widget.space.city}',
                                      style: greyTextStyle.copyWith(),
                                    ),
                                  ]),
                              InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      widget.space.mapUrl.toString()));
                                },
                                child: Image.asset(
                                  'assets/btn_map.png',
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(17)),
                          child: GestureDetector(
                              onTap: () {
                                showConfirmation();
                              },
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: whiteTextStyle.copyWith(fontSize: 18),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    Container(
                      child: IconButton(
                        iconSize: 40,
                        alignment: Alignment.centerRight,
                        icon: (_isFavorited
                            ? Image.asset('assets/btn_wishlist1.png', width: 40)
                            : Image.asset(
                                'assets/btn_wishlist.png',
                                width: 40,
                              )),
                        onPressed: _toogleFav,
                      ),

                      // Image.asset(
                      //   'assets/btn_wishlist.png',
                      //   width: 40,
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void _toogleFav() {
    setState(() {
      if (_isFavorited) {
        _count -= 1;
        _isFavorited = false;
      } else {
        _count += 1;
        _isFavorited = true;
      }
    });
  }
}
