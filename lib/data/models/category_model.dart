// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool? isSelect;
  String type;
  String categoryId;
  String categoryName;
  IconData? icon;

  CategoryModel({
    required this.isSelect,
    required this.type,
    required this.categoryId,
    required this.icon,
    required this.categoryName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        isSelect: json["isSelect"] ?? false,
        type: json["type"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        icon: null,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "isSelect": isSelect,
        "category_id": categoryId,
        "category_name": categoryName,
        "icon": icon,
      };
}
