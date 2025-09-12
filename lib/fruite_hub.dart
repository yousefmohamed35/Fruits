import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruiteapp/core/utils/app_colors.dart';

import 'core/routes/routes.dart';
import 'generated/l10n.dart';

class FruiteHub extends StatelessWidget {
  const FruiteHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: AppColors.primaryColor,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
