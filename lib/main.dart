import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xgrid_interview_testdesign/Screens/mainScreen.dart';

import 'Controller/theme_manager.dart';

void main() {
  // runApp(const MyApp());
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
              theme: theme.getTheme(),
              home: Scaffold(
                body: HomeScreen(theme: theme),
              ),
            ));
  }
}
