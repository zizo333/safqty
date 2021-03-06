import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:safqty/constents/constent.dart';
import 'package:safqty/constents/helper.dart';

class RegisterProvider with ChangeNotifier {
  var _mobile = '';
  var _token = '';
  var _id = '';

  String get token {
    return _token;
  }

  Future<Map<String, dynamic>> register(
      Map<String, String> parameters, String imagePath) async {
    Map<String, dynamic> result = {'value': '', 'msg': '', 'mobile': ''};
    try {
      var request = http.MultipartRequest('POST', Uri.parse(REGISTER_URL));
      if (imagePath.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath('image', imagePath));
      }
      request.fields.addAll(parameters);
      final response = await request.send();
      final extractedData = await http.Response.fromStream(response);
      final responseData = json.decode(extractedData.body);
      result['value'] = responseData['value'];
      if (result['value']) {
        result['msg'] = '${responseData['data']['code']}';
        result['mobile'] = parameters['mobile'];
        _token = responseData['data']['token'].toString();
        await saveUserData(
          responseData['data']['name'],
          responseData['data']['email'],
          responseData['data']['mobile'],
          responseData['data']['image'],
        );
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }

  /*
  Future<Map<String, dynamic>> register(
    Map<String, String> parameters,
    File userImage,
  ) async {
    Map<String, dynamic> result = {'value': '', 'msg': '', 'mobile': ''};
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
        await saveUserData(
          responseData['data']['name'],
          responseData['data']['email'],
          responseData['data']['mobile'],
          responseData['data']['image'],
        );
        return result;
      } else {
        result['msg'] = responseData['msg'];
        return result;
      }
    } catch (error) {
      throw error;
    }
  }
   */

  Future<Map<String, dynamic>> verifyAccount(
      {String code, String mobile}) async {
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
        saveUserToken(_token);
      } else {
        result['msg'] = responseData['msg'];
      }
      return result;
    } catch (error) {
      throw error;
    }
  }
}
