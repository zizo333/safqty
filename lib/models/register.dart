import 'dart:io';

class Register {
  bool checkCity = false;
  int flag = 0;
  String mobile;
  String name;
  String password;
  String confirmPassword;
  String email;
  String deviceToken;
  String deviceType;
  String cityId = '';
  String image = '';

  Map<String, String> getRegisterData() {
    return {
      'mobile': mobile,
      'name': name,
      'password': password,
      'password_confirmation': confirmPassword,
      'email': email,
      'device_token': '11111',
      'device_type': Platform.isAndroid ? 'android' : 'ios',
      'city_id': cityId,
    };
  }
}
