import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/filter/my_drop_down.dart';
import 'package:safqty/widgets/filter/price_limit.dart';

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  // TODO: Variables
  int _selectedItem = 0;
  List<String> _mainSections = [
    tr('electronics'),
    tr('furnuture'),
    tr('photos'),
  ];
  List<String> _categories = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Color(0XFFFCFCFD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 30),
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                size: 30,
                color: Color(0XFFAAB5BC),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                tr('filter'),
                style: TextStyle(
                  color: Color(0XFF434A51),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildRadioButton(value: 0, title: tr('open_auction')),
                  _buildRadioButton(value: 1, title: tr('time_auctions')),
                  _buildRadioButton(value: 2, title: tr('orders')),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              MyDropDown(
                title: tr('main_section'),
                items: _mainSections,
              ),
              SizedBox(
                height: 13,
              ),
              MyDropDown(
                title: tr('request_category'),
                items: _categories,
              ),
              SizedBox(
                height: 13,
              ),
              MyDropDown(
                title: tr('city'),
                items: _cities,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Text(
            tr('average_price'),
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            tr('price_limits'),
            style: TextStyle(
              fontSize: 13,
              color: Color(0XFFAAB5BC),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          PriceLimit(),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 53,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                color: SOrange,
                child: Text(
                  tr('confirm'),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildRadioButton({int value, String title}) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Radio<int>(
            value: value,
            groupValue: _selectedItem,
            activeColor: SOrange,
            onChanged: (val) {
              setState(() {
                _selectedItem = val;
              });
            },
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _selectedItem == value ? SOrange : Color(0XFFAAB5BC),
              fontWeight:
                  _selectedItem == value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      onTap: () {
        setState(() {
          _selectedItem = value;
        });
      },
    );
  }
}
