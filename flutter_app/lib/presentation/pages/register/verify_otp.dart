import 'package:flutter/material.dart';
import 'package:flutter_app/core/helper.dart';
import 'package:flutter_app/core/resources/app_colors.dart';
import 'package:flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter_app/presentation/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      textStyle: textFieldStyle?.copyWith(fontSize: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.color46BCC3),
    );

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
                      getAppLocal.verify,
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
                        getAppLocal.enterOtp,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        onCompleted: (result) {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: PrimaryButton(
                      title: getAppLocal.verify,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getAppLocal.notReceivedCode,
                        style: textFieldStyle?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(getAppLocal.resend, style: textFieldStyle),
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
