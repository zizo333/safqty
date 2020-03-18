import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuctionNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            _buildAuctionDetails('321', tr('open_auction')),
            _customDivider(),
            _buildAuctionDetails('321', tr('time_auctions')),
            _customDivider(),
            _buildAuctionDetails('321', tr('orders')),
          ],
        ),
      ),
    );
  }

  Widget _buildAuctionDetails(String number, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              number,
              style: TextStyle(
                fontSize: 20,
                color: Color(0XFF454F63),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFF78849E),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customDivider() {
    return Container(
      width: 1,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.withOpacity(0.2),
    );
  }
}
