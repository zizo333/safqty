import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class AuctionState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        tr('choose'),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: SOrange,
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(
            tr('activate'),
            style: TextStyle(
              fontSize: 18,
              color: Color(0XFF434A51),
              fontWeight: FontWeight.normal,
            ),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            tr('disable'),
            style: TextStyle(
                fontSize: 18,
                color: Color(0XFF434A51),
                fontWeight: FontWeight.normal),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      cancelButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: SOrange,
        ),
        child: CupertinoActionSheetAction(
          child: Text(
            tr('cancel'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
