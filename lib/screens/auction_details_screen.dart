import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/auction_details/auction_details_slider.dart';
import 'package:safqty/widgets/auction_details/auction_item_details.dart';
import 'package:safqty/widgets/auction_details/main_details.dart';

enum AuctionType {
  OpenAuction,
  TimeAuctions,
  Order,
}

class AuctionDetailsScreen extends StatelessWidget {
  static const routeName = '/auction-details-screen';

  @override
  Widget build(BuildContext context) {
    final auctionType = ModalRoute.of(context).settings.arguments as AuctionType;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AuctionDetailsSlider(auctionType),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 250,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        top: -60,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 26,
                              horizontal: 20,
                            ),
                            child: MainDetails(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        tr('auctioners'),
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        '(32)',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 20,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (ctx, index) => AuctionItemDetails(),
                  separatorBuilder: (ctx, index) => SizedBox(
                    height: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 61,
            width: 61,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: SOrange,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: SOrange,
                    blurRadius: 9.0,
                  )
                ]),
            child: Image.asset(
              'assets/images/add_auction.png',
              width: 25,
              height: 25,
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            print('tapped');
          },
        ),
      ),
    );
  }
}
