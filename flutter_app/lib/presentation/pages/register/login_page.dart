import 'package:flutter/material.dart';
import 'package:flutter_app/core/helper.dart';
import 'package:flutter_app/core/resources/app_colors.dart';
import 'package:flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter_app/presentation/widgets/ems_text_field.dart';
import 'package:flutter_app/presentation/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final textFieldStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: EmsAppBar(title: getAppLocal.event),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      getAppLocal.logIn,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 22),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 20),
                      child: Text(
                        getAppLocal.loginIntro1,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  Text(getAppLocal.email, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 32),
                    child: EmsTextField(hintText: getAppLocal.enterEmail),
                  ),
                  Text(getAppLocal.password, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 20),
                    child: EmsTextField(
                      hintText: getAppLocal.enterPassword,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        Text(getAppLocal.forgotPassword, style: textFieldStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: PrimaryButton(
                      title: getAppLocal.logIn,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getAppLocal.ifNew,
                        style: textFieldStyle?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        getAppLocal.createNewAcc,
                        style: textFieldStyle,
                      ),
                    ],
                  ),
                  //createNewAcc
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
