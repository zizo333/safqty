import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:safqty/constents/constent.dart';

class RegisterProvider with ChangeNotifier {
  var _mobile = '';
  var _token = '';
  var _id = '';

  String get token {
    return _token;
  }

  Future<Map<String, dynamic>> register(
    Map<String, String> parameters,
    File userImage,
  ) async {
    Map<String, dynamic> result = {
      'value': '',
      'msg': '',
      'mobile' : ''
    };
    try {
      final response = await http.post(
        REGISTER_URL,
        body: parameters,
        headers: {
          'Accept-Language': tr('lang'),
        },
      );
      final responseData = jsonDecode(response.body);
      result['value'] = responseData['value'];
      if (responseData['value']) {
        result['msg'] = '${responseData['data']['code']}';
        result['mobile'] = parameters['mobile'];
        _token = responseData['data']['token'].toString();
        return result;
      } else {
        result['msg'] = responseData['msg'];
        return result;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> verifyAccount({String code, String mobile}) async {
    Map<String, dynamic> result = {
      'value': '',
      'msg': '',
    };
    try {
      final response = await http.post(ACTIVATE_URL, body: {
        'mobile': mobile,
        'code': code,
      });
      final responseData = jsonDecode(response.body);
      result['value'] = responseData['value'];
      if (responseData['value']) {
        _token = responseData['data']['token'];
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }
}
