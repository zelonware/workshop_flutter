import 'package:coffee_shop/models/order.dart';
import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/models/user.dart';

class CoffeeManager {
  final User user =
      User(name: 'Awesome', mail: 'you@awesome.com', phone: '666-666-66');

  final List<Product> productsInCart = [];
  final List<Order> orders = [];

  int total = 0;

  void addToCart(Product product) {
    productsInCart.add(product);
    calculateTotal();
  }

  void calculateTotal() {
    if (productsInCart.isNotEmpty) {
      var prices = productsInCart.map((e) => e.price).toList();
      total = prices.reduce((value, element) => value + element);
    } else {
      total = 0;
    }
  }

  void makeOrder() {
    if (productsInCart.isNotEmpty) {
      int howManyProducts = productsInCart.length;

      var newOrder = Order(
          products: howManyProducts, total: total, orderedAt: DateTime.now());
      orders.add(newOrder);

      clearCart();
    }
  }

  void clearCart() {
    productsInCart.clear();
    calculateTotal();
  }
}
