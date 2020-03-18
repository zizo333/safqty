class City {
  final bool value;
  final List<CityData> data;
  final int code;

  City({this.value, this.data, this.code});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      value: json['value'],
      data: (json['data'] as List).map((e) => CityData.fromJson(e)).toList(),
      code: json['code'],
    );
  }
}

class CityData {
  final int id;
  final String name;

  CityData({this.id, this.name});

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json['id'],
      name: json['name'],
    );
  }
}
