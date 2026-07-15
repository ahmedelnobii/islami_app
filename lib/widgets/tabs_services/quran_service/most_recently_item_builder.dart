import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';

class MostRecentlyItemBuilder extends StatelessWidget {
  Sura sura;
  MostRecentlyItemBuilder({required this.sura});
  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context).textTheme;

    return Container(
      height: MediaQuery.sizeOf(context).height * .14,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            mainAxisAlignment: .spaceAround,
            children: [
              Text(
                sura.suraNameEn,
                style: appTheme.titleMedium?.copyWith(
                  fontSize: 24,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                sura.suraNameAR,
                style: appTheme.titleMedium?.copyWith(
                  fontSize: 24,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                '${sura.suraVersesNumber} verces',
                style: appTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Image.asset(AppImages.mostRecentImage, fit: .fill),
        ],
      ),
    );
  }
}
