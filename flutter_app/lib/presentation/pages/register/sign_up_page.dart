import 'package:flutter/material.dart';
import 'package:flutter_app/core/helper.dart';
import 'package:flutter_app/core/resources/app_colors.dart';
import 'package:flutter_app/core/resources/app_constants.dart';
import 'package:flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter_app/presentation/widgets/ems_text_field.dart';
import 'package:flutter_app/presentation/widgets/primary_button.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    final textStyle =
        Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 16);
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
                      getAppLocal.signUp,
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
                        getAppLocal.signupDetails,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  Text(getAppLocal.fullName, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 32),
                    child: EmsTextField(hintText: getAppLocal.enterName),
                  ),
                  Text(getAppLocal.email, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 32),
                    child: EmsTextField(hintText: getAppLocal.enterEmail),
                  ),
                  Text(getAppLocal.phoneNumber, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 8),
                    child: IntlPhoneField(
                      style: textStyle,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.lowOpacityGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.color46BCC3),
                        ),
                        hintText: getAppLocal.phoneNumber,
                        hintStyle: textStyle?.copyWith(color: AppColors.grey),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      pickerDialogStyle: PickerDialogStyle(
                        backgroundColor: AppColors.white,
                      ),
                      initialCountryCode: AppConstants.initialCountryCode,
                      onChanged: (phone) {},
                    ),
                  ),
                  Text(getAppLocal.password, style: textFieldStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 32),
                    child: EmsTextField(
                      hintText: getAppLocal.enterPassword,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: SizedBox.square(
                          dimension: 24,
                          child: Checkbox.adaptive(
                            value: false,
                            onChanged: (v) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: const BorderSide(width: 0.5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(getAppLocal.agreeTerms, style: textFieldStyle),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: PrimaryButton(
                      title: getAppLocal.signUp,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getAppLocal.haveAccount,
                        style: textFieldStyle?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        getAppLocal.logIn,
                        style: textFieldStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
