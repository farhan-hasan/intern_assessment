
import 'package:flutter/material.dart';
import 'package:intern_assessment/screens/home_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }



  final List<Widget> _screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
      isLoading ? const Center(child: CircularProgressIndicator(),) :
      Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(

                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper_rounded,
                  size: 20,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.black,
                ),
                label: ''),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          showUnselectedLabels: false,
        ),
      );
  }


}