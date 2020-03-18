import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/models/login.dart';

class LoginProvider with ChangeNotifier {
  String _token = '';

  String get token {
    return _token;
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> parameters) async {
    Map<String, dynamic> result = {
      'value': false,
      'msg': '',
      'verified': '',
      'code': '',
      'mobile': ''
    };
    try {
      final response = await http.post(
        LOGIN_URL,
        body: parameters,
        headers: {'Accept-Language': tr('lang')},
      );
      final responseData = json.decode(response.body);
      result['value'] = responseData['value'];
      if (responseData['value']) {
        final loginData = Login.fromJson(responseData);
        result['verified'] = loginData.data.verified;
        result['code'] = loginData.data.code;
        result['mobile'] = loginData.data.mobile;
        _token = loginData.data.token;
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }

  // forget password
  Future<Map<String, dynamic>> checkMobileNumber(String mobile) async {
    Map<String, dynamic> result = {'value': false, 'msg': '', 'mobile': ''};
    try {
      final response =
          await http.post(FORGET_PASSWORD_URL, body: {'mobile': mobile});
      final responseData = jsonDecode(response.body);
      result['value'] = responseData['value'];
      if (responseData['value']) {
        result['mobile'] = mobile;
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> changePassword(
      Map<String, String> parameters) async {
    Map<String, dynamic> result = {
      'value': false,
      'msg': '',
    };
    try {
      final response = await http.post(CHANGE_PASSWORD_URL, body: parameters);
      final responseData = jsonDecode(response.body);
      result['value'] = responseData['value'];
      if (!responseData['value']) {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }
}
