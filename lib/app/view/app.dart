import 'package:flutter/material.dart';
import 'package:timeninja/entry_scaffold/view/entry_scaffold.dart';
import 'package:timeninja/keys.dart';
import 'package:timeninja/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: brandColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: brandColor,
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const EntryScaffold(),
    );
  }
}
