import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:safqty/constents/colors.dart';

class PriceLimit extends StatefulWidget {
  @override
  _PriceLimitState createState() => _PriceLimitState();
}

class _PriceLimitState extends State<PriceLimit> {
  // TODO: Variables
  var _minPrice = '300';
  var _maxPrice = '5000';
  var _priceStyle = TextStyle(color: Color(0XFFAAB5BC), fontSize: 17);
  var _textStyle = TextStyle(color: Color(0XFFAAB5BC), fontSize: 13);
  var _lowerValue = 1000.0;
  var _upperValue = 3000.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _minPrice,
              style: _priceStyle,
            ),
            Text(
              _maxPrice,
              style: _priceStyle,
            ),
          ],
        ),
        FlutterSlider(
          rtl: true,
          minimumDistance: 100,
          values: [_lowerValue, _upperValue],
          rangeSlider: true,
          min: double.parse(_minPrice),
          max: double.parse(_maxPrice),
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: SOrange,
            ),
          ),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: CircleAvatar(
              backgroundColor: SOrange,
              radius: 10,
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: CircleAvatar(
              backgroundColor: SOrange,
              radius: 10,
            ),
          ),
          handlerHeight: 35,
          handlerWidth: 35,
          tooltip: FlutterSliderTooltip(
            alwaysShowTooltip: true,
            boxStyle: FlutterSliderTooltipBox(
              decoration: BoxDecoration(
                color: SOrange,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            textStyle: TextStyle(fontSize: 14, color: Colors.white),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            _lowerValue = lowerValue;
            _upperValue = upperValue;
            setState(() {});
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              tr('min'),
              style: _textStyle,
            ),
            Text(
              tr('max'),
              style: _textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
