import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

class ActiveIcon extends StatelessWidget {
  String icon;
  ActiveIcon({required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.blackColor.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        icon,
        fit: .scaleDown,
        width: 22,
        height: 22,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
