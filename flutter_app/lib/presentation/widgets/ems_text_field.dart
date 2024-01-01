import 'package:flutter/material.dart';
import 'package:flutter_app/core/resources/app_colors.dart';

class EmsTextField extends StatefulWidget {
  const EmsTextField({super.key});

  @override
  State<EmsTextField> createState() => _EmsTextFieldState();
}

class _EmsTextFieldState extends State<EmsTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.lowOpacityGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.color46BCC3),
        ),
      ),
    );
  }
}
