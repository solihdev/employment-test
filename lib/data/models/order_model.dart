class OrderModel {
  int count;
  int totalPrice;
  String orderId;
  String productId;
  String userId;
  String orderStatus;
  String productName;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.orderStatus,
    required this.productName,
  });

  OrderModel copyWith({
    int? count,
    int? totalPrice,
    String? orderId,
    String? productId,
    String? userId,
    String? orderStatus,
    String? productName,
  }) =>
      OrderModel(
        count: count ?? this.count,
        totalPrice: totalPrice ?? this.totalPrice,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId,
        orderStatus: orderStatus ?? this.orderStatus,
        productName: productName ?? this.productName,
      );

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      count: jsonData['count'] as int? ?? 0,
      totalPrice: jsonData['totalPrice'] as int? ?? 0,
      orderId: jsonData['orderId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      userId: jsonData['userId'] as String? ?? '',
      orderStatus: jsonData['orderStatus'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalPrice': totalPrice,
      'orderId': orderId,
      'productId': productId,
      'userId': userId,
      'orderStatus': orderStatus,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      totalPrice: $totalPrice,
      orderId: $orderId,
      productId: $productId,
      userId: $userId,
      orderStatus: $orderStatus,
      productName: $productName,
      ''';
  }
}
