part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  final Map<String, dynamic> map;

  const GetProductEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
