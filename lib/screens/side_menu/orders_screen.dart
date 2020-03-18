import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/auction_common/auction_grid_items.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 9),
                  blurRadius: 8,
                  spreadRadius: -9)
            ]),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tr('all_orders'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    child: Container(
                      width: 25,
                      height: 25,
                      child: Image.asset('assets/images/filter.png', fit: BoxFit.cover,),
                    ),
                    onTap: (){},
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: AuctionGridItems(
                withFavorite: true,
                smallBottomPadding: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
