import 'package:adidas/Search_screen.dart';
import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/home_screen.dart';
import 'package:adidas/shopping_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenNavi extends StatefulWidget {
  const HomeScreenNavi({super.key});

  @override
  State<HomeScreenNavi> createState() {
    return _HomeScreenNavi();
  }
}

class _HomeScreenNavi extends State<HomeScreenNavi> {
  int _selectedIndex = 0;

  final Map<int, Map<String, Widget>> _navigationMap = {
    0: {"titel": const Text("Home"), "screen": HomeScreen()},
    1: {"titel": const Text("Search"), "screen": SearchScreen()},
    2: {"titel": const Text("Favorites"), "screen": FavoriteScreen()},
    3: {"titel": const Text("Cart"), "screen": ShoppingScreen()},
    4: {"titel": const Text("AdiClub"), "screen": AdiclubScreen()},
  };

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SHOP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 2.0,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: [
            Container(
              height: 50,
              margin: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  // เพิ่มฟังก์ชันที่ต้องการเมื่อกดปุ่ม
                },
                icon: const Icon(Icons.person_outline),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon:
                    Image.asset("assets/icons/logo.png", width: 30, height: 30),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/adiclub.png",
                    width: 45, height: 45),
                label: ""),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children:
              _navigationMap.values.map((page) => page["screen"]!).toList(),
        ),
      ),
    );
  }
}
