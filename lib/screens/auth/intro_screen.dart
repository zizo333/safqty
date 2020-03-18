import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/keywords.dart';
import 'package:safqty/screens/auth/login_screen.dart';
import 'package:safqty/widgets/intro/intro_pages.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _index = 0;

  void _setLastIndex(int lastIndex) {
    setState(() {
      _index = lastIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: Localizations.localeOf(context).languageCode == 'en'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 5, child: IntroPages(_setLastIndex)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              width: 112.61,
              height: 59.62,
              margin: const EdgeInsets.only(bottom: 35),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: SOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(29.81),
                  bottomLeft: Radius.circular(29.81),
                ),
              ),
              child: Text(
                _index == 2 ? 'انضم الينا' : 'تخطى',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              _saveFirstTime();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  // TODO: Helper functions
  Future<void> _saveFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(FIRST_TIME, true);
  }
}
