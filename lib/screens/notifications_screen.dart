import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notifications-screen';

  @override
  Widget build(BuildContext context) {
    var statusBarSize = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: statusBarSize,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 5,
                  )
                ]),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        tr('notifications'),
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF233561),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        itemCount: 10,
        itemBuilder: (ctx, index) => _buildNotificationBox(context),
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildNotificationBox(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.2,
      key: UniqueKey(),
      actionPane: SlidableDrawerActionPane(),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(8, 5, 8, 12),
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: IconSlideAction(
              color: Colors.transparent,
              iconWidget: Image.asset(
                'assets/images/delete.png',
                width: 15,
                height: 15,
              ),
              onTap: () {
                print("deleted");
              },
            ),
          ),
        ),
      ],
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            child: Container(
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: ListTile(
                leading: Container(
                  height: 36,
                  width: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: SOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/bell_orange.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                title: Container(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Text(
                    'لقد قام " أحمد عصام " بإضفة مزايده لمزادك',
                    style: TextStyle(color: SOrange),
                  ),
                ),
                subtitle: Text('هذا النص هو مثال لنص يمكن أن يستبدل في'),
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(
              AuctionDetailsScreen.routeName,
              arguments: AuctionType.TimeAuctions,
            ),
          ),
        ),
      ),
    );
  }
}
