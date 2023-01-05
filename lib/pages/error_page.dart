import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/theme.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/404.png',
                  width: 300,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Where are you going?',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Seems like the page that you were\nrequested is already gone',
                  style: greyTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 210,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: purpleColor),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                            (route) => false);
                      },
                      child: Text(
                        'Back Home',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
