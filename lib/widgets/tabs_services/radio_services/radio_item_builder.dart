import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_details.dart';

class RadioItemBuilder extends StatelessWidget {
  RadioCard radioCard;
  void Function(RadioCard) onPlayButtomPressed;
  void Function(RadioCard) onSoundButtomPressed;
  RadioItemBuilder({
    required this.onPlayButtomPressed,
    required this.onSoundButtomPressed,
    required this.radioCard,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Stack(
        alignment: .center,
        children: [
          radioCard.isPlay
              ? Positioned(
                  left: -40,
                  right: -40,
                  top: 75,
                  bottom: -40,
                  child: Image.asset(
                    AppImages.soundWaveImage,
                    fit: .cover,
                    color: AppColors.blackColor.withValues(alpha: .30),
                  ),
                )
              : Column(
                  mainAxisAlignment: .end,
                  children: [
                    Image.asset(
                      AppImages.bottomDecorationImage,
                      color: AppColors.blackColor.withValues(alpha: .30),
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  radioCard.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.blackColor),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    SizedBox(width: 35),
                    IconButton(
                      onPressed: () {
                        onPlayButtomPressed(radioCard);
                      },
                      icon: Icon(
                        radioCard.isPlay
                            ? Icons.pause
                            : Icons.play_arrow_rounded,
                        size: 50,
                        color: AppColors.blackColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onSoundButtomPressed(radioCard);
                      },
                      icon: Icon(
                        radioCard.isMuted
                            ? Icons.volume_off_rounded
                            : Icons.volume_up_rounded,
                        size: 27,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
