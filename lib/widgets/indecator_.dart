import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.primary));
  }
}
