import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/auction_common/auction_grid_items.dart';

class MyFavoriteScreen extends StatefulWidget {
  static const routeName = '/my-favorite-screen';

  @override
  _MyFavoriteScreenState createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen>
    with SingleTickerProviderStateMixin {
  // TODO: Variables
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFFCFCFC),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  tr('my_favorites'),
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF434A51),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: SOrange,
                    unselectedLabelColor: Color(0XFFCED4DA),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: SOrange,
                    tabs: <Widget>[
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          tr('open_auction'),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          tr('time_auctions'),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          tr('orders'),
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                    ),
                    color: Color(0XFFF8F8FA),
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Container(
                          child: AuctionGridItems(),
                        ),
                        Container(
                          child: AuctionGridItems(),
                        ),
                        Container(
                          child: AuctionGridItems(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
