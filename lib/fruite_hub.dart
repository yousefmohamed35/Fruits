import 'package:flutter/material.dart';

import 'core/routes/routes.dart';

class FruiteHub extends StatelessWidget {
  const FruiteHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}