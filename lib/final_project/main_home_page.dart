import 'package:flutter/material.dart';


import 'NavBar.dart';
import 'bottom_navigation/accountScreen.dart';
import 'bottom_navigation/cartScreen.dart';
import 'bottom_navigation/main_app_screen.dart';
import 'bottom_navigation/storeScreen.dart';



class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  void openSideMenu(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  int _currentIndex = 0;
  List<Widget> screens = [
    const MainAppScreen(),
    const storeScreen(),
    const cartScreen(),
    const accountScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          }),
          elevation: 0,

          backgroundColor: const Color(0xff35B700),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: const Color(0xff35B700),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: const TextStyle(color: Colors.black))),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xff35B700),
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                  color: Colors.black,
                ),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                label: 'Account',
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xfFE9EBEA),
        body: screens[_currentIndex],
       );
  }
}
