import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/add_auction/auction_date.dart';
import 'package:safqty/widgets/add_auction/auction_style.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class ContinueAddAuction extends StatefulWidget {
  static final routeName = '/continue-add-auction-screen';

  @override
  _ContinueAddAuctionState createState() => _ContinueAddAuctionState();
}

class _ContinueAddAuctionState extends State<ContinueAddAuction> {
  GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final data = Localizations.localeOf(context).languageCode;
    final auctionType =
        ModalRoute.of(context).settings.arguments as AuctionType ??
            AuctionType.OpenAuction;
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
                    tr('add_an_open_auction'),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: SBlack1,
                    ),
                  ),
                ),
                Align(
                  alignment: data == 'en' ? Alignment.bottomLeft : Alignment.bottomRight,
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
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    auctionType == AuctionType.TimeAuctions
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LoginRegisterStyle.titleStyle(
                                  tr('follow_us_to_confirm_data')),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                tr('please_enter_the_rest_of_the_data'),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0XFFAAB5BC),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                tr('auction_start_date'),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: SBlack,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              AuctionDate(tr('auction_start_date'), 'بداية السوم'),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                tr('auction_end_date'),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: SBlack,
                                ),
                              ),
                              SizedBox(height: 12,),
                              AuctionDate(tr('auction_end_date'), 'نهاية السوم'),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          )
                        : Container(),
                    LoginRegisterStyle.titleStyle(tr('average_price')),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      tr('specify_auction'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFFAAB5BC),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 16),
                                    cursorColor: SOrange,
                                    decoration:
                                        AuctionStyle.textFieldDecoration(
                                      hintText: 'بداية السوم',
                                      tailText: 'ريال',
                                    ),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 16),
                                    cursorColor: SOrange,
                                    decoration:
                                        AuctionStyle.textFieldDecoration(
                                      hintText: ' الحد',
                                      tailText: 'ريال',
                                    ),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          LoginRegisterStyle.titleStyle(tr('quantity')),
                          SizedBox(
                            height: 11,
                          ),
                          Text(
                            tr('specify_quantity'),
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFFAAB5BC),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              cursorColor: SOrange,
                              decoration: AuctionStyle.textFieldDecoration(
                                hintText: ' عدد الكمية المتاحة',
                                tailText: 'منتج',
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          LoginRegisterStyle.buildButton(tr('confirm'), _submit)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submit() {}
}
