import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/models/city.dart';

class CityProvider with ChangeNotifier {
  List<CityData> _cityList = [];

  List<CityData> get items {
    return _cityList;
  }

  Future<void> fetchCities() async {
    try {
      final response =
          await http.get(CITY_URL, headers: {'Accept-Language': tr('lang')});
      final responseData = json.decode(response.body);
      final cities = City.fromJson(responseData);
      _cityList = cities.data;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
