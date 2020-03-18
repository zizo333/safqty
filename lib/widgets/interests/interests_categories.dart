import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/models/category.dart';

class InterestsCategories extends StatefulWidget {
  final CategoryData category;
  final List<int> selectedCategories;

  InterestsCategories({
    this.category,
    this.selectedCategories,
  });

  @override
  _InterestsCategoriesState createState() => _InterestsCategoriesState();
}

class _InterestsCategoriesState extends State<InterestsCategories> {
  // TODO: Variables
  var _selectedIndex = false;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return InkWell(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: _selectedIndex ? SOrange : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0XFFF1F3F5),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                widget.category.name,
                style: TextStyle(
                  color: _selectedIndex ? Color(0XFFF8F8F8) : Color(0XFFAAB5BC),
                  fontSize: 15,
                  fontWeight:
                      _selectedIndex ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
          _selectedIndex
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: isLandscape ? 30 : 18,
                    height: isLandscape ? 30 : 18,
                    decoration: BoxDecoration(
                      color: Color(0XFFF8F8F8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isLandscape ? 10 : 4),
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      border: Border.all(
                        color: Color(0XFFF1F3F5),
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color: SOrange,
                      size: 15,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      onTap: () {
        widget.selectedCategories.contains(widget.category.id)
            ? widget.selectedCategories.remove(widget.category.id)
            : widget.selectedCategories.add(widget.category.id);
        setState(() {
          _selectedIndex = !_selectedIndex;
        });
      },
    );
  }
}
