import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/screens/onboarding_Item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routName = '/onboardingScreen';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> onboardingScreens = [
      OnboardingItem(
        image: AppImages.onboardingFrame1,
        title: 'Welcome To Islmi App',
      ),
      OnboardingItem(
        image: AppImages.onboardingFrame2,
        title: 'Welcome To Islami',
        details: 'We Are Very Excited To Have You In Our Community',
      ),
      OnboardingItem(
        image: AppImages.onboardingFrame3,
        title: 'Reading the Quran',
        details: 'Read, and your Lord is the Most Generous',
      ),
      OnboardingItem(
        image: AppImages.onboardingFrame4,
        title: 'Bearish',
        details: 'Praise the name of your Lord, the Most High',
      ),
      OnboardingItem(
        image: AppImages.onboardingFrame5,
        title: 'Holy Quran Radio',
        details:
            'You can listen to the Holy Quran Radio through the application for free and easily',
      ),
    ];
    PageController controller = PageController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) => {
                  setState(() {
                    currentIndex = index;
                  }),
                },
                itemCount: onboardingScreens.length,
                controller: controller,
                itemBuilder: (_, index) => onboardingScreens[index],
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Visibility(
                  visible: currentIndex != 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackColor,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Text('Back'),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: onboardingScreens.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackColor,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                  ),
                  onPressed: () async {
                    if (currentIndex == onboardingScreens.length - 1) {
                      SharedPreferences sharedPref =
                          await SharedPreferences.getInstance();
                      sharedPref.setBool('isSeenOnboarding', true);
                      Navigator.of(context).pushNamed(HomeScreen.routName);
                    }
                    if (currentIndex < onboardingScreens.length - 1) {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                    setState(() {});
                  },
                  child: Text(
                    currentIndex == onboardingScreens.length - 1
                        ? 'Finish'
                        : 'next',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
