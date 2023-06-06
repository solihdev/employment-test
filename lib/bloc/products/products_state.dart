part of 'products_bloc.dart';

// ignore_for_file: must_be_immutable
class ProductsState extends Equatable {
  final FormStatus status;
  final String error;
  final List<ProductModel> products;

  const ProductsState({
    required this.status,
    required this.error,
    required this.products,
  });

  ProductsState copyWith({
    FormStatus? status,
    String? error,
    List<ProductModel>? products,
  }) {
    return ProductsState(
      error: error ?? this.error,
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, products];
}
