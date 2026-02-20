import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}
class _MainLayoutState extends State<MainLayout> {
  int index = 0;
  final screens = const [
    HomeScreen(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}