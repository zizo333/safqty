import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class LoginRegisterStyle {
  static Widget titleStyle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        color: Color(0XFF606060),
      ),
    );
  }

  static InputDecoration texFieldDecoration(
    String hintText, [
    bool isPass = false,
    bool passState = true,
    Function togglePass,
    bool hasCodeNumber = false,
    String code = '',
  ]) {
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
      suffixIcon: isPass
          ? IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: passState ? Color(0XFFA7A3A3) : SOrange,
              ),
              onPressed: () {
                togglePass();
              },
            )
          : hasCodeNumber
              ? Container(
                  height: 50,
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 1,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          code,
                          style: TextStyle(
                            fontSize: 14,
                            color: SBlack1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        'assets/images/saudi-arabia.png',
                        width: 28,
                        height: 20,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                )
              : null,
    );
  }

  static Widget buildButton(
    String title,
    Function action, [
    bool changed = false,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: changed ? 20 : 30),
      child: Container(
        height: changed ? 56 : 51,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: RaisedButton(
            color: SOrange,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: action,
          ),
        ),
      ),
    );
  }

  static Widget accountState(String title1, String title2, Function action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title1,
          style: TextStyle(
            fontSize: 16,
            color: Color(0XFF606060),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        GestureDetector(
          child: Text(
            title2,
            style: TextStyle(
              fontSize: 16,
              color: SOrange,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: action,
        )
      ],
    );
  }
}
