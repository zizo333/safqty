import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class SupportForm extends StatefulWidget {
  @override
  _SupportFormState createState() => _SupportFormState();
}

class _SupportFormState extends State<SupportForm> {
  GlobalKey<FormState> _form = GlobalKey();
  FocusNode _emailNode = FocusNode();
  FocusNode _phoneNode = FocusNode();
  FocusNode _description = FocusNode();
  var _textFieldStyle = TextStyle(fontSize: 16);
  Map<String, String> _supportData = {
    'name': '',
    'email': '',
    'phone': '',
    'description': '',
  };

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailNode.dispose();
    _phoneNode.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LoginRegisterStyle.titleStyle(tr('name')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              cursorColor: SOrange,
              decoration:
                  LoginRegisterStyle.texFieldDecoration(tr('full_name')),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailNode);
              },
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_your_name');
                }
                return null;
              },
              onSaved: (value) {
                _supportData['name'] = value;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('email')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(tr('email')),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              focusNode: _emailNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_phoneNode);
              },
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_the_email');
                } else if (!value.contains('@')) {
                  return tr('invalid_email');
                }
                return null;
              },
              onSaved: (value) {
                _supportData['email'] = value;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('phone_number')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(
                tr('phone_number'),
                false,
                false,
                () {},
                true,
                '+966',
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              focusNode: _phoneNode,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_description);
              },
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_the_phone_number');
                }
                return null;
              },
              onSaved: (value) {
                _supportData['phone'] = value;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('description')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              maxLines: 3,
              cursorColor: SOrange,
              decoration:
                  LoginRegisterStyle.texFieldDecoration(tr('description')),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              focusNode: _description,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return tr('please_enter_your_message');
                }
                return null;
              },
              onSaved: (value) {
                _supportData['description'] = value;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LoginRegisterStyle.buildButton(tr('send'), _submit)
        ],
      ),
    );
  }

  void _submit() {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
  }
}
