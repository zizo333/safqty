import 'package:flutter/material.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/widgets/home/auction_item.dart';

class AuctionGridItems extends StatelessWidget {
  final bool withFavorite;
  final bool smallBottomPadding;
  final bool hasMenu;
  final AuctionType auctionType;

  AuctionGridItems({
    this.withFavorite = true,
    this.smallBottomPadding = false,
    this.hasMenu = false,
    this.auctionType,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GridView.builder(
      physics: hasMenu ? NeverScrollableScrollPhysics() : ScrollPhysics(),
      shrinkWrap: hasMenu ? true : false,
      padding: EdgeInsets.only(bottom: smallBottomPadding ? 20 : 103),
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 4 : 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: isLandscape ? 0.85 : 0.77,
      ),
      itemBuilder: (ctx, index) => AuctionItem(
        index: index,
        withTime: false,
        withFavorite: withFavorite,
        hasMenu: hasMenu,
        auctionType: auctionType,
      ),
    );
  }
}
