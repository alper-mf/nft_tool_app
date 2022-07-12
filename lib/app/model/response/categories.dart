import 'package:background_json_parser/background_json_parser.dart';

class CategoriesModel extends IBaseModel<CategoriesModel> {
  CategoriesModel({
    this.categories,
  });

  List<Category>? categories;

  @override
  CategoriesModel fromJson(Map json) => CategoriesModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class Category {
  Category({
    this.categoryName,
  });

  String? categoryName;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toMap() => {
        "category_name": categoryName,
      };
}
