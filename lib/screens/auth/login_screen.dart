import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/models/custom_notification.dart';
import 'package:safqty/screens/auth/register_screen.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login/login_form.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//    if (isPasswordChanged) {
//      showToast('تم', context: context, duration: Duration(seconds: 2));
//      isPasswordChanged = false;
//    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return WillPopScope(
      onWillPop: () => Commons.closeTheApp(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: -(MediaQuery.of(context).viewInsets.bottom + 20),
              right: -15,
              child: Container(
                height: 250,
                width: 200,
                child: Image.asset('assets/images/back_image.png'),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Commons.safqtyHeader(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: LoginForm(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      LoginRegisterStyle.accountState(
                        tr('no_account'),
                        tr('register_now'),
                        () {
                          Navigator.pushReplacementNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
