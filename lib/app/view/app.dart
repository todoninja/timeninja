import 'package:flutter/material.dart';
import 'package:timeninja/counter/counter.dart';
import 'package:timeninja/keys.dart';
import 'package:timeninja/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color: brandColor),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: brandColor,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
