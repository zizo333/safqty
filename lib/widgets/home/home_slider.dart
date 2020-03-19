import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safqty/providers/home_provider.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  // TODO: Variables
  var _currentIndex = 0;
  var _images = {};
  var _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSlider();
  }

  Future<void> fetchSlider() async {
    try {
      setState(() {
        _loading = true;
      });
      _images = await Provider.of<HomeProvider>(context, listen: false)
          .getSliderImages();
      setState(() {
        _loading = false;
      });
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _images.isEmpty
        ? Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/placeholder.jpg',
                fit: BoxFit.fill,
              ),
            ),
          )
        : Stack(
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
                  items: _images.entries.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          child: ClipRRect(
                            child: Image.network(
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
                    children: _images.entries.map((image) {
                      return Container(
                        width: _currentIndex == image.key ? 12 : 8,
                        height: _currentIndex == image.key ? 12 : 8,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == image.key
                              ? Colors.red
                              : Colors.white,
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
