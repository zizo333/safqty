import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class TermsScreen extends StatelessWidget {
  static const routeName = '/terms-screen';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  child: Image.asset(
                    'assets/images/backwhite.png',
                    width: 25,
                    height: 26,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 140,
                  height: 200,
                  child: Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: deviceSize.height - 356,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(50, 26, 50, 20),
                    children: <Widget>[
                      Text(
                        tr('terms_of_use'),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: SBlack1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
                        style: TextStyle(
                          fontSize: 15,
                          color: SBlack1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
                        style: TextStyle(
                          fontSize: 15,
                          color: SBlack1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Positioned(
                    top: 330,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  )
 */
