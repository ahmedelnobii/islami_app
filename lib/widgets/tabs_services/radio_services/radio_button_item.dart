import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

enum ButtonStatue { active, inactive }

class RadioButtonItem extends StatelessWidget {
  Color activeForgroundColor = AppColors.blackColor;
  Color activeBackgroundColor = AppColors.primary;
  String text;
  VoidCallback onPressed;
  Color inActiveForgroundColor = AppColors.whiteColor;
  Color inActiveBackgroundColor = AppColors.blackColor.withValues(alpha: .7);
  ButtonStatue statue;
  RadioButtonItem({
    required this.text,
    required this.onPressed,
    required this.statue ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: statue == .active
            ? activeBackgroundColor
            : inActiveBackgroundColor,
        foregroundColor: statue == .active
            ? activeForgroundColor
            : inActiveForgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: statue == .active
              ? activeForgroundColor
              : inActiveForgroundColor,
          fontWeight: .w400,
        ),
      ),
    );
  }
}
