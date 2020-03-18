import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/add_auction/add_auction_screen.dart';
import 'package:safqty/screens/auction_details_screen.dart';

class AddAuction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Icon(
                  Icons.clear,
                  color: Colors.grey,
                  size: 30,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              tr('add'),
              style: TextStyle(
                color: Color(0XFF434A51),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              tr('add_today'),
              style: TextStyle(
                fontSize: 16,
                color: Color(0XFFAAB5BC),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            _buildAddAuction(
                context: context,
                title: tr('add_an_open_auction'),
                imagePath: 'assets/images/auctionopen.png'),
            SizedBox(
              height: 10,
            ),
            _buildAddAuction(
              context: context,
              title: tr('add_an_auction_with_time'),
              imagePath: 'assets/images/auctionclosed.png',
              auctionType: AuctionType.TimeAuctions,
            ),
            SizedBox(
              height: 10,
            ),
            _buildAddAuction(
                context: context,
                title: tr('add_order'),
                imagePath: 'assets/images/order_ads.png',
            auctionType: AuctionType.Order),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAuction(
      {BuildContext context,
      String title,
      String imagePath,
      AuctionType auctionType = AuctionType.OpenAuction}) {
    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: SOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF434A51),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(
                AddAuctionScreen.routeName,
                arguments: auctionType
            );
          }
        ),
      ),
    );
  }
}
