import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:trubuy/data/repository/category_repo.dart';
import 'package:trubuy/data/repository/plan_repo.dart';
import 'package:trubuy/data/repository/product_repo.dart';
typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await GetIt.I.allReady();

    GetIt.I.registerSingleton<ProductRepository>(ProductRepositoryImp());
    GetIt.I.registerSingleton<CategoryRepository>(CategoryRepositoryImp());
    GetIt.I.registerSingleton<PlanRepository>(PlanRepositoryImp());
    GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  }
}