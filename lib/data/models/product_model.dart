class ProductModel {
  int count;
  int price;
  String productId;
  String productName;
  String description;
  String currency;

  ProductModel({
    required this.count,
    required this.price,
    required this.productId,
    required this.productName,
    required this.description,
    required this.currency,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      count: jsonData['count'] as int? ?? 0,
      price: jsonData['price'] as int? ?? 0,
      productId: jsonData['productId'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      currency: jsonData['currency'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'price': price,
      'productId': productId,
      'productName': productName,
      'description': description,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      price: $price,
      productId: $productId,
      productName: $productName,
      description: $description,
      currency: $currency
      ''';
  }
}
