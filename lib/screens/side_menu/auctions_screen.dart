import 'package:flutter/material.dart';

class AuctionsScreen extends StatelessWidget {
  static const routeName = '/auctions-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red
        ),
      ),
    );
  }
}
