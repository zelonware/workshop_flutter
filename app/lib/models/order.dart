import 'package:coffee_shop/models/product.dart';

class Order {
  Order({required this.products, required this.total, required this.orderedAt});

  final int products;
  final int total;
  final DateTime orderedAt;
}
