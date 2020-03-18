import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/constents/keywords.dart';
import 'package:safqty/models/custom_notification.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/providers/register_provider.dart';
import 'package:safqty/screens/auth/forgot_password_screen.dart';
import 'package:safqty/screens/auth/interests_screen.dart';
import 'package:safqty/screens/tab_bar_items.dart';
import 'package:safqty/widgets/activationCode/activation_code.dart';
import 'package:safqty/widgets/activationCode/activation_mobile_number.dart';
import 'package:safqty/widgets/common/commons.dart';

class ActivationScreen extends StatefulWidget {
  static const routeName = '/activation-screen';
  final String code;
  final String mobile;

  ActivationScreen({this.code = '', this.mobile = ''});

  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  // TODO: Variables
  final _mobileNumberController = TextEditingController();
  final _codeController = TextEditingController();
  var _initActivation = true;
  var _count = 14;
  ActivationType activationType;
  var _loading = false;
  final CustomNotification _customNotification = CustomNotification();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _customNotification.notificationConfig();
    _customNotification.showNotification(widget.code);
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    _mobileNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    activationType =
        ModalRoute.of(context).settings.arguments as ActivationType ??
            ActivationType.register;
    if (activationType == ActivationType.register) {
      _initActivation = false;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0XFFF8F8FA),
            ),
          ),
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
                padding: const EdgeInsets.only(
                  top: 100,
                  bottom: 30,
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Commons.safqtyHeader(),
                    _initActivation
                        ? ActivationMobileNumber(_mobileNumberController)
                        : ActivationCode(_codeController, widget.code),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 51,
                      child: _loading
                          ? LoadingIndicator(
                              color: SOrange,
                              indicatorType: Indicator.ballClipRotate,
                            )
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 12,
                                  offset: Offset(0, 0),
                                )
                              ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: RaisedButton(
                                  color: SOrange,
                                  child: Text(
                                    _initActivation
                                        ? tr('continue')
                                        : tr(('confirm')),
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    _initActivation
                                        ? _checkField(_mobileNumberController)
                                        : _checkField(_codeController);
                                  },
                                ),
                              ),
                            ),
                    ),
                    _initActivation
                        ? Container()
                        : Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      tr('resend_code'),
                                      style: TextStyle(
                                        color: SBlack,
                                        fontSize: 13,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: SOrange,
                                    ),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      padding: const EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        '$_count',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: Helper functions
  Future<void> _checkField(TextEditingController controller) async {
    if (controller.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(tr('warning')),
          content: Text(
            _initActivation
                ? tr('please_enter_the_phone_number')
                : tr('please_enter_the_activation_code'),
          ),
          actions: <Widget>[
            FlatButton(
              textColor: SOrange,
              child: Text(tr('close')),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    } else {
      if (!_initActivation) {
        switch (activationType) {
          case ActivationType.register:
            setState(() {
              _loading = true;
            });
            try {
              final result = await Provider.of<RegisterProvider>(context,
                      listen: false)
                  .verifyAccount(code: controller.text, mobile: widget.mobile);
              setState(() {
                _loading = false;
              });
              if (result['value']) {
                Navigator.of(context)
                    .pushReplacementNamed(InterestsScreen.routeName);
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
            break;
//          case ActivationType.forgotPassword:
//            Navigator.of(context)
//                .pushReplacementNamed(ForgotPasswordScreen.routeName);
//            break;
          case ActivationType.mobileNumber:
            Navigator.of(context).pop();
            break;
        }
        setState(() {
          _initActivation = false;
        });
      } else if (activationType == ActivationType.forgotPassword) {
        _checkMobileNumber(controller);
      }
    }
  }

  Future<void> _checkMobileNumber(TextEditingController controller) async {
    setState(() {
      _loading = true;
    });
    try {
      final result = await Provider.of<LoginProvider>(context, listen: false)
          .checkMobileNumber(controller.text);
      setState(() {
        _loading = false;
      });
      if (result['value']) {
        Navigator.of(context).pushReplacementNamed(
            ForgotPasswordScreen.routeName,
            arguments: result['mobile']);
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
