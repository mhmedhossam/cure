import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.setupServiceLocator();
  runApp(DevicePreview(enabled: false, builder: (context) => const Cure()));
}

class Cure extends StatelessWidget {
  const Cure({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.themeDate,
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.routes,
    );
  }
}
