import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:safqty/constents/colors.dart';

class ActivationCode extends StatefulWidget {
  final TextEditingController codeController;
  final String code;
  ActivationCode(this.codeController, this.code);

  @override
  _ActivationCodeState createState() => _ActivationCodeState();
}

class _ActivationCodeState extends State<ActivationCode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          tr('new_account'),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0XFF606060),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          tr('please_enter_the_activation_code_sent_to_you'),
          style: TextStyle(
            fontSize: 18,
            color: Color(0XFF606060),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Localizations.localeOf(context).languageCode == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            tr('activation_code'),
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF606060),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PinCodeTextField(
            maxLength: 4,
            pinBoxHeight: 50,
            pinBoxWidth: 50,
            pinBoxRadius: 10,
            wrapAlignment: WrapAlignment.center,
            pinBoxOuterPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            pinTextAnimatedSwitcherDuration: Duration(milliseconds: 200),
            keyboardType: TextInputType.number,
            pinTextStyle: TextStyle(
              color: SBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            onTextChanged: (value) {
              widget.codeController.text = value;
            },
          ),
        ),
      ],
    );
  }
}
