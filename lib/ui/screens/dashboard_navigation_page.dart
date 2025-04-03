import 'package:flutter/material.dart';

import 'home_screen.dart';

class DashboardNavigationPage extends StatefulWidget {

  @override
  State<DashboardNavigationPage> createState() =>
      _DashboardNavigationPageState();
}

class _DashboardNavigationPageState extends State<DashboardNavigationPage> {
  int selectedIndex = 0;

  List<Widget> mNavScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: mNavScreens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {
              selectedIndex = 0;
              setState(() {

              });
            }, icon: Icon(Icons.menu, color: Colors.grey,)),
            IconButton(onPressed: () {
              selectedIndex = 1;
              setState(() {

              });
            },
                icon: Icon(Icons.favorite_border, color: Colors.grey,)),

            SizedBox(width: 7),
            SizedBox(width: 7),
            IconButton(onPressed: () {
              selectedIndex = 2;
              setState(() {

              });
            },
                icon: Icon(
                  Icons.add_shopping_cart_outlined, color: Colors.grey,)),
            IconButton(onPressed: () {
              selectedIndex = 3;
              setState(() {

              });
            },
                icon: Icon(Icons.account_circle_outlined, color: Colors.grey,)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: (){

      }, child: Icon(Icons.home_outlined),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
