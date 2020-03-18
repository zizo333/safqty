import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class IntroPages extends StatefulWidget {
  final Function setIndex;

  IntroPages(this.setIndex);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  var _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        _buildPage(
          'assets/images/onboarding1.png',
          0,
          'مزادات مفتوحة للجميع',
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك إلى زيادة عدد الحروف التى يولدها التط .',
          16,
          10,
          10,
        ),
        _buildPage(
          'assets/images/onboarding2.png',
          1,
          'سعيدون دائما بأفضل الاختيارات',
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك إلى زيادة عدد الحروف التى يولدها التط .',
          10,
          16,
          10,
        ),
        _buildPage(
          'assets/images/onboarding3.png',
          2,
          'الاتفاق يتم في سريه تامه',
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك إلى زيادة عدد الحروف التى يولدها التط .',
          10,
          10,
          16,
        ),
      ],
      onPageChanged: (index) {
        widget.setIndex(index);
      },
    );
  }

  Widget _buildPage(String imagePath, int index, String title, String content,
      double radius1, double radius2, double radius3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 4,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildPageControl(0, radius1,
                      radius1 > 10 ? SOrange : SOrange.withOpacity(0.5)),
                  SizedBox(
                    width: 8,
                  ),
                  _buildPageControl(1, radius2,
                      radius2 > 10 ? SOrange : SOrange.withOpacity(0.5)),
                  SizedBox(
                    width: 8,
                  ),
                  _buildPageControl(2, radius3,
                      radius3 > 10 ? SOrange : SOrange.withOpacity(0.5)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                  color: SBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4C4C4C),
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageControl(int index, double radius, Color color) {
    return GestureDetector(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius / 2),
          color: color,
        ),
      ),
      onTap: () {
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      },
    );
  }
}
