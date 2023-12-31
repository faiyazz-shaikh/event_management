import 'package:flutter/material.dart';
import 'package:flutter_app/core/resources/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    this.onPressed,
    this.textColor = Colors.white,
    this.showBorder = false,
    this.borderColor = AppColors.color46BCC3,
    this.backGroundColor = AppColors.color46BCC3,
    super.key,
  });

  final VoidCallback? onPressed;
  final Color textColor;
  final String title;
  final Color backGroundColor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayMedium?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        );
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          padding: const EdgeInsets.all(18),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: showBorder ? borderColor : Colors.transparent,
            ),
          ),
        ),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
