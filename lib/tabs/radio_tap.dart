import 'package:flutter/material.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_button_item.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_details.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_item_builder.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_section.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/reciters_details.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/reciters_section.dart';

class RadioTap extends StatefulWidget {
  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  ButtonStatue radioStatue = .active;

  late ButtonStatue recitersStatue = radioStatue == .active
      ? .inactive
      : .active;
  List<RadioCard> cards = [
    RadioCard(name: 'Radio Ibrahim Al-Akdar', isMuted: false, isPlay: false),
    RadioCard(name: 'Radio Al-Qaria Yassen', isMuted: false, isPlay: false),
    RadioCard(name: 'Radio Ahmed Al-trabulsi', isMuted: false, isPlay: false),
    RadioCard(
      name: 'Radio Addokali Mohammad Alalim',
      isMuted: false,
      isPlay: false,
    ),
  ];
  List<RecitersCard> recitersCards = [
    RecitersCard(name: 'Ibrahim Al-Akdar', isMuted: false, isPlay: false),
    RecitersCard(name: 'Akram Alalaqmi', isMuted: false, isPlay: false),
    RecitersCard(name: 'Majed Al-Enezi', isMuted: false, isPlay: false),
    RecitersCard(name: 'Malik shaibat Alhamed', isMuted: false, isPlay: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioButtonItem(
                text: 'Radio',
                onPressed: radioOnPressed,
                statue: radioStatue,
              ),
            ),
            Expanded(
              child: RadioButtonItem(
                text: 'Reciters',
                onPressed: recitersOnPressed,
                statue: recitersStatue,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: radioStatue == .active
              ? RadioSection(
                  cards: cards,
                  onPlayButtomPressed: onPlayButtomPressed,
                  onSoundButtomPressed: onSoundButtomPressed,
                )
              : RecitersSection(
                  cards: recitersCards,
                  onPlayButtomPressed: onPlayButtomPressedReciters,
                  onSoundButtomPressed: onSoundButtomPressedReciters,
                ),
        ),
      ],
    );
  }

  void onPlayButtomPressed(RadioCard card) {
    card.isPlay = !card.isPlay;
    setState(() {});
  }

  void onSoundButtomPressed(RadioCard card) {
    card.isMuted = !card.isMuted;
    setState(() {});
  }

  void onPlayButtomPressedReciters(RecitersCard card) {
    card.isPlay = !card.isPlay;
    setState(() {});
  }

  void onSoundButtomPressedReciters(RecitersCard card) {
    card.isMuted = !card.isMuted;
    setState(() {});
  }

  void radioOnPressed() {
    recitersStatue = .inactive;
    radioStatue = .active;
    setState(() {});
  }

  void recitersOnPressed() {
    radioStatue = .inactive;
    recitersStatue = .active;
    setState(() {});
  }
}
