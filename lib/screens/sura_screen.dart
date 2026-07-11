import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';

class SuraScreen extends StatelessWidget {
  static const routeName = '/sura-Screen';
  @override
  Widget build(BuildContext context) {
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sura.suraNameEn,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(AppImages.leftCornerImage, fit: .scaleDown),
                  Text(
                    sura.suraNameAR,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppColors.primary),
                  ),
                  Image.asset(AppImages.rightCornerImage, fit: .scaleDown),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
