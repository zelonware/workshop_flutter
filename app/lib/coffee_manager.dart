import 'package:coffee_shop/models/order.dart';
import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/models/user.dart';

class CoffeeManager {
  final User yourUser = User(
      name: 'Your awesome name', mail: 'you@awesome.com', phone: '666-666-66');

  final List<Product> productsInCart = [];
  final List<Order> orders = [];

  int total = 0;

  void addToCart(Product product) {
    productsInCart.add(product);
    calculateTotal();
  }

  void calculateTotal() {
    var prices = productsInCart.map((e) => e.price).toList();
    total = prices.reduce((value, element) => value + element);
  }

  void makeOrder() {
    int howManyProducts = productsInCart.length;

    var newOrder = Order(
        products: howManyProducts,
        total: total,
        orderedAt: DateTime.now());
    orders.add(newOrder);

    clearCart();
  }

  void clearCart() {
    productsInCart.clear();
  }
}
