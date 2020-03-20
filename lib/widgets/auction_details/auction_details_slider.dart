import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';

class AuctionDetailsSlider extends StatefulWidget {
  final AuctionType auctionType;
  final Map<int, String> images;

  AuctionDetailsSlider(this.auctionType, this.images);

  @override
  _AuctionDetailsSliderState createState() => _AuctionDetailsSliderState();
}

class _AuctionDetailsSliderState extends State<AuctionDetailsSlider> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final statusBarSize = MediaQuery.of(context).padding.top;
    return Container(
      height: 374,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: statusBarSize,
            left: 0,
            right: 0,
            bottom: 0,
            child: CarouselSlider(
              height: 374 - statusBarSize,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: widget.images.entries.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.network(
                          image.value,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 75,
            right: 0,
            height: 30,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.entries.map((image) {
                  return Container(
                    width: _currentIndex == image.key ? 30 : 10,
                    height: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      shape: _currentIndex == image.key
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      borderRadius: _currentIndex == image.key
                          ? BorderRadius.circular(5)
                          : null,
                      color: _currentIndex == image.key
                          ? SOrange
                          : SOrange.withOpacity(0.6),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Spacer(),
                InkWell(
                  child: Image.asset(
                    'assets/images/share.png',
                    width: 26,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/heart_white.png',
                    width: 30,
                    height: 30,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          widget.auctionType == AuctionType.TimeAuctions
              ? Positioned(
                  bottom: 75,
                  right: 20,
                  child: Row(
                    children: <Widget>[
                      _buildAuctionTime(tr('day'), '10'),
                      SizedBox(
                        width: 8.0,
                      ),
                      _buildAuctionTime(tr('hour'), '15'),
                      SizedBox(
                        width: 8.0,
                      ),
                      _buildAuctionTime(tr('minute'), '35'),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                )
              : Container(),
          widget.auctionType == AuctionType.TimeAuctions
              ? Positioned(
                  bottom: 75,
                  left: 20,
                  child: Container(
                    height: 40,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: SOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/auctionopenwhite.png',
                          width: 22,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          tr('ongoing_auction'),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildAuctionTime(String timeType, String time) {
    return Column(
      children: <Widget>[
        Text(
          timeType,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            border: Border.all(color: SOrange, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Color(0XFFFA64272E).withOpacity(0.5),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
