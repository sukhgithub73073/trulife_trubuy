part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductLoaded extends ProductState {
  final List<Product> productList;

  ProductLoaded({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}

final class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});

  @override
  List<Object> get props => [error];
}
