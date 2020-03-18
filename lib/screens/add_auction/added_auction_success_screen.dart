import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/screens/home_screen.dart';

class AddedAuctionSuccessScreen extends StatelessWidget {
  static final routeName = '/added-auction-success-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 161,
                  height: 161,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(161 / 2),
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(161 / 2 - 2),
                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  tr('congratulation_order'),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  tr('see_your_auction'),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  child: Container(
                    width: 128,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0XFFC7C7C7),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tr('watch_auction'),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF2F1459),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
