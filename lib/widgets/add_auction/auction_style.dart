import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class AuctionStyle {
  static InputDecoration textFieldDecoration(
      {String hintText, String tailText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: hintText,
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
      suffixIcon: Container(
        height: 40,
        width: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          tailText,
          style: TextStyle(
            fontSize: 14,
            color: SBlack1,
          ),
        ),
      ),
    );
  }
}
