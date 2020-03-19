import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/models/home.dart';

class HomeProvider with ChangeNotifier {

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
