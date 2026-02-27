import 'package:flutter/material.dart';
import 'package:news_app_new_version/core/constans/app_assets/app_icon_assets.dart';
import 'package:news_app_new_version/core/constans/app_colors.dart';
import 'package:news_app_new_version/core/constans/app_strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: (MediaQuery.of(context).size.width / 3) * currentIndex,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 152, 158, 157),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                selectedIconPath: AppIcons.businessIcon,
                label: AppStrings.business,
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
                icon: Icon(Icons.business, size: 40),
              ),
              _NavItem(
                selectedIconPath: AppIcons.businessIcon,
                label: AppStrings.tech,
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
                icon: Icon(Icons.devices, size: 40),
              ),
              _NavItem(
                selectedIconPath: AppIcons.businessIcon,
                label: AppStrings.general,
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
                icon: Icon(Icons.newspaper_rounded, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.selectedIconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });
  final String selectedIconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? const Color.fromARGB(255, 97, 104, 108)
        : AppColors.greyColor;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: icon,
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                // fontFamily: AppStrings.fontPoppins,
              ),
              child: Text(label, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
