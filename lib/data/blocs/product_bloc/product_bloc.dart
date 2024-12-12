import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:trubuy/data/models/product_model.dart';
import 'package:trubuy/data/repository/product_repo.dart';

import '../../../models/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  var productRepository = GetIt.I<ProductRepository>();

  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_getProductListApi);
  }

  Future<FutureOr<void>> _getProductListApi(
      GetProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      var res = await productRepository.getProductList(map: event.map);
      ProductModel model = ProductModel.fromJson(res.data);
      emit(ProductLoaded(productList: model.products));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}
