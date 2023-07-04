import 'package:coffee_shop/main.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text('Products in cart:')),
        if (CoffeeShopApp.manager.productsInCart.isEmpty)
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: const Text('Cart is empty!'),
            ),
          ),
        if (CoffeeShopApp.manager.productsInCart.isNotEmpty)
          Expanded(
              child: ListView.builder(
                  itemCount: CoffeeShopApp.manager.productsInCart.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            const Text('Added: 1 '),
                            Text(CoffeeShopApp
                                .manager.productsInCart[index].name),
                          ],
                        ));
                  })),
        Card(
          color: Colors.transparent,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'TOTAL',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${CoffeeShopApp.manager.total}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () => setState(() {
                      CoffeeShopApp.manager.makeOrder();
                    }),
                child: const Text('PAY')),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () => setState(() {
                      CoffeeShopApp.manager.clearCart();
                    }),
                child: const Text('REMOVE ORDERS'))
          ],
        )
      ],
    );
  }
}
