import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safqty/constents/colors.dart';

class ChooseImage extends StatefulWidget {
  final Function getPickedImage;

  ChooseImage(this.getPickedImage);

  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  // TODO: Variables
  File _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 127,
        height: 127,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(127 / 2),
          color: Color(0XFFA494C1),
        ),
        child: Stack(
          children: <Widget>[
            _selectedImage == null
                ? Icon(
                    Icons.person,
                    size: 127,
                    color: Colors.white38,
                  )
                : Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(127 / 2),
                      child: GestureDetector(
                        child: Image.file(
                          _selectedImage,
                          fit: BoxFit.cover,
                          height: 127,
                          width: 127,
                        ),
                        onTap: () => chooseImageSource(context),
                      ),
                    ),
                  ),
            _selectedImage == null
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/images/imageadd.png',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          chooseImageSource(context);
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void chooseImageSource(BuildContext context) {
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
            _selectImage(ImageSource.gallery);
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            tr('camera'),
            style: TextStyle(
                fontSize: 18,
                color: Color(0XFF434A51),
                fontWeight: FontWeight.normal),
          ),
          isDefaultAction: true,
          onPressed: () {
            _selectImage(ImageSource.camera);
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

  Future<void> _selectImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source, maxWidth: 600);
    if (image == null) {
      return;
    }
    widget.getPickedImage(image);
    setState(() {
      _selectedImage = image;
    });
  }
}
