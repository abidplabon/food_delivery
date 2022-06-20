import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/account/account_page.dart';
import 'package:food_delivery/pages/home/auth/sign_up_page.dart';
import 'package:food_delivery/pages/home/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';

import 'auth/sign_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(child: Text("History page"),),
    //SignInPage(),
    CartHistory(),
    AccountPage(),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"
              //title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label:"History"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart"
            //title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Me"
            //title: Text("Home")
          ),
        ],
      ),
    );
  }
}
