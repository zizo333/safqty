import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/models/city.dart';
import 'package:safqty/models/register.dart';
import 'package:safqty/providers/city_provider.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> form;
  final Register registerData;

  RegisterForm({this.form, this.registerData});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // TODO: Variables
  var _textFieldStyle = TextStyle(fontSize: 20);
  FocusNode _emailNode = FocusNode();
  FocusNode _phoneNumberNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _confirmPasswordNode = FocusNode();
  final _passwordController = TextEditingController();
  var _passwordToggle = true;
  var _confirmPasswordToggle = true;

  List<CityData> _cityData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // TODO: Dispose
  @override
  void dispose() {
    super.dispose();
    _emailNode.dispose();
    _phoneNumberNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
    _passwordController.dispose();
  }

  // TODO: build
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.form,
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
                  return tr('please_enter_the_full_name');
                }
                return null;
              },
              onSaved: (value) {
                widget.registerData.name = value;
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
                FocusScope.of(context).requestFocus(_phoneNumberNode);
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
                widget.registerData.email = value;
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
              decoration:
                  LoginRegisterStyle.texFieldDecoration(tr('phone_number')),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              focusNode: _phoneNumberNode,
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
                widget.registerData.mobile = value;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('password')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(
                  tr('password'), true, _passwordToggle, () {
                setState(() {
                  _passwordToggle = !_passwordToggle;
                });
              }),
              keyboardType: TextInputType.text,
              obscureText: _passwordToggle,
              textInputAction: TextInputAction.next,
              controller: _passwordController,
              focusNode: _passwordNode,
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
                widget.registerData.password = value;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('confirm_password')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              style: _textFieldStyle,
              cursorColor: SOrange,
              decoration: LoginRegisterStyle.texFieldDecoration(
                  tr('confirm_password'), true, _confirmPasswordToggle, () {
                setState(() {
                  _confirmPasswordToggle = !_confirmPasswordToggle;
                });
              }),
              keyboardType: TextInputType.text,
              obscureText: _confirmPasswordToggle,
              textInputAction: TextInputAction.done,
              focusNode: _confirmPasswordNode,
              validator: (value) {
                if (_passwordController.text != value) {
                  return tr('password_not_match');
                }
                widget.registerData.confirmPassword = _passwordController.text;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          LoginRegisterStyle.titleStyle(tr('city')),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 53,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FutureBuilder(
              future: Provider.of<CityProvider>(context, listen: false)
                  .fetchCities(),
              builder: (ctx, snapshot) => snapshot.hasError
                  ? Text(
                      tr('loading_cities'),
                      style: TextStyle(
                        color: SOrange,
                        fontSize: 14,
                      ),
                    )
                  : Consumer<CityProvider>(
                      builder: (ctx, cities, child) => DropdownButton<String>(
                        iconEnabledColor: Colors.grey,
                        isExpanded: true,
                        underline: Container(),
                        hint: Text(
                          tr('city'),
                          style: TextStyle(
                            color: Color(0XFFAAB5BC),
                            fontSize: 14,
                          ),
                        ),
                        value: widget.registerData.cityId.isEmpty
                            ? null
                            : widget.registerData.cityId,
                        items: cities.items
                            .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(e.name),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.registerData.cityId = value;
                            widget.registerData.checkCity = true;
                            widget.registerData.flag = 1;
                          });
                        },
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          widget.registerData.checkCity && widget.registerData.flag == 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    tr('please_select_the_city'),
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
