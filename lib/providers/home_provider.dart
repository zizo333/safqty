import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/models/home.dart';
import 'package:safqty/models/home.dart';
import 'package:safqty/models/home.dart';
import 'package:safqty/models/home.dart';
import 'package:safqty/models/home.dart';

class HomeProvider with ChangeNotifier {
  List<OpenAuctionData> _openAuctionData = [];

  List<OpenAuctionData> get openAuctionData {
    return _openAuctionData;
  }

  Map<int, String> getImageList(List<AuctionImage> images) {
    int index = 0;
    return Map.fromIterable(
      images,
      key: (k) => index++,
      value: (v) => v.image,
    );
  }

  Future<Home> fetchHomeData() async {
    try {
      final response = await http.get(
        HOME_DATA_URL,
        headers: {'Accept-Language': tr('lang')},
      );
      final responseData = json.decode(response.body);
      final homeData = Home.fromJson(responseData);
      _openAuctionData = homeData.data.open;
      notifyListeners();
      return homeData;
    } catch (error) {
      throw error;
    }
  }

  // get slider images
  Future<Map<int, String>> getSliderImages() async {
    try {
      final response = await http.get(
        SLIDER_URL,
        headers: {'Accept-Language': tr('lang')},
      );
      final responseData = AuctionSlider.fromJson(json.decode(response.body));
      return responseData.getImages();
    } catch (error) {
      throw error;
    }
  }
}
