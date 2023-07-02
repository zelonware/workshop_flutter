import 'package:coffee_shop/pages/cart.dart';
import 'package:coffee_shop/pages/catalog.dart';
import 'package:coffee_shop/pages/profile.dart';
import 'package:flutter/material.dart';
import 'coffee_manager.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var manager = CoffeeManager();
  int index = 0;

  Widget navigateToPage() {
    switch (index) {
      case 0:
        return const CatalogPage();
      case 1:
        return const CartPage();
      case 2:
        return const ProfilePage();

      default:
        return const CatalogPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Catalog'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          ],
          onTap: (i) {
            setState(() {
              index = i;
            });
          }),
      body: navigateToPage()
    );
  }
}
