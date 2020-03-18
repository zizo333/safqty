import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/widgets/support/support_form.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = '/support-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 9),
                blurRadius: 8,
                spreadRadius: -9,
              )
            ]),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tr('support'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.fromLTRB(20, 25, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          'assets/images/support_image.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12,
                        ),
                        _buildContactWidget(
                            'assets/images/call.png', '01123456789'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildContactWidget(
                            'assets/images/pin.png', 'safqty@gmail.com'),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      tr('send_message_to_support'),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SupportForm(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: Helper functions
  Widget _buildContactWidget(String imagePath, String content) {
    return Row(
      children: <Widget>[
        Container(
          height: 32,
          width: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: 13,
            color: SBlack,
          ),
        )
      ],
    );
  }
}
