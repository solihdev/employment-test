part of 'orders_bloc.dart';

// ignore_for_file: must_be_immutable
class OrdersState extends Equatable {
  final FormStatus status;
  final String error;
  final List<OrderModel> orders;

  const OrdersState({
    required this.status,
    required this.error,
    required this.orders,
  });

  OrdersState copyWith({
    FormStatus? status,
    String? error,
    List<OrderModel>? orders,
  }) {
    return OrdersState(
      error: error ?? this.error,
      orders: orders ?? this.orders,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, orders];
}
