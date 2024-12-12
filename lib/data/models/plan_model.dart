// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Datum> data;

  ProductModel({
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  bool? isSelect;
  String title;
  int price;
  int duration;
  List<Feature> features;

  Datum({
    required this.isSelect,
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    isSelect: json["isSelect"]??false,
    title: json["title"],
    price: json["price"],
    duration: json["duration"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSelect": isSelect,
    "title": title,
    "price": price,
    "duration": duration,
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

class Feature {
  String key;
  String value;

  Feature({
    required this.key,
    required this.value,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}
