import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadith_tap.dart';
import 'package:islami_app/tabs/quran_tap.dart';
import 'package:islami_app/tabs/radio_tap.dart';
import 'package:islami_app/tabs/sebha_tap.dart';
import 'package:islami_app/tabs/time_tap.dart';
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
  List<String> backgroundsNames = ['quran', 'Hadith', 'sebha', 'radio', 'time'];
  List<Widget> taps = [
    QuranTap(),
    HadithTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/${backgroundsNames[curentIndex]}_background.png',
            ),
            fit: .fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: [
                Image.asset('assets/images/img_header.png', fit: .scaleDown),
                Expanded(child: taps[curentIndex]),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
