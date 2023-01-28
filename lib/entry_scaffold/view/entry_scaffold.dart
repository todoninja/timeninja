import 'package:flutter/material.dart';
import 'package:timeninja/create_tracking/create_tracking.dart';
import 'package:timeninja/navigation_destination_items.dart';
import 'package:timeninja/settings/settings.dart';
import 'package:timeninja/week_view/view/week_view.dart';

class EntryScaffold extends StatefulWidget {
  const EntryScaffold({super.key});

  @override
  State<EntryScaffold> createState() => _EntryScaffoldState();
}

class _EntryScaffoldState extends State<EntryScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    CreateTrackingPage(),
    WeekViewPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: [
          for (final item in NavigationDestinationItems.values)
            item.buildDestination(context),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
