part of 'orders_bloc.dart';

abstract class OrdersEvent {}

class FetchOrders extends OrdersEvent {}

class AddOrders extends OrdersEvent {
  final OrderModel orderModel;

  AddOrders({required this.orderModel});
}
