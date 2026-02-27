import 'package:flutter/material.dart';
import 'package:news_app_new_version/features/app_section/widgets/custom_bottom_nav_bar.dart';
import 'package:news_app_new_version/features/general/presentation/view/general_screen.dart';
import 'package:news_app_new_version/features/business/presentation/view/business_screen.dart';
import 'package:news_app_new_version/features/technology/presentation/view/tech_screen.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});
  static const routeName = '/app';

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    BusinessScreen(),
    TechScreen(),
    GeneralNews(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
