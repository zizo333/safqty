import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryData> _categories = [];

  List<CategoryData> get items {
    return _categories;
  }

  Future<void> fetchAllCategories() async {
    try {
      final response = await http
          .get(CATEGORIES_URL, headers: {'Accept-Language': tr('lang')});
      final responseDate = MyCategory.fromJson(jsonDecode(response.body));
      _categories = responseDate.data;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> addInterestedCategories(
      List<int> interestsList, String token) async {
    Map<String, dynamic> result = {
      'value': false,
      'msg': '',
    };
    String parameter = interestsList.join(',');
    try {
      final response = await http.post(
        INTERESTS_URL,
        body: {'interests': parameter},
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final responseData = jsonDecode(response.body);
      result['value'] = responseData['value'];
      if (responseData['value']) {
        result['msg'] = responseData['data'];
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }
}
