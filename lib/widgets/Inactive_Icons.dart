import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

class InactiveIcons extends StatelessWidget {
  String icon;
  InactiveIcons({required this.icon});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: .scaleDown,
      width: 28,
      height: 28,
      colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
    );
  }
}
