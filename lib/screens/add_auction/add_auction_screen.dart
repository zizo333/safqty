import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/add_auction/add_auction_details.dart';
import 'package:safqty/widgets/add_auction/auction_photos.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class AddAuctionScreen extends StatelessWidget {
  static final routeName = '/add-auction-screen';
  @override
  Widget build(BuildContext context) {
    final auctionType = ModalRoute.of(context).settings.arguments as AuctionType;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 9),
                  blurRadius: 8,
                  spreadRadius: -9)
            ]),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tr('add_an_open_auction'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LoginRegisterStyle.titleStyle(tr('auction_photos')),
                    SizedBox(height: 10,),
                    AuctionPhotos(),
                    SizedBox(height: 25),
                    AddAuctionDetails(auctionType),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
