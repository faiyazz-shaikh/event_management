import 'package:flutter/material.dart';
import 'package:flutter_app/config/themes/app_theme.dart';
import 'package:flutter_app/generated/l10n.dart';

import 'presentation/pages/register/verify_otp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [S.delegate],
      //check token login and navigation
      home: const VerifyOtp(),
    );
  }
}
