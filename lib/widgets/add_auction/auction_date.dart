import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class AuctionDate extends StatefulWidget {
  final String title;
  final String dateTitle;

  AuctionDate(this.title, this.dateTitle);

  @override
  _AuctionDateState createState() => _AuctionDateState();
}

class _AuctionDateState extends State<AuctionDate> {
  String _selectedDate;
  DateTime _chooseDate = DateTime.now();
  var _dateTitle = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0XFFF1F3F5), width: 1),
        ),
        child: Row(
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                color: Color(0XFFAAB5BC),
              ),
            ),
            Spacer(),
            Text(
              _selectedDate == null ? tr('select_date') : _selectedDate,
              style: TextStyle(
                fontSize: 14,
                color: SBlack1,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/dropIcon.png',
              width: 13,
              height: 22,
            ),
          ],
        ),
      ),
      onTap: _showDatePicker,
    );
  }

  void _showDatePicker() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (ctx) {
          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  color: SOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.dateTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd – hh:mm a').format(_chooseDate),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: _chooseDate,
                  minimumDate: DateTime(2001),
                  maximumDate: DateTime(2022),
                  onDateTimeChanged: (date) {
                    setState(() {
                      _chooseDate = date;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: SOrange),
                    child: FlatButton(
                      color: SOrange,
                      textColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tr('add'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateFormat('yyyy-MM-dd – hh:mm a')
                              .format(_chooseDate);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFC7C7C7), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Color(0XFFAAB5BC),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tr('cancel'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
