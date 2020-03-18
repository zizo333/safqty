import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safqty/constents/colors.dart';

class AddAuctionHelperFunctions {
  static void showAlert(
      {BuildContext context, int index, Function removeImage}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actionsPadding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Icon(
          Icons.error_outline,
          color: SOrange,
          size: 50,
        ),
        content: Text(
          tr('are_you_sure'),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: Text(
                tr('delete'),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                removeImage(index);
                Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green,
              child: Text(
                tr('cancel'),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }

  static void chooseImageSource({BuildContext context, Function selectImage}) {
    final action = CupertinoActionSheet(
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
            tr('gallery'),
            style: TextStyle(
              fontSize: 18,
              color: Color(0XFF434A51),
              fontWeight: FontWeight.normal,
            ),
          ),
          isDefaultAction: true,
          onPressed: () {
            selectImage(ImageSource.gallery);
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            tr('camera'),
            style: TextStyle(
              fontSize: 18,
              color: Color(0XFF434A51),
              fontWeight: FontWeight.normal,
            ),
          ),
          isDefaultAction: true,
          onPressed: () {
            selectImage(ImageSource.camera);
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
    showCupertinoModalPopup(
      context: context,
      builder: (context) => action,
    );
  }
}
