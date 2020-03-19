import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:safqty/constents/keywords.dart';

enum ActivationType {
  forgotPassword,
  register,
  mobileNumber,
}

enum AuthAction {
  register,
  login,
}

bool isPasswordChanged = false;

Future<String> getDeviceToken() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  var token = '';
  await firebaseMessaging.getToken().then((value) => token = value);
  return token;
}

Future<bool> saveDeviceToken(String deviceToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = await prefs.setString(DEVICE_TOKEN, deviceToken);
  return result;
}

Future<String> checkDeviceToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = prefs.getString(DEVICE_TOKEN);
  return result;
}

Future<bool> removeDeviceToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = await prefs.remove(DEVICE_TOKEN);
  return result;
}

Future<bool> saveUserToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = await prefs.setString(USER_TOKEN, token);
  return result;
}

Future<String> getUserToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = prefs.getString(USER_TOKEN);
  return result;
}

Future<bool> removeUserToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = await prefs.remove(USER_TOKEN);
  return result;
}

Future<void> saveUserData(
  String name,
  String email,
  String mobile,
  String imageUrl,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(USER_NAME, name);
  await prefs.setString(USER_EMAIL, email);
  await prefs.setString(USER_MOBILE, mobile);
  await prefs.setString(USER_IMAGE, imageUrl);
}

Future<Map<String, String>> getUserData() async {
  Map<String, String> result = {
    'name': '',
    'email': '',
    'mobile': '',
    'image': '',
    'device_type': Platform.isAndroid ? 'android' : 'ios',
  };
  SharedPreferences prefs = await SharedPreferences.getInstance();
  result['name'] = prefs.getString(USER_NAME);
  result['email'] = prefs.getString(USER_EMAIL);
  result['mobile'] = prefs.getString(USER_MOBILE);
  result['image'] = prefs.getString(USER_IMAGE);
  return result;
}

Future<void> removeUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(USER_NAME);
  await prefs.remove(USER_EMAIL);
  await prefs.remove(USER_MOBILE);
  await prefs.remove(USER_IMAGE);
}
