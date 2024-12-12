part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categoryList;

  CategoryLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

final class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});

  @override
  List<Object> get props => [error];
}
