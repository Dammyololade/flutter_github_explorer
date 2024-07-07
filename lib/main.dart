import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/core/di/app_locator.dart';
import 'package:flutter_github_explorer/core/utils/route_manager.dart';

void main() {
  initAppLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
      ),
      initialRoute: RouteManager.home,
      routes: RouteManager.routes,
    );
  }
}
