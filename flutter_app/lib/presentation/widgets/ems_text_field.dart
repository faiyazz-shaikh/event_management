import 'package:flutter/material.dart';
import 'package:flutter_app/core/resources/app_colors.dart';

class EmsTextField extends StatefulWidget {
  const EmsTextField({
    super.key,
    this.hintText,
    this.textInputType,
    this.validator,
    this.suffixIcon,
  });
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  State<EmsTextField> createState() => _EmsTextFieldState();
}

class _EmsTextFieldState extends State<EmsTextField> {
  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 16);
    return TextFormField(
      style: textStyle,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.lowOpacityGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.color46BCC3),
        ),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: textStyle?.copyWith(color: AppColors.grey),
        contentPadding: const EdgeInsets.all(20),
      ),
      cursorColor: AppColors.color46BCC3,
    );
  }
}
