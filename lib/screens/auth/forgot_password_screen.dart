import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/forgot_password/forgot_password_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password-screen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final mobile = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: -20,
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
                      child: ForgotPasswordForm(mobile),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
