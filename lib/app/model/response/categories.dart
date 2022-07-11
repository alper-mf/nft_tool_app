import 'package:nft_tool_app/app/model/abstract_base_model.dart';

class CategoriesModel extends IBaseModel<CategoriesModel> {
  CategoriesModel({
    this.categories,
  });

  List<Category>? categories;

  factory CategoriesModel.fromMap(Map<String, dynamic> json) => CategoriesModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toMap())),
      };

  @override
  CategoriesModel fromJson(Map json) => CategoriesModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
      );
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
