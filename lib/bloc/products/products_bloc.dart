import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/data/models/product_model.dart';
import 'package:employment_test/data/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productRepository})
      : super(
          const ProductsState(status: FormStatus.pure, error: "", products: []),
        ) {
    on<FetchProducts>(_fetchProducts);
  }

  ProductRepository productRepository;

  _fetchProducts(FetchProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: FormStatus.gettingProductsLoad));
    try {
      await for (var product in productRepository.getProducts()) {
        emit(state.copyWith(status: FormStatus.gettingProductsSuccess, products: product));
      }
    } catch (e) {
      emit(state.copyWith(error: state.error, status: FormStatus.gettingProductsFail));
    }
  }
}
