import 'package:flutter/material.dart';
import 'package:flutter_app/core/helper.dart';
import 'package:flutter_app/core/resources/app_colors.dart';
import 'package:flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter_app/presentation/widgets/ems_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: EmsAppBar(title: getAppLocal.signUp),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Text(
                getAppLocal.signupDetails,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            EmsTextField(),
          ],
        ),
      ),
    );
  }
}
