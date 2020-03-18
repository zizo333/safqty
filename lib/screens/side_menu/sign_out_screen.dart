import 'package:flutter/material.dart';

class SignOutScreen extends StatelessWidget {
  static const routeName = '/sign-out-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28,
            color: Color(0XFF434A51),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(),
    );
  }
}
