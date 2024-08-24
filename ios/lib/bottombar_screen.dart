import 'package:finalproject/Categorey_screen.dart';
import 'package:finalproject/cart_screen.dart';
import 'package:finalproject/home_screen.dart';
import 'package:finalproject/profile_screen.dart';
import 'package:flutter/material.dart';

class BottombarScreen extends StatefulWidget {
  const BottombarScreen({super.key});

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int currentScreen = 0;
  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 17,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xffDB3022),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentScreen,
          onTap: (value) {
            setState(() {
              currentScreen = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
