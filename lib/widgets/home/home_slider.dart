import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  // TODO: Variables
  final Map<int, String> _imageList = {
    0: 'assets/images/slider_image.png',
    1: 'assets/images/slider_image.png',
    2: 'assets/images/slider_image.png',
    3: 'assets/images/slider_image.png',
  };

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(
            height: 150,
            viewportFraction: 1.0,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: _imageList.entries.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: ClipRRect(
                      child: Image.asset(
                        image.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _imageList.entries.map((image) {
                return Container(
                  width: _currentIndex == image.key ? 12 : 8,
                  height: _currentIndex == image.key ? 12 : 8,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == image.key ? Colors.red : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
