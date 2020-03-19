import 'package:safqty/models/category.dart';

class Login {
  final bool value;
  final LoginData data;
  final int code;

  Login({
    this.value,
    this.data,
    this.code,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      value: json['value'],
      data: LoginData.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class LoginData {
  final int id;
  final String name;
  final String email;
  final String image;
  final String mobile;
  final String status;
  final String code;
  final String verified;
  final int cityId;
  final List<CategoryData> userCategories;
  final String token;

  LoginData({
    this.id,
    this.name,
    this.email,
    this.image,
    this.mobile,
    this.status,
    this.code,
    this.verified,
    this.cityId,
    this.userCategories,
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      mobile: json['mobile'],
      status: json['status'],
      code: json['code'].toString(),
      verified: json['verified'],
      cityId: json['city_id'],
      userCategories: (json['user_categories'] as List)
          .map((e) => CategoryData.fromJson(e))
          .toList(),
      token: json['token'],
    );
  }
}
