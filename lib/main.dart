import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/services/setup_service_locator.dart';
import 'core/services/shared_prefrences_services.dart';
import 'fruite_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await getIt<SharedPreferencesService>().init();
  runApp(const FruiteHub());
}
