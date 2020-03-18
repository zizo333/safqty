import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/side_menu/bank_accounts_screen.dart';
import 'package:safqty/screens/side_menu/commission_screen.dart';
import 'package:safqty/screens/side_menu/orders_screen.dart';
import 'package:safqty/screens/side_menu/sign_out_screen.dart';
import 'package:safqty/screens/side_menu/support_screen.dart';
import 'package:safqty/screens/side_menu/terms_screen.dart';

class ItemsList extends StatefulWidget {
  final Function exitCollapsing;

  ItemsList(this.exitCollapsing);

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  // TODO: Variables
  var _index = 0;
  List<Map<String, String>> items = [
    {
      'image': 'assets/images/auctionopenwhite.png',
      'title': tr('my_auctions'),
    },
    {
      'image': 'assets/images/order.png',
      'title': tr('my_orders'),
    },
    {
      'image': 'assets/images/commission.png',
      'title': tr('commission'),
    },
    {
      'image': 'assets/images/bank.png',
      'title': tr('bank_accounts'),
    },
    {
      'image': 'assets/images/support.png',
      'title': tr('support'),
    },
    {
      'image': 'assets/images/list.png',
      'title': tr('terms'),
    },
    {
      'image': 'assets/images/exit.png',
      'title': tr('sign_out'),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (ctx, i) => _buildItem(i),
    );
  }

  Widget _buildItem(int index) {
    final currentItem = items[index];
    return InkWell(
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        color: index == _index ? SOrange : Colors.transparent,
        child: Row(
          children: <Widget>[
            Image.asset(
              currentItem['image'],
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(
              currentItem['title'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (index == 0) {
          widget.exitCollapsing();
        }
        setState(() {
          _index = index;
        });
        switch (_index) {
          case 1:
            Navigator.of(context)
                .pushNamed(OrdersScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
          case 2:
            Navigator.of(context)
                .pushNamed(CommissionScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
          case 3:
            Navigator.of(context)
                .pushNamed(BankAccountsScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
          case 4:
            Navigator.of(context)
                .pushNamed(SupportScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
          case 5:
            Navigator.of(context)
                .pushNamed(TermsScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
          case 6:
            Navigator.of(context)
                .pushNamed(SignOutScreen.routeName)
                .then((value) {
              setState(() {
                _index = 0;
              });
            });
            break;
        }
      },
    );
  }
}
