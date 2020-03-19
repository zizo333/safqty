import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/tabs/add_auction.dart';

import 'home_screen.dart';
import 'tabs/messages_screen.dart';
import 'tabs/my_favorite_screen.dart';
import 'tabs/profile_screen.dart';

class TabBarItems extends StatefulWidget {
  static final routeName = '/tab-bar-items';

  @override
  _TabBarItemsState createState() => _TabBarItemsState();
}

class _TabBarItemsState extends State<TabBarItems> {
  // TODO: Variables
  var _pages = [
    HomeScreen(),
    MyFavoriteScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];
  var _index = 0;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return WillPopScope(
      onWillPop: () => Commons.closeTheApp(context),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: _pages[_index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 83,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFCED4DA),
                    offset: Offset(0, -1),
                    blurRadius: 8)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: SOrange,
              unselectedItemColor: Color(0XFFAAB5BC),
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              onTap: (index) {
                _currentIndex = index;
                if (index == 2) {
                  return;
                } else if (index > 2) {
                  index--;
                }
                setState(() {
                  _index = index;
                });
              },
              backgroundColor: Color(0XFFFCFCFD),
              items: [
                BottomNavigationBarItem(
                  activeIcon: _buildTabBarItem('assets/images/home_fill.png'),
                  icon: _buildTabBarItem('assets/images/home.png'),
                  title: Text(
                    tr('home'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: _buildTabBarItem('assets/images/heart_fill.png'),
                  icon: _buildTabBarItem('assets/images/heart.png'),
                  title: Text(
                    tr('my_favorites'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: SOrange,
                      child: Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Theme.of(context).canvasColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (ctx) {
                          return AddAuction();
                        },
                      );
                    },
                  ),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      _buildTabBarItem('assets/images/message_fill.png'),
                  icon: _buildTabBarItem('assets/images/message.png'),
                  title: Text(
                    tr('my_messages'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      _buildTabBarItem('assets/images/profile_fill.png'),
                  icon: _buildTabBarItem('assets/images/profile.png'),
                  title: Text(
                    tr('my_profile'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildTabBarItem(String imagePath) {
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          fit: BoxFit.fill,
          width: 25,
          height: 25,
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
