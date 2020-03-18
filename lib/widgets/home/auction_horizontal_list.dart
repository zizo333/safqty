import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';

class AuctionHorizontalList extends StatefulWidget {
  final bool isCollapsed;
  final bool withTime;
  final bool isAds;
  final AuctionType auctionType;

  AuctionHorizontalList({
    this.isCollapsed,
    this.withTime,
    this.isAds = false,
    this.auctionType = AuctionType.OpenAuction,
  });

  @override
  _AuctionHorizontalListState createState() => _AuctionHorizontalListState();
}

class _AuctionHorizontalListState extends State<AuctionHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isAds ? 155 : 180,
      decoration: BoxDecoration(
        color: Color(0XFFF5F5F5),
      ),
      child: ListView.builder(
        physics: widget.isCollapsed
            ? NeverScrollableScrollPhysics()
            : ScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: (widget.isCollapsed) ? 0 : 12),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx, index) => _buildAuctionItem(index),
      ),
    );
  }

  Widget _buildAuctionItem(int index) {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Card(
            child: Container(
              width: 130,
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/auction_item.png',
                          height: 83.5,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 8,
                          left: 3,
                          right: 8,
                          child: widget.withTime
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Card(
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
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: widget.isAds ? 0 : 12,
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
                        widget.isAds
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
            arguments: widget.auctionType,
          ),
        ),
        SizedBox(
          width: index == 9 ? 0 : 6,
        ),
      ],
    );
  }
}
