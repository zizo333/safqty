import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safqty/widgets/add_auction/add_auction_helper_functions.dart';

class AuctionPhotos extends StatefulWidget {
  @override
  _AuctionPhotosState createState() => _AuctionPhotosState();
}

class _AuctionPhotosState extends State<AuctionPhotos> {
  // TODO: Variables
  List<File> _photosList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: double.infinity,
                width: 128,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0XFFF1F3F5), width: 1),
                ),
                child: Image.asset(
                  'assets/images/imageaddfill.png',
                  width: 41,
                  height: 41,
                ),
              ),
              onTap: () => AddAuctionHelperFunctions.chooseImageSource(
                context: context,
                selectImage: _selectImage,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _photosList.length,
                itemBuilder: (ctx, i) => _buildPhotoBox(i),
                separatorBuilder: (ctx, index) => SizedBox(
                  width: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildPhotoBox(int index) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 128,
            width: 128,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                _photosList[index],
                fit: BoxFit.cover,
                width: 128,
                height: 128,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: InkWell(
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onTap: () => AddAuctionHelperFunctions.showAlert(
                context: context,
                index: index,
                removeImage: _removeImageFromList,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// select image
  Future<void> _selectImage(ImageSource source) async {
    final pickedImage = await ImagePicker.pickImage(
      source: source,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _photosList.add(pickedImage);
    });
  }

  /// remove image
  void _removeImageFromList(int index) {
    setState(() {
      _photosList.removeAt(index);
    });
  }
}
