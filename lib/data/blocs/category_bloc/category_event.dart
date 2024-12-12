part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoryEvent extends CategoryEvent {
  const GetCategoryEvent();

  @override
  List<Object?> get props => [];
}

class TapCategoryEvent extends CategoryEvent {
  final List<CategoryModel> list;

  final int index;

  const TapCategoryEvent({required this.list, required this.index});

  @override
  List<Object?> get props => [];
}
