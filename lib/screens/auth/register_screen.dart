import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/models/register.dart';
import 'package:safqty/providers/register_provider.dart';
import 'package:safqty/screens/auth/activation_screen.dart';
import 'package:safqty/screens/auth/login_screen.dart';
import 'package:safqty/screens/side_menu/terms_screen.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';
import 'package:safqty/widgets/register/choose_image.dart';
import 'package:safqty/widgets/register/register_form.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // TODO: Variables
  GlobalKey<FormState> _form = GlobalKey();
  File _selectedImage;
  final _registerData = Register();
  var _acceptConditions = false;
  var _loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Commons.closeTheApp(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              children: <Widget>[
                ChooseImage(_getPickedImage),
                SizedBox(
                  height: 35,
                ),
                RegisterForm(
                  form: _form,
                  registerData: _registerData,
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _acceptConditions,
                      checkColor: SOrange,
                      activeColor: SOrange,
                      onChanged: (value) {
                        setState(() {
                          _acceptConditions = !_acceptConditions;
                        });
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      tr('accept'),
                      style: TextStyle(fontSize: 14, color: SBlack),
                    ),
                    GestureDetector(
                      child: Text(
                        tr('terms_conditions'),
                        style: TextStyle(
                          fontSize: 14,
                          color: SOrange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed(TermsScreen.routeName),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                LoginRegisterStyle.buildButton(
                  tr('continue'),
                  () {
                    _register();
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                LoginRegisterStyle.accountState(
                  tr('have_account'),
                  tr('login_now'),
                  () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                ),
              ],
            ),
            _loading
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black38,
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: LoadingIndicator(
                          color: SOrange,
                          indicatorType: Indicator.ballClipRotate,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  // TODO: Helper functions
  void _getPickedImage(File pickedImage) {
    _selectedImage = pickedImage;
  }

  Future<void> _register() async {
    if (!_form.currentState.validate()) {
      return;
    }
    if (!_registerData.checkCity) {
      _registerData.checkCity = true;
      setState(() {});
      return;
    }
    setState(() {});
    if (!_acceptConditions) {
      Commons.showAlert(
        context: context,
        title: tr('warning'),
        content: tr('please_accept_the_conditions'),
      );
      return;
    }
    _form.currentState.save();
    setState(() {
      _loading = true;
    });
    try {
      final result =
          await Provider.of<RegisterProvider>(context, listen: false).register(
        _registerData.getRegisterData(),
        _selectedImage,
      );
      if (result['value']) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ActivationScreen(
              code: result['msg'],
              mobile: result['mobile'],
              activationType: ActivationType.register,
            ),
          ),
        );
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
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
