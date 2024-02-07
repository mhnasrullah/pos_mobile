import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';
import 'package:pos_mobile/widget/appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Text('Home'),
    const Text('Cart'),
    const Text('Profile'),
  ];

  final List<NavigationDestination> _destinations = <NavigationDestination>[
    const NavigationDestination(
      icon: Icon(Icons.home, color: blackColor),
      label: 'Report',
    ),
    const NavigationDestination(
      icon: Icon(Icons.shopping_cart, color: blackColor),
      label: 'Catalog',
    ),
    const NavigationDestination(
      icon: Icon(Icons.person, color: blackColor),
      label: 'Setting',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: bgColor,
      bottomNavigationBar: NavigationBar(
          destinations: _destinations,
          onDestinationSelected: _onItemTapped,
          selectedIndex: _selectedIndex,
          indicatorColor: Colors.transparent,
          backgroundColor: bgColor,
          surfaceTintColor: Colors.transparent,
          overlayColor:
              const MaterialStatePropertyAll<Color>(Colors.transparent)),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
