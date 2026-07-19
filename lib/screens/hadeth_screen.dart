import 'package:flutter/material.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/core/theme/App_theme.dart';

class HadethScreen extends StatelessWidget {
  static const routName = '/Hadeth_Screen';
  String title;
  List<String> content;
  HadethScreen({required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: content.length,
                itemBuilder: (_, index) => Text(
                  textAlign: .center,
                  content[index],
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .1,
            child: Image.asset(AppImages.bottomDecorationImage, fit: .fill),
          ),
        ],
      ),
    );
  }
}
