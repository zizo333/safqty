import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:safqty/constents/constent.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/models/login.dart';

class LoginProvider with ChangeNotifier {
  String _token = '';
  List<int> _categories = [];

  String get token {
    return _token;
  }

  List<int> get categories {
    return _categories;
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> parameters) async {
    Map<String, dynamic> result = {
      'value': false,
      'msg': '',
      'verified': '',
      'code': '',
      'mobile': '',
      'categories': List<int>(),
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
        saveUserToken(loginData.data.token);
        result['verified'] = loginData.data.verified;
        result['code'] = loginData.data.code;
        result['mobile'] = loginData.data.mobile;
        _categories = loginData.data.userCategories.map((e) => e.id).toList();
        result['categories'] = _categories;
        _token = loginData.data.token;
        await saveDeviceToken(_token);
        await saveUserData(
          loginData.data.name,
          loginData.data.email,
          loginData.data.mobile,
          loginData.data.image,
        );
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

  Future<void> logout() async {
    try {
      final deviceToken = await getDeviceToken();
      final userToken = await getUserToken();
      final response = await http.post(
        LOGOUT_URL,
        body: {'device_token': deviceToken},
        headers: {HttpHeaders.authorizationHeader: 'Bearer $userToken'},
      );
      await removeDeviceToken();
      await removeUserToken();
      await removeUserData();
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, String> parameters, String imagePath) async {
    Map<String, dynamic> result = {
      'value': false,
      'msg': '',
    };
    try {
      final deviceToken = await getDeviceToken();
      final token = await getUserToken();
      parameters['device_type'] = Platform.isAndroid ? 'android' : 'ios';
      parameters['device_token'] = deviceToken;
      final request = http.MultipartRequest('POST', Uri.parse(UPDATE_PROFILE_URL));
      if (imagePath.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', imagePath));
      }
      request.fields.addAll(parameters);
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      final response = await request.send();
      final extractedData = await http.Response.fromStream(response);
      final responseData = json.decode(extractedData.body);
      result['value'] = responseData['value'];
      if(result['value']) {
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
}
