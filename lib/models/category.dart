class MyCategory {
  final bool value;
  final List<CategoryData> data;
  final int code;

  MyCategory({this.value, this.data, this.code});

  factory MyCategory.fromJson(Map<String, dynamic> json) {
    return MyCategory(
      value: json['value'],
      data:
          (json['data'] as List).map((e) => CategoryData.fromJson(e)).toList(),
      code: json['code'],
    );
  }
}

class CategoryData {
  final int id;
  final String name;

  CategoryData({this.id, this.name});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
    );
  }
}
