import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/profile/auction_state.dart';

class AuctionItem extends StatelessWidget {
  final int index;
  final bool withTime;
  final bool isAds;
  final bool withFavorite;
  final bool hasMenu;
  final AuctionType auctionType;

  AuctionItem({
    this.index,
    this.withTime,
    this.isAds = false,
    this.withFavorite,
    this.hasMenu = false,
    this.auctionType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          height: double.infinity,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/auction_item.png',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      left: 3,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          withFavorite
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Container(),
                          withTime
                              ? Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'باقي 5 أيام',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: SOrange,
                                      ),
                                    ),
                                  ),
                                )
                              : hasMenu
                                  ? InkWell(
                                      child: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                      onTap: () => showCupertinoModalPopup(
                                        context: context,
                                        builder: (ctx) => AuctionState(),
                                      ),
                                    )
                                  : Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: isAds ? 0 : 12,
                  top: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'الدمام',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF434A51),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'مكتب ايكا جديد',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF434A51),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    isAds
                        ? Container(
                            height: 0,
                          )
                        : Row(
                            children: <Widget>[
                              Text(
                                '19',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF434A51),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'ريال /السوم',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFFAAB5BC),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(
        AuctionDetailsScreen.routeName,
        arguments: auctionType,
      ),
    );
  }
}
