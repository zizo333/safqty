import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  final String title;
  final List<String> items;

  MyDropDown({this.title, this.items});

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  // TODO: Variables
  var _selectedItem = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedItem = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0XFFF1F3F5), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 14, color: Color(0XFFAAB5BC)),
          ),
          Spacer(),
          DropdownButton(
            underline: Container(),
            icon: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Image.asset(
                'assets/images/dropIcon.png',
                width: 13,
                height: 22,
              ),
            ),
            value: _selectedItem,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          )
        ],
      ),
    );
  }
}
