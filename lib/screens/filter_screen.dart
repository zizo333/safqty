import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/auction_common/auction_grid_items.dart';
import 'package:safqty/widgets/filter/filter_options.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with TickerProviderStateMixin {
  // TODO: Variables
  TabController _topController;
  TabController _bottomController;
  List<String> _topItems = [
    tr('electronics'),
    tr('electronics'),
    tr('electronics'),
    tr('electronics'),
    tr('electronics'),
  ];
  List<String> _bottomItems = [
    tr('computer'),
    tr('computer'),
    tr('computer'),
    tr('computer'),
    tr('computer'),
    tr('computer'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topController =
        TabController(initialIndex: 1, vsync: this, length: _topItems.length);
    _bottomController = TabController(
        initialIndex: 0, vsync: this, length: _bottomItems.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _topController.dispose();
    _bottomController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final deviceSize = MediaQuery.of(context).size;
    final args = ModalRoute.of(context).settings.arguments as List;
    final title = args[0] as String;
    final auctionType = args[1] as AuctionType;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            Expanded(
              child: AppBar(
                backgroundColor: Color(0XFFFCFCFC),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  title ?? 'مزادات',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF434A51),
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color(0XFF434A51),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      child: Image.asset(
                        'assets/images/filter.png',
                        width: 26,
                        height: 26,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (ctx) => FilterOptions(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0XFFFCFCFC),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: TabBar(
                    isScrollable: true,
                    controller: _topController,
                    labelColor: SOrange,
                    unselectedLabelColor: Color(0XFFCED4DA),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: SOrange,
                    tabs: _topItems
                        .map(
                          (tab) => Container(
                            height: 50,
                            width: isLandscape
                                ? (_topItems.length * 80 > deviceSize.width
                                    ? 80
                                    : deviceSize.width / _topItems.length)
                                : 80,
                            alignment: Alignment.center,
                            child: Text(
                              tab,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                        .toList(),
                    onTap: (item) {},
                  ),
                ),
                Container(
                  child: TabBar(
                    isScrollable: true,
                    controller: _bottomController,
                    labelColor: SOrange,
                    unselectedLabelColor: Color(0XFFCED4DA),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: SOrange,
                    tabs: _bottomItems
                        .map(
                          (tab) => Container(
                            height: 50,
                            width: isLandscape
                                ? (_bottomItems.length * 80 > deviceSize.width
                                    ? 80
                                    : deviceSize.width / _bottomItems.length)
                                : 80,
                            alignment: Alignment.center,
                            child: Text(
                              tab,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                        .toList(),
                    onTap: (item) {},
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                    ),
                    color: Color(0XFFF8F8FA),
                    child: AuctionGridItems(
                      withFavorite: false,
                      smallBottomPadding: true,
                      auctionType: auctionType,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
