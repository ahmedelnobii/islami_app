import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/screens/sura_screen.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/quran_services.dart';

class SuraItemBuilder extends StatelessWidget {
  Sura sura;
  SuraItemBuilder({required this.sura});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: .center,
          children: [
            SvgPicture.asset(
              'assets/icon_svg/sura_number_border.svg',
              fit: .scaleDown,
            ),
            Text(
              sura.sureNumber,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(width: 24),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              sura.suraNameEn,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 9),
            Text(
              '${sura.suraVersesNumber} Verses',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Spacer(),
        Text(sura.suraNameAR, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
