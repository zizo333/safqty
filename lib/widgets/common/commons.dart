import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class Commons {
  static Widget safqtyHeader() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 113.5,
            height: 113.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(113.5 / 2),
              color: SOrange,
              image: DecorationImage(
                  image: AssetImage('assets/images/header_image.png'),
                  fit: BoxFit.fill),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(113.5 / 2),
              child: Image.asset(
                'assets/images/header_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          tr('safqty'),
          style: TextStyle(
              fontSize: 38, color: SOrange, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 21.23,
        ),
      ],
    );
  }

  static void showAlert({BuildContext context, String title, String content}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text(
              tr('ok'),
              style: TextStyle(fontSize: 16),
            ),
            textColor: SOrange,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  static Future<bool> closeTheApp(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('هل أنت متأكد؟'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('هل تريد اغلاق التطبيق؟'),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      textColor: SOrange,
                      child: Text('نعم'),
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 1,
                    color: Colors.black12,
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: SOrange,
                      child: Text('لا'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
