import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';

class ActivationMobileNumber extends StatefulWidget {
  final TextEditingController textEditingController;
  final ActivationType activationType;

  ActivationMobileNumber(this.textEditingController,
      [this.activationType = ActivationType.forgotPassword]);

  @override
  _ActivationMobileNumberState createState() => _ActivationMobileNumberState();
}

class _ActivationMobileNumberState extends State<ActivationMobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.activationType == ActivationType.forgotPassword
              ? tr('change_password')
              : tr('change_mobile'),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0XFF606060),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        widget.activationType == ActivationType.forgotPassword
            ? Text(
                tr('enter_your_mobile_number_to_change_the_password'),
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF606060),
                ),
                textAlign: TextAlign.center,
              )
            : Container(),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Localizations.localeOf(context).languageCode == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            tr('phone_number'),
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF606060),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          cursorColor: SOrange,
          textInputAction: TextInputAction.done,
          controller: widget.textEditingController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            hintText: tr('phone_number'),
            hintStyle: TextStyle(
              color: Color(0XFFAAB5BC),
              fontSize: 14,
            ),
            border: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFF1F3F5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: SOrange,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        )
      ],
    );
  }
}
