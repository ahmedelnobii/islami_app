import 'package:flutter/material.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_details.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/radio_item_builder.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/reciters_details.dart';
import 'package:islami_app/widgets/tabs_services/radio_services/reciters_item_builders.dart';

class RecitersSection extends StatelessWidget {
  List<RecitersCard> cards;
  void Function(RecitersCard) onPlayButtomPressed;
  void Function(RecitersCard) onSoundButtomPressed;

  RecitersSection({
    required this.cards,
    required this.onPlayButtomPressed,
    required this.onSoundButtomPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (_, index) => RecitersItemBuilders(
        onPlayButtomPressed: onPlayButtomPressed,
        onSoundButtomPressed: onSoundButtomPressed,
        radioCard: cards[index],
      ),
      itemCount: cards.length,
    );
  }
}
