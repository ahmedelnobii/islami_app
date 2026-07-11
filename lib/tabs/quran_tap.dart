import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/core/theme/App_theme.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/SuraItemBuilder.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/SuraLists.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Suras List', style: Theme.of(context).textTheme.titleMedium),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) =>
                SuraItemBuilder(sura: SuraLists.getSuraByIndex(index: index)),
            separatorBuilder: (_, _) => Divider(indent: 45, endIndent: 45),
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}
