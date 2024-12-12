import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:trubuy/data/models/category_model.dart';
import 'package:trubuy/data/repository/category_repo.dart';

import '../../models/response_model.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  var categoryRepository = GetIt.I<CategoryRepository>();

  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategoryEvent>(_getCategoryApi);
    on<TapCategoryEvent>(_tabCategory);
  }

  Future<FutureOr<void>> _getCategoryApi(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());
      ResponseModel responseModel = await categoryRepository.getCategoryList();

      emit(CategoryLoaded(categoryList: responseModel.data));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }

  FutureOr<void> _tabCategory(
      TapCategoryEvent event, Emitter<CategoryState> emit) {
    try {
      emit(CategoryLoading());
      for (var cat in event.list) {
        cat.isSelect = false;
      }
      event.list[event.index].isSelect = true;
      emit(CategoryLoaded(categoryList: event.list));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
