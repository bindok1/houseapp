import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/splash_image.png')),
          (Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Find Cozy House\nto Stay and Happy',
                    style: blackTextStyle.copyWith(fontSize: 24)),
                const SizedBox(height: 10),
                Text(
                  'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                  style: greyTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(17)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                      },
                      child: Center(
                        child: Text(
                          'Explore Now',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
