import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/svg_Icons_path.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/core/theme/App_theme.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/SuraItemBuilder.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/quran_services.dart';

class QuranTap extends StatefulWidget {
  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            onChanged: (value) {
              QuranServices.searchSuras(value);
              setState(() {});
            },
            style: Theme.of(context).textTheme.titleSmall,
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                SvgIconsPath.quranIcon,
                fit: .scaleDown,
                colorFilter: ColorFilter.mode(AppColors.primary, .srcIn),
              ),
              hint: Text(
                'Sura Name',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              filled: true,
              fillColor: AppColors.blackColor.withValues(alpha: .7),
            ),
          ),
        ),
        Text('Suras List', style: Theme.of(context).textTheme.titleMedium),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) =>
                SuraItemBuilder(sura: QuranServices.suras[index]),
            separatorBuilder: (_, _) => Divider(indent: 45, endIndent: 45),
            itemCount: QuranServices.suras.length,
          ),
        ),
      ],
    );
  }
}
