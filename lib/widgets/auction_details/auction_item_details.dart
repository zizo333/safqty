import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class AuctionItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: SOrange, width: 1),
                      image: DecorationImage(
                          image: AssetImage('assets/images/user_photo.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'أحمد خالد محمد',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: SBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'قبل 5 دقيقة',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0XFFAAB5BC),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  '500',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SOrange,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'ريال',
                  style: TextStyle(
                    fontSize: 15,
                    color: SOrange,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة',
              style: TextStyle(
                fontSize: 13,
                color: SBlack1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    height: 35.33,
                    width: 35.33,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: SOrange.withOpacity(0.11),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/message_border.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                  label: Text(
                    tr('chat'),
                    style: TextStyle(
                      fontSize: 14,
                      color: SOrange,
                    ),
                  ),
                  onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
