import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/constents/keywords.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/screens/auth/activation_screen.dart';
import 'package:safqty/screens/auth/interests_screen.dart';
import 'package:safqty/screens/tab_bar_items.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // TODO: Variables
  var _textFieldStyle = TextStyle(fontSize: 20);
  GlobalKey<FormState> _form = GlobalKey();
  FocusNode _passwordNode = FocusNode();
  var _passwordToggle = true;
  var _loading = false;
  Map<String, String> _loginData = {
    'mobile': '',
    'password': '',
    'device_token': 'device token',
    'device_type': Platform.isAndroid ? 'android' : 'ios',
  };

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tr('phone_number'),
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFF606060),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  style: _textFieldStyle,
                  cursorColor: SOrange,
                  decoration:
                      LoginRegisterStyle.texFieldDecoration(tr('phone_number')),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return tr('please_enter_the_phone_number');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _loginData['mobile'] = value;
                  },
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                tr('password'),
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFF606060),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  style: _textFieldStyle,
                  obscureText: _passwordToggle,
                  cursorColor: SOrange,
                  decoration: LoginRegisterStyle.texFieldDecoration(
                      tr('password'), true, _passwordToggle, () {
                    setState(() {
                      _passwordToggle = !_passwordToggle;
                    });
                  }),
                  focusNode: _passwordNode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return tr('please_enter_the_password');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _loginData['password'] = value;
                  },
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Text(
                    tr('forgot_password'),
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF606060),
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                    ActivationScreen.routeName,
                    arguments: ActivationType.forgotPassword,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _loading
            ? Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingIndicator(
                    color: SOrange,
                    indicatorType: Indicator.ballClipRotate,
                  ),
                ),
              )
            : LoginRegisterStyle.buildButton(
                tr('login'),
                () {
                  _submitLogin();
                },
              )
      ],
    );
  }

// TODO: Helper functions

  Future<void> _submitLogin() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _loading = true;
    });
    try {
      final result = await Provider.of<LoginProvider>(context, listen: false)
          .login(_loginData);
      setState(() {
        _loading = false;
      });
      if (result['value']) {
        final pref = await SharedPreferences.getInstance();
        final checkInterests = pref.getBool(IS_INTERESTS_SELECTED) ?? false;
        if (result['verified'].toString().contains('true')) {
          checkInterests
              ? Navigator.of(context)
                  .pushReplacementNamed(TabBarItems.routeName)
              : Navigator.of(context).pushNamed(InterestsScreen.routeName);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ActivationScreen(
                code: result['code'],
                mobile: result['mobile'],
              ),
            ),
          );
        }
      } else {
        Commons.showAlert(
          context: context,
          title: tr('warning'),
          content: result['msg'],
        );
      }
    } catch (error) {
      Commons.showAlert(
        context: context,
        title: tr('warning'),
        content: error.toString(),
      );
      setState(() {
        _loading = false;
      });
    }
  }
}
