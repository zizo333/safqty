import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/notifications_screen.dart';

class HomeFooter extends StatefulWidget {
  final Function toggleCollapsing;
  final bool isCollapsed;

  HomeFooter(this.toggleCollapsing, this.isCollapsed);

  @override
  _HomeFooterState createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  // TODO: Variables

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration:
          widget.isCollapsed ? Duration(microseconds: 1) : Duration(seconds: 1),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFF94C31), Color(0XFFDF605A)],
          begin: isEnglish ? Alignment.centerRight : Alignment.centerLeft,
          end: isEnglish ? Alignment.centerLeft : Alignment.centerRight,
        ),
        borderRadius: widget.isCollapsed
            ? BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: widget.isCollapsed ? 20 : 50,
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    isEnglish
                        ? 'assets/images/menu_en.png'
                        : 'assets/images/menu_ar.png',
                    fit: BoxFit.fill,
                    width: 30,
                    height: 20,
                  ),
                  onTap: () {
                    widget.toggleCollapsing();
                  },
                ),
                Text(
                  tr('home'),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/bell.png',
                    fit: BoxFit.fill,
                    width: 26.5,
                    height: 26.5,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: widget.isCollapsed ? 10 : 40,
            left: isEnglish ? deviceSize.width - 70 : 15,
            child: InkWell(
              child: Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        isEnglish ? Radius.circular(12) : Radius.circular(0),
                    bottomRight:
                        isEnglish ? Radius.circular(0) : Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  '82',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: SOrange,
                  ),
                ),
              ),
              onTap: () => Navigator.of(context)
                  .pushNamed(NotificationsScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
