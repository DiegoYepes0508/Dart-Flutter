import 'package:ejemplo/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:ejemplo/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRoutes(),
      theme: AppTheme.themelight,
    );
  }
}
