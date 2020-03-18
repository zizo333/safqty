import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/screens/auth/login_screen.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class ForgotPasswordForm extends StatefulWidget {
  final String mobile;

  ForgotPasswordForm(this.mobile);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  // TODO: Variables
  var _textFieldStyle = TextStyle(fontSize: 20);
  GlobalKey<FormState> _form = GlobalKey();
  FocusNode _confirmPasswordNode = FocusNode();
  final _passwordController = TextEditingController();
  var _passwordToggle = true;
  var _confirmPasswordToggle = true;
  var _loading = false;
  Map<String, String> _passwordData = {
    'mobile': '',
    'password': '',
    'device_token': '111111',
    'device_type': Platform.isAndroid ? 'android' : 'ios',
  };

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _confirmPasswordNode.dispose();
    _passwordController.dispose();
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
                tr('new_password'),
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
                  obscureText: _passwordToggle,
                  decoration: LoginRegisterStyle.texFieldDecoration(
                      tr('password'), true, _passwordToggle, () {
                    setState(() {
                      _passwordToggle = !_passwordToggle;
                    });
                  }),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: _passwordController,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_confirmPasswordNode);
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return tr('please_enter_the_password');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _passwordData['password'] = value;
                  },
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                tr('confirm_new_password'),
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
                  obscureText: true,
                  cursorColor: SOrange,
                  decoration: LoginRegisterStyle.texFieldDecoration(
                      tr('password'), true, _confirmPasswordToggle, () {
                    setState(() {
                      _confirmPasswordToggle = !_confirmPasswordToggle;
                    });
                  }),
                  focusNode: _confirmPasswordNode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_passwordController.text != value) {
                      return tr('password_not_match');
                    }
                    return null;
                  },
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
                height: 56,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: LoadingIndicator(
                    color: SOrange,
                    indicatorType: Indicator.ballClipRotate,
                  ),
                ),
              )
            : LoginRegisterStyle.buildButton(
                tr('confirm'),
                () {
                  _submit();
                },
              )
      ],
    );
  }

  // TODO: Helper functions

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    _passwordData['mobile'] = widget.mobile;
    setState(() {
      _loading = true;
    });
    try {
      final result = await Provider.of<LoginProvider>(context, listen: false)
          .changePassword(_passwordData);
      setState(() {
        _loading = false;
      });
      if (result['value']) {
        isPasswordChanged = true;
        Navigator.of(context).pop();
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
        content: tr('check_internet'),
      );
      setState(() {
        _loading = false;
      });
    }
  }
}
