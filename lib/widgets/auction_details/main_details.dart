import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class MainDetails extends StatelessWidget {
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
              'مكتب و كرسي أيكا جديد',
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
              'الجمعة 24 أ أغسطس',
              style: textStyle,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              'الاثنين 29 أ أغسطس',
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
              'السعودية , الدمام , شارع',
              style: textStyle,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
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
                imagePath: 'assets/images/tag.png', price: '400 ريال', status: 'بداية السوم'),
            SizedBox(width: 15,),
            _buildAuctionDetails(
                imagePath: 'assets/images/tag.png', price: '900 ريال', status: 'الحد'),
            SizedBox(width: 15,),
            _buildAuctionDetails(
                imagePath: 'assets/images/quantity.png', price: '12 عدد', status: 'الكمية'),
            SizedBox(width: 15,),
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

/*
Expanded(
      child: ListTile(
        leading: Container(
          height: 46,
          width: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: SOrange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/images/bell_orange.png',
            width: 25,
            height: 25,
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(bottom: 9.0),
          child: Text(
            price,
            style: TextStyle(color: SOrange),
          ),
        ),
        subtitle: Text(
          status,
          style: textStyle,
        ),
      ),
    );
 */
