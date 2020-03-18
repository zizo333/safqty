import 'dart:ui';
import 'package:flutter/material.dart';

class AuctionFooter extends StatelessWidget {
  final String imageSource;
  final String title;
  final String actionImage;
  final Function action;

  AuctionFooter({this.imageSource, this.title, this.actionImage, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      color: Color(0XFFFCFCFC),
      child: Row(
        children: <Widget>[
          Image.asset(
            imageSource,
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0XFF434A51),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Spacer(),
          InkWell(
            child: Image.asset(
              actionImage,
              width: 25,
              height: 25,
            ),
            onTap: action,
          ),
        ],
      ),
    );
  }
}
