import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/widgets/tabs_services/hadeth_services/hadeth_item_builder.dart';

class HadithTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 50,
      itemBuilder: (_, index, _) => HadethItemBuilder(index: index),
      carouselController: CarouselSliderController(),
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        enlargeFactor: .20,
      ),
    );
  }
}
