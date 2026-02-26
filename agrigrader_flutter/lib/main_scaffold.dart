import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:agrigrader_flutter/theme.dart';
import 'package:agrigrader_flutter/screens/home_screen.dart';
import 'package:agrigrader_flutter/screens/dashboard_screen.dart';
import 'package:agrigrader_flutter/screens/notifications_screen.dart';
import 'package:agrigrader_flutter/screens/camera_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DashboardScreen(),
    const NotificationsScreen(),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      floatingActionButton:
          _selectedIndex ==
              1 // Only show on Dashboard
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
              backgroundColor: AppColors.textMain,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(LucideIcons.camera),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bell),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
