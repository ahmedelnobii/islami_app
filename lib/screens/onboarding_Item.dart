import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

class OnboardingItem extends StatelessWidget {
  String image;
  String title;
  String? details;
  OnboardingItem({required this.image, this.details, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.asset('assets/images/img_header.png', fit: .scaleDown),
            Expanded(
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Image.asset(image),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.primary,
                      fontSize: 24,
                    ),
                  ),
                  Visibility(
                    visible: details != null,
                    child: Text(
                      details ?? '',
                      textAlign: .center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
