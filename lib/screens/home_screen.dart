import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/screens/filter_screen.dart';
import 'package:safqty/widgets/home/auction_footer.dart';
import 'package:safqty/widgets/home/auction_horizontal_list.dart';
import 'package:safqty/widgets/home/home_footer.dart';
import 'package:safqty/widgets/home/home_slider.dart';
import 'package:safqty/widgets/home/items_list.dart';
import 'package:safqty/widgets/home/profile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: Variables
  var _isCollapsed = false;
  Map<String, String> _userData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData().then((value) {
      setState(() {
        _userData = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFF434A51),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: -20,
            right: -15,
            child: Container(
              height: 280,
              width: 220,
              child: Image.asset('assets/images/home_logo.png'),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              child: ListView(
                padding: const EdgeInsets.only(top: 75, bottom: 20),
                children: <Widget>[
                  Profile(_userData['name'] ?? tr('name')),
                  SizedBox(
                    height: isLandscape ? 5 : 20,
                  ),
                  ItemsList(_toggleCollapsing),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: _isCollapsed ? isLandscape ? 70 : 130 : 0,
            bottom: _isCollapsed ? isLandscape ? 40 : 110 : 0,
            right: _isCollapsed
                ? isLandscape
                    ? isEnglish
                        ? (-1 * deviceSize.width * 0.9)
                        : deviceSize.width * 0.9
                    : isEnglish
                        ? (-1 * deviceSize.width * 0.8)
                        : deviceSize.width * 0.8
                : 0,
            left: _isCollapsed
                ? isLandscape
                    ? isEnglish
                        ? deviceSize.width * 0.9
                        : (-1 * deviceSize.width * 0.9)
                    : isEnglish
                        ? deviceSize.width * 0.8
                        : (-1 * deviceSize.width * 0.8)
                : 0,
            child: GestureDetector(
              onTap: () {
                if (_isCollapsed) {
                  _toggleCollapsing();
                }
              },
              child: AnimatedContainer(
                duration: _isCollapsed
                    ? Duration(microseconds: 1)
                    : Duration(seconds: 1),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0XFFF5F5F5),
                    borderRadius: _isCollapsed
                        ? BorderRadius.circular(20)
                        : BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 0),
                        blurRadius: 10,
                      ),
                    ]),
                child: SingleChildScrollView(
                  physics: _isCollapsed
                      ? NeverScrollableScrollPhysics()
                      : ScrollPhysics(),
                  child: Container(
                    width: deviceSize.width,
                    height: deviceSize.height + (isLandscape ? 760 : 260),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          top: 0,
                          right: 0,
                          left: 0,
                          height: 270,
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  height: 230,
                                  child: HomeFooter(
                                    _toggleCollapsing,
                                    _isCollapsed,
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 16,
                                  right: 16,
                                  height: 150,
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                    child: HomeSlider(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          top: 260,
                          left: _isCollapsed ? 20 : 0,
                          right: _isCollapsed ? 20 : 0,
                          bottom: 100,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  tr('what_do_you_need'),
                                  style: TextStyle(
                                    color: Color(0XFF434A51),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AuctionFooter(
                                imageSource: 'assets/images/auctionopen.png',
                                title: tr('open_auction'),
                                actionImage: 'assets/images/view.png',
                                action: () {
                                  Navigator.of(context).pushNamed(
                                    FilterScreen.routeName,
                                    arguments: [
                                      tr('open_auction'),
                                      AuctionType.OpenAuction
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AuctionHorizontalList(
                                isCollapsed: _isCollapsed,
                                withTime: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AuctionFooter(
                                imageSource: 'assets/images/auctionclosed.png',
                                title: tr('time_specific_auctions'),
                                actionImage: 'assets/images/view.png',
                                action: () {
                                  Navigator.of(context).pushNamed(
                                    FilterScreen.routeName,
                                    arguments: [
                                      tr('time_auctions'),
                                      AuctionType.TimeAuctions
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AuctionHorizontalList(
                                isCollapsed: _isCollapsed,
                                withTime: true,
                                auctionType: AuctionType.TimeAuctions,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AuctionFooter(
                                imageSource: 'assets/images/order_ads.png',
                                title: tr('required_ads'),
                                actionImage: 'assets/images/view.png',
                                action: () {
                                  Navigator.of(context).pushNamed(
                                    FilterScreen.routeName,
                                    arguments: [
                                      tr('orders'),
                                      AuctionType.OpenAuction
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AuctionHorizontalList(
                                isCollapsed: _isCollapsed,
                                withTime: false,
                                isAds: true,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: Helper functions
  void _toggleCollapsing() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }
}
