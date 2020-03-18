import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/add_auction/added_auction_success_screen.dart';
import 'package:safqty/screens/add_auction/continue_add_auction_screen.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/filter/my_drop_down.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class AddAuctionDetails extends StatefulWidget {
  final AuctionType auctionType;

  AddAuctionDetails(this.auctionType);

  @override
  _AddAuctionDetailsState createState() => _AddAuctionDetailsState();
}

class _AddAuctionDetailsState extends State<AddAuctionDetails> {
  List<String> _mainSections = [
    tr('electronics'),
    tr('furnuture'),
    tr('photos'),
  ];
  List<String> _subsections = [
    tr('computer'),
    tr('laptop'),
    tr('chair'),
    tr('mobile'),
  ];
  List<String> _cities = [
    'الدمام',
    'الرياض',
    'جده',
  ];

  Map addAuctionData = {
    'address': '',
    'main_scetion': '',
    'subsection': '',
    'city': '',
    'description': '',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LoginRegisterStyle.titleStyle(tr('auction_address')),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 66,
          width: double.infinity,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0XFFF1F3F5), width: 1),
          ),
          child: Text(
            'مكتب و كرسي أيكا جديد',
            style: TextStyle(
              fontSize: 14,
              color: Color(0XFFAAB5BC),
            ),
          ),
        ),
        SizedBox(
          height: 23,
        ),
        LoginRegisterStyle.titleStyle(tr('main_section')),
        SizedBox(
          height: 10,
        ),
        MyDropDown(
          title: tr('main_section'),
          items: _mainSections,
        ),
        SizedBox(
          height: 23,
        ),
        LoginRegisterStyle.titleStyle(tr('subsection')),
        SizedBox(
          height: 10,
        ),
        MyDropDown(
          title: tr('subsection'),
          items: _subsections,
        ),
        SizedBox(
          height: 23,
        ),
        LoginRegisterStyle.titleStyle(tr('city')),
        SizedBox(
          height: 10,
        ),
        MyDropDown(
          title: tr('city'),
          items: _cities,
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
            style: TextStyle(fontSize: 16),
            maxLines: 4,
            cursorColor: SOrange,
            decoration:
                LoginRegisterStyle.texFieldDecoration(tr('clear_description')),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        LoginRegisterStyle.buildButton(tr('continue1'), _submit)
      ],
    );
  }

  void _submit() {
    widget.auctionType == AuctionType.Order
        ? Navigator.of(context).pushNamed(
            AddedAuctionSuccessScreen.routeName,
          )
        : Navigator.of(context).pushNamed(
            ContinueAddAuction.routeName,
            arguments: widget.auctionType,
          );
  }
}
