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