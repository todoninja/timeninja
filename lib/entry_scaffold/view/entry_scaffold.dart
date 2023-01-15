import 'package:flutter/material.dart';
import 'package:timeninja/navigation_destination_items.dart';

class EntryScaffold extends StatefulWidget {
  const EntryScaffold({super.key});

  @override
  State<EntryScaffold> createState() => _EntryScaffoldState();
}

class _EntryScaffoldState extends State<EntryScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('1')),
    Center(child: Text('2')),
    Center(child: Text('3')),
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: Theme(
        data: themeData.copyWith(splashFactory: NoSplash.splashFactory),
        child: NavigationBar(
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
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
