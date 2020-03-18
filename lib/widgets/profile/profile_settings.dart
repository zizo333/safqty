import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/screens/auth/activation_screen.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  // TODO: Variables
  var _personalData = false;
  var _mobileNumber = false;
  GlobalKey<FormState> _form = GlobalKey();
  Map _changedData = {
    'name' : '',
    'phone' : '',
    'email' : ''
  };
  @override
  Widget build(BuildContext context) {
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
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
          _buildSettingChoice(tr('modify_number'), 1),
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
              style: TextStyle(color: SBlack),
              initialValue: 'عبدالعزيز عادل الخولى',
              cursorColor: SOrange,
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
              style: TextStyle(color: SBlack),
              initialValue: '684329692754',
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(''),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_the_phone_number');
                }
                return null;
              },
              onSaved: (value) {
                _changedData['phone'] = value;
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
              style: TextStyle(color: SBlack),
              initialValue: 'zizo@gmail.com',
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(''),
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
                child: RaisedButton(
                  color: SOrange,
                  child: Text(
                    tr('confirm'),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _submit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
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
              _mobileNumber = !_mobileNumber;
              if (_mobileNumber) {
                Navigator.of(context).pushNamed(
                  ActivationScreen.routeName,
                  arguments: ActivationType.mobileNumber,
                );
              }
            });
            break;
        }
      },
    );
  }
}
