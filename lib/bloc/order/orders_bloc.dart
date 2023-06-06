import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/data/models/order_model.dart';
import 'package:employment_test/data/repositories/order_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc({required this.ordersRepository})
      : super(
          const OrdersState(status: FormStatus.pure, error: "", orders: []),
        ) {
    on<FetchOrders>(_fetchOrders);
    on<AddOrders>(_addOrder);
  }

  OrdersRepository ordersRepository;

  _fetchOrders(FetchOrders event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(status: FormStatus.gettingOrdersLoad));
    try {
      await for (var order in ordersRepository.getOrders()) {
        emit(state.copyWith(
            status: FormStatus.gettingOrdersSuccess, orders: order));
      }
    } catch (e) {
      emit(state.copyWith(
          error: state.error, status: FormStatus.gettingOrdersFail));
    }
  }

  _addOrder(AddOrders event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(status: FormStatus.insertingOrdersLoad));
    try {
      await ordersRepository.addOrder(orderModel: event.orderModel);
      emit(state.copyWith(status: FormStatus.insertingOrdersSuccess));
    } catch (error) {
      emit(state.copyWith(
          error: state.error, status: FormStatus.insertingOrdersFail));
    }
  }
}
