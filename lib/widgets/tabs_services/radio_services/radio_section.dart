import 'package:flutter/material.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_details.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_item_builder.dart';

class RadioSection extends StatelessWidget {
  List<RadioCard> cards;
  void Function(RadioCard) onPlayButtomPressed;
  void Function(RadioCard) onSoundButtomPressed;

  RadioSection({
    required this.cards,
    required this.onPlayButtomPressed,
    required this.onSoundButtomPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (_, index) => RadioItemBuilder(
        onPlayButtomPressed: onPlayButtomPressed,
        onSoundButtomPressed: onSoundButtomPressed,
        radioCard: cards[index],
      ),
      itemCount: cards.length,
    );
  }
}
