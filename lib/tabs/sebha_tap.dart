import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  double turns = 0;
  int index = 0;

  List<String> tasbehWords = ['سبحان الله', 'الحمدلله', "الله أكبر"];

  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: appTheme.titleLarge?.copyWith(fontSize: 36),
        ),
        Column(
          children: [
            Image.asset(AppImages.sebhaHeadImage),
            Stack(
              alignment: .center,
              children: [
                AnimatedRotation(
                  duration: Duration(milliseconds: 150),
                  turns: turns,
                  curve: Curves.easeIn,
                  child: Image.asset(AppImages.sebhaBodyImage),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        turns += .033;
                        count++;
                        if (index < tasbehWords.length - 1 && count % 33 == 0) {
                          index++;
                        } else if (index == tasbehWords.length - 1 &&
                            count % 33 == 0) {
                          index = 0;
                        }
                        setState(() {});
                      },
                      child: Text(
                        textAlign: .center,
                        "${tasbehWords[index]}\n\n$count",
                        style: appTheme.titleLarge?.copyWith(fontSize: 36),
                      ),
                    ),
                    // Text('30', style: appTheme.titleLarge?.copyWith(fontSize: 36)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
