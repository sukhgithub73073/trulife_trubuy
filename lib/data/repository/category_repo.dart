import 'package:flutter/material.dart';
import 'package:trubuy/data/models/category_model.dart';
import 'package:trubuy/data/models/response_model.dart';

abstract class CategoryRepository {
  Future<ResponseModel> getCategoryList();
}

class CategoryRepositoryImp extends CategoryRepository {
  @override
  Future<ResponseModel> getCategoryList() async {
    List<CategoryModel> list = [
      // CategoryModel(icon:Icons.border_all , type: "shirt", isSelect: true, categoryId: "1", categoryName: "All Categories",),
      CategoryModel(icon:Icons.grain ,type: "shirt", isSelect: true, categoryId: "1", categoryName: "Agriculture Parts & Seeds"),
      CategoryModel(icon:Icons.book ,type: "Book", isSelect: false, categoryId: "1", categoryName: "Books Stationery & Sports"),
      CategoryModel(icon:Icons.directions_car ,type: "car", isSelect: false, categoryId: "1", categoryName: "Car Auto Bike Parts & Lubricant"),
      CategoryModel(icon:Icons.chair_rounded ,type: "chair", isSelect: false, categoryId: "1", categoryName: "Decoration Furniture & Building"),
      CategoryModel(icon:Icons.electrical_services ,type: "galaxy", isSelect: false, categoryId: "1", categoryName: "Electronic Mobile TV Technology"),
      CategoryModel(icon:Icons.checkroom ,type: "fashion", isSelect: false, categoryId: "1", categoryName: "Fashion Garments & Footwear"),
      CategoryModel(icon:Icons.local_grocery_store ,type: "Honey", isSelect: false, categoryId: "1", categoryName: "Grocery Food Fruit & Vegetable"),
      CategoryModel(icon:Icons.health_and_safety ,type: "health", isSelect: false, categoryId: "1", categoryName: "Health & Beauty Cosmetics"),
      CategoryModel(icon:Icons.kitchen ,type: "Kitchen", isSelect: false, categoryId: "1", categoryName: "Home Garden & Kitchen"),
    ];
    return ResponseModel(message: "", errors: "", data: list, status: "");
  }
}
