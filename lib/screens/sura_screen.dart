import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/widgets/indecator_.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/Sura.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/quran_services.dart';

class SuraScreen extends StatefulWidget {
  static const routeName = '/sura-Screen';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  String completedSura = '';

  @override
  Widget build(BuildContext context) {
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (completedSura == '') readSura(int.parse(sura.sureNumber));
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
            Expanded(
              child: completedSura == ''
                  ? LoadingIndicator()
                  : SingleChildScrollView(
                      child: Text(
                        textDirection: .rtl,
                        textAlign: .center,
                        completedSura,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              width: .infinity,
              child: Image.asset(
                AppImages.bottomDecorationImage,
                fit: .fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readSura(int num) async {
    String suraVerces = await QuranServices.readSuraFile(num);
    List<String> ayat = suraVerces.split('\r\n');
    int count = 1;
    for (var verce in ayat) {
      if (verce.isNotEmpty) {
        completedSura += ('$verce [${(count++).toString()}] ');
      }
    }
    setState(() {});
  }
}
