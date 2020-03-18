import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';

class CommissionScreen extends StatelessWidget {
  static const routeName = '/commission-screen';

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
                  spreadRadius: -9)
            ]),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tr('commission_calculation'),
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
            child: Container(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 25, 16, 20),
                children: <Widget>[
                  Text(
                    tr('my_deal_commission'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
                    style: TextStyle(
                      fontSize: 15,
                      color: SBlack1,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    tr('calculate_commission_value'),
                    style: TextStyle(
                      fontSize: 16,
                      color: SBlack1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    tr('sold_price'),
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFFAAB5BC),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 16,
                        color: SBlack,
                      ),
                      cursorColor: SOrange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: tr('price'),
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: SOrange,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        suffixIcon: Container(
                          height: double.infinity,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            'ريال',
                            style: TextStyle(
                              fontSize: 16,
                              color: SBlack,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'ريال فان المبلغ المستحق دفعة هو',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFAAB5BC),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 58,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0XFFF1F3F5)),
                        ),
                        child: Text(
                          '50',
                          style: TextStyle(
                            fontSize: 16,
                            color: SOrange,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ريال',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFFAAB5BC),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
