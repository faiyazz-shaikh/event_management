import 'package:flutter/material.dart';
import 'package:flutter_app/core/helper.dart';
import 'package:flutter_app/core/resources/app_colors.dart';
import 'package:flutter_app/presentation/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(18, 0, 18, 15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: AppColors.transparentGrey,
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            children: [
              const Spacer(),
              Text(
                getAppLocal.intro1,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 18),
                child: Text(
                  getAppLocal.intro2,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              PrimaryButton(
                onPressed: () {},
                title: getAppLocal.logIn,
                showBorder: true,
                backGroundColor: AppColors.white,
                textColor: AppColors.color46BCC3,
              ),
              const SizedBox(height: 14),
              PrimaryButton(
                onPressed: () {},
                title: getAppLocal.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
