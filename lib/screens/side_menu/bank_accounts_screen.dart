import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class BankAccountsScreen extends StatelessWidget {
  static const routeName = '/bank-account-screen';
  final accountNumberStyle = TextStyle(fontSize: 14, color: Color(0XFFAAB5BC));
  final textStyle = TextStyle(fontSize: 14, color: SBlack1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 9),
                  blurRadius: 8,
                  spreadRadius: -9)
            ]),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tr('bank_accounts'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemBuilder: (ctx, index) => _buildBankAccountItem(),
                separatorBuilder: (ctx, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBankAccountItem() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/bankImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'بنك ساب السعودي',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SOrange,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      tr('account_number'),
                      style: accountNumberStyle,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '595958000012221',
                      style: textStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      tr('iban'),
                      style: accountNumberStyle,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '595958000012221',
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
