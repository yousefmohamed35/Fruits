import 'package:flutter/material.dart';

import 'core/services/setup_service_locator.dart';
import 'core/services/shared_prefrences_services.dart';
import 'fruite_hub.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
 await getIt<SharedPreferencesService>().init();
  runApp(const FruiteHub());
}

