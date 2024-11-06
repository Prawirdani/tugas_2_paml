import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/core/navigator.dart';
import 'package:tugas_2_paml/presentation/main/screens/home_screen.dart';
import 'package:tugas_2_paml/presentation/main/screens/setting_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.account_circle_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined,
                      color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () =>
                      AppNavigator.push(context, const SettingScreen()),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          Center(
            child: Text('Account'),
          ),
          Center(
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
