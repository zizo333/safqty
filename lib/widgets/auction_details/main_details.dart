import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class MainDetails extends StatelessWidget {
  final auctionData;

  MainDetails(this.auctionData);

  final textStyle = TextStyle(fontSize: 13, color: Color(0XFFAAB5BC));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              auctionData.title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton.icon(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.outlined_flag,
                color: Color(0XFFAAB5BC),
                size: 26,
              ),
              label: Text(
                tr('notify'),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0XFFAAB5BC),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.date_range,
              color: Color(0XFFAAB5BC),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              auctionData.startDate,
              style: textStyle,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              auctionData.endDate,
              style: textStyle,
            ),
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Color(0XFFAAB5BC),
            ),
            SizedBox(
              width: 13,
            ),
            Text(
              auctionData.address,
              style: textStyle,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          auctionData.description,
          style: TextStyle(
            fontSize: 13,
            color: SBlack1,
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          tr('auction_details'),
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 17,
        ),
        Row(
          children: <Widget>[
            _buildAuctionDetails(
                imagePath: 'assets/images/tag.png',
                price: auctionData.startPrice + ' ' + tr('currency'),
                status: tr('start_price')),
            SizedBox(
              width: 15,
            ),
            _buildAuctionDetails(
                imagePath: 'assets/images/tag.png',
                price: auctionData.lastPrice + ' ' + tr('currency'),
                status: tr('end_price')),
            SizedBox(
              width: 15,
            ),
            _buildAuctionDetails(
                imagePath: 'assets/images/quantity.png',
                price: tr('count') + ' ${auctionData.count}',
                status: tr('count')),
            SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }

  // TODO: Helper functions
  Widget _buildAuctionDetails({String imagePath, String price, String status}) {
    return Row(
      children: <Widget>[
        Container(
          height: 46,
          width: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: SOrange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imagePath,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          children: <Widget>[
            Text(
              price,
              style: TextStyle(
                color: SOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              status,
              style: textStyle,
            ),
          ],
        )
      ],
    );
  }
}
