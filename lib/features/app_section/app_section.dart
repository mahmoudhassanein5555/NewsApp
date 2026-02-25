import 'package:flutter/material.dart';
import 'package:news_app_new_version/features/app_section/widgets/custom_bottom_nav_bar.dart';

import 'package:news_app_new_version/features/home/presentation/view/business_screen.dart';


class App extends StatefulWidget {
  const App({super.key});
  static const routeName = '/app';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    BusinessScreen(),
    // SearchScreen(),
    // WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


