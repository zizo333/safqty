import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/screens/auth/activation_screen.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class ProfileSettings extends StatefulWidget {
  final Map<String, String> userData;

  ProfileSettings(this.userData);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  // TODO: Variables
  var _personalData = false;
  var _changePassword = false;
  var _update = false;
  var _loading = false;
  GlobalKey<FormState> _form = GlobalKey();
  Map<String, String> _changedData = {
    'name': '',
    'mobile': '',
    'email': '',
    'device_token': '',
    'device_type': '',
    'image': '',
  };
  FocusNode _phoneNumberNode = FocusNode();
  FocusNode _emailNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneNumberNode.dispose();
    _emailNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (_personalData) {
      return _showPersonalDataScreen(isLandscape);
    } else {
      return _showSettingsScreen();
    }
  }

  // TODO: Helper functions
  Widget _showSettingsScreen() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 250),
      child: Column(
        children: <Widget>[
          _buildSettingChoice(tr('modify_data'), 0),
          SizedBox(
            height: 10,
          ),
          _buildSettingChoice(tr('change_password'), 1),
        ],
      ),
    );
  }

  Widget _showPersonalDataScreen(bool isLandscape) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: isLandscape ? 480 : 400),
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LoginRegisterStyle.titleStyle(tr('name')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: _update ? true : false,
              style: TextStyle(color: SBlack),
              initialValue: widget.userData['name'],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              cursorColor: SOrange,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_phoneNumberNode);
              },
              decoration: LoginRegisterStyle.texFieldDecoration(''),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_your_name');
                }
                return null;
              },
              onSaved: (value) {
                _changedData['name'] = value;
              },
            ),
            SizedBox(
              height: 24,
            ),
            LoginRegisterStyle.titleStyle(tr('phone_number')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: _update ? true : false,
              style: TextStyle(color: SBlack),
              initialValue: widget.userData['mobile'],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(''),
              focusNode: _phoneNumberNode,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_emailNode);
              },
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_the_phone_number');
                }
                return null;
              },
              onSaved: (value) {
                _changedData['mobile'] = value;
              },
            ),
            SizedBox(
              height: 24,
            ),
            LoginRegisterStyle.titleStyle(tr('email')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: _update ? true : false,
              style: TextStyle(color: SBlack),
              initialValue: widget.userData['email'],
              keyboardType: TextInputType.emailAddress,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(''),
              focusNode: _emailNode,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_the_email');
                } else if (!value.contains('@')) {
                  return tr('invalid_email');
                }
                return null;
              },
              onSaved: (value) {
                _changedData['email'] = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 53,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _loading
                    ? Container(
                        alignment: Alignment.center,
                        width: 53,
                        child: LoadingIndicator(
                          color: SOrange,
                          indicatorType: Indicator.ballClipRotate,
                        ),
                      )
                    : RaisedButton(
                        color: SOrange,
                        child: Text(
                          _update ? tr('confirm') : tr('update'),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (!_update) {
                            setState(() {
                              _update = true;
                            });
                          } else {
                            _submit();
                          }
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _loading = true;
    });
    try {
      final result = await Provider.of<LoginProvider>(context, listen: false)
          .updateProfile(_changedData);
      setState(() {
        _update = false;
      });
      if (!result['value']) {
        Commons.showAlert(
          context: context,
          title: tr('warning'),
          content: result['msg'],
        );
      } else {
        showToast(
          tr('updated_data'),
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

  Widget _buildSettingChoice(String title, int index) {
    return InkWell(
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Color(0XFF434A51),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      onTap: () {
        switch (index) {
          case 0:
            setState(() {
              _personalData = !_personalData;
            });
            break;
          case 1:
            setState(() {
              _changePassword = !_changePassword;
              if (_changePassword) {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (ctx) => ActivationScreen(
                          activationType: ActivationType.forgotPassword,
                        ),
                      ),
                    )
                    .then(
                      (value) => _changePassword = false,
                    );
              }
            });
            break;
        }
      },
    );
  }
}
