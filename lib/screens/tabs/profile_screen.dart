import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/widgets/auction_common/auction_grid_items.dart';
import 'package:safqty/widgets/profile/auction_numbers.dart';
import 'package:safqty/widgets/profile/profile_settings.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: Variables
  var _showSettings = false;
  Map<String, String> _userData = {
    'name' : tr('name'),
    'mobile' : tr('phone_number'),
    'email' : tr('email'),
  };

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
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as bool ?? false;
    final deviceSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  top: -1774,
                  left: -1 * ((2000 - deviceSize.width) / 2),
                  right: -1 * ((2000 - deviceSize.width) / 2),
                  height: 2000,
                  child: Container(
                    decoration: BoxDecoration(
                      color: SOrange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1000),
                        bottomRight: Radius.circular(1000),
                      ),
                      gradient: LinearGradient(
                          colors: [Color(0XFFDF605A), Color(0XFFF94C31)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      args
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                _showSettings
                                    ? setState(() {
                                        _showSettings = !_showSettings;
                                      })
                                    : Navigator.of(context).pop();
                              },
                            )
                          : _showSettings
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showSettings = !_showSettings;
                                    });
                                  },
                                )
                              : Container(
                                  width: 50,
                                ),
                      Text(
                        tr('m_profile'),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _showSettings = !_showSettings;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 130,
                  left: (deviceSize.width / 2) - (136 / 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: SizedBox(
                        width: 136,
                        height: 136,
                        child: Image.asset(
                          'assets/images/user_photo.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              _userData['name'],
              style: TextStyle(
                fontSize: 25,
                color: Color(0XFF434A51),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _showSettings
                ? ProfileSettings(_userData)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AuctionNumbers(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        tr('my_auctions'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF434A51),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      AuctionGridItems(
                        withFavorite: false,
                        hasMenu: true,
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
