import 'package:flutter/material.dart';
import 'package:islami_app/widgets/Inactive_Icons.dart';
import 'package:islami_app/widgets/active_Icon.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/core/svg_Icons_path.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        type: .fixed,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.whiteColor,
        currentIndex: curentIndex,
        onTap: (value) {
          curentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: 'Quran',
            icon: InactiveIcons(icon: SvgIconsPath.quranIcon),
            activeIcon: ActiveIcon(icon: SvgIconsPath.quranIcon),
          ),
          BottomNavigationBarItem(
            label: 'Hadith',
            icon: InactiveIcons(icon: SvgIconsPath.hadethIcon),
            activeIcon: ActiveIcon(icon: SvgIconsPath.hadethIcon),
          ),
          BottomNavigationBarItem(
            label: 'Sebha',
            icon: InactiveIcons(icon: SvgIconsPath.sebhaIcon),
            activeIcon: ActiveIcon(icon: SvgIconsPath.sebhaIcon),
          ),
          BottomNavigationBarItem(
            label: 'Radio',
            icon: InactiveIcons(icon: SvgIconsPath.radioIcon),
            activeIcon: ActiveIcon(icon: SvgIconsPath.radioIcon),
          ),
          BottomNavigationBarItem(
            label: 'Time',
            icon: InactiveIcons(icon: SvgIconsPath.timeIcon),
            activeIcon: ActiveIcon(icon: SvgIconsPath.timeIcon),
          ),
        ],
      ),
    );
  }
}
