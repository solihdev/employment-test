class OrderModel {
  int count;
  int totalPrice;
  String orderName;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.orderName,
  });

  OrderModel copyWith({
    int? count,
    int? totalPrice,
    String? orderName,
  }) =>
      OrderModel(
        count: count ?? this.count,
        totalPrice: totalPrice ?? this.totalPrice,
        orderName: orderName ?? this.orderName,
      );

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      count: jsonData['count'] as int? ?? 0,
      totalPrice: jsonData['totalPrice'] as int? ?? 0,
      orderName: jsonData['orderName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalPrice': totalPrice,
      'orderName': orderName,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      totalPrice: $totalPrice,
      orderName: $orderName,
      ''';
  }
}
