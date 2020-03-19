import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:safqty/constents/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safqty/screens/auth/intro_screen.dart';
import 'package:safqty/screens/auth/login_screen.dart';

/*
=== language ====
void main() => runApp(EasyLocalization(child: MyApp()));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Safqty',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalizationDelegate(locale: data.locale, path: 'assets/lang')
        ],
        supportedLocales: [
          Locale('ar', 'EG'),
          Locale('en', 'US'),
        ],
        home: SplashScreen(),
      ),
    );
  }
}
-> check the current language:
    Localizations.localeOf(context).languageCode == 'en' ? ... : ...,
-> set language key
    title: Text(tr('language')),
-> change language
    data.changeLocale(locale: Locale('ar', 'EG'));
 */
// pass function as a parameter bool Function() togglePass   -> togglePass()
class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> with SingleTickerProviderStateMixin {
  Size deviceSize;
  var _count = 0;
  Timer _timer;

  // TODO: animation
  AnimationController animationController;
  Animation animation, delayedAnimation;
  Animation borderAnimation;
  Animation animationValue;

  @override
  void initState() {
    super.initState();
    deviceSize = MediaQuery.of(context).size;
    // TODO: animation
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    // delay
    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    // border radius
    borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(50.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    // borderRadius: borderAnimation.value
    // value
    animationValue = IntTween(begin: 0, end: 10).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.forward();
    // TODO: status bar
    // hide
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    // or
    SystemChrome.setEnabledSystemUIOverlays([]);
    // show
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // TODO: orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // TODO: Splash Screen
    // in init state
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => IntroScreen(),
        ),
      ),
    );
    // TODO: PopUntil
    Navigator.of(context).popUntil(ModalRoute.withName(LoginScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // TODO: Splash screen
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
          ),
        ),
        // TODO:
      ],
    );
  }

  // TODO: Helper functions
  /// CupertinoActionSheet
  void chooseImageSource(BuildContext context) {
    final action = CupertinoActionSheet(
      title: Text(
        tr('choose'),
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: SOrange),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(
            tr('gallery'),
            style: TextStyle(
                fontSize: 18,
                color: Color(0XFF434A51),
                fontWeight: FontWeight.normal),
          ),
          isDefaultAction: true,
          onPressed: () {
            print('gallery');
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            tr('camera'),
            style: TextStyle(
                fontSize: 18,
                color: Color(0XFF434A51),
                fontWeight: FontWeight.normal),
          ),
          isDefaultAction: true,
          onPressed: () {
            print('camera');
          },
        ),
      ],
      cancelButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: SOrange,
        ),
        child: CupertinoActionSheetAction(
          child: Text(
            tr('cancel'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (context) => action,
    );
  }

  void showCustomToast() {
    showToast(
      "title",
      context: context,
      textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
      backgroundColor: SOrange,
      textPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      borderRadius: BorderRadius.vertical(
        top: Radius.elliptical(10.0, 20.0),
        bottom: Radius.elliptical(10.0, 20.0),
      ),
      textAlign: TextAlign.justify,
    );
  }

  // TODO: animation
  Widget _buildAnimation() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.gamepad),
                onPressed: () {
                  animationController.forward();
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  }
                },
              )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Transform(
              transform: Matrix4.translationValues(
                0.0,
                animation.value * deviceSize.height,
                0.0,
              ),
              child: GestureDetector(
                onVerticalDragDown: (details) {
                  animationController.reverse();
                },
                child: Container(
                  width: deviceSize.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // TODO: constrained box
  Widget _constrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 250),
      child: Container(),
    );
  }

  // TODO: dismissable
  // flutter_slidable: "^0.5.4"
  Widget _buildNotificationBox() {
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
          padding: const EdgeInsets.only(bottom: 8), child: ListTile() // ...
          ),
    );
  }

  /// timer
  void startTimer() {  // in dispose -> _timer.cancel()
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_count < 20) {
          _count++;
        } else {
          timer.cancel();
        }
      });
    });
  }
}

// local notification
class MyNotification {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future notificationConfig() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSettings = IOSInitializationSettings();
    var initSettings = InitializationSettings(androidSettings, iosSettings);
    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future _onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future showNotification(String code) async {
    var android = AndroidNotificationDetails(
      "channelId",
      "channelName",
      "channelDescription",
      priority: Priority.High,
      importance: Importance.Max,
    );
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android, ios);
    await _flutterLocalNotificationsPlugin.show(
      0,
      "Verification code",
      code,
      platform,
      payload: code,
    );
  }
}
