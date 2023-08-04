import 'package:coffee_shop/pages/orders.dart';
import 'package:coffee_shop/main.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(
                  'https://jkpsports.com/wp-content/uploads/2019/11/profile-image-placeholder1.png'),
            ),
          ),
          Text(CoffeeShopApp.manager.user.name),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Mail'),
                Text(CoffeeShopApp.manager.user.mail)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Phone'),
                Text(CoffeeShopApp.manager.user.phone)
              ],
            ),
          ),
          if (CoffeeShopApp.manager.orders.isNotEmpty)
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrdersPage(
                              orders: CoffeeShopApp.manager.orders)));
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                ),
                child: const Text('All orders'))
        ]);
  }
}
