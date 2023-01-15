import 'package:flutter/material.dart';

enum NavigationDestinationItems { home, weekview, settings }


// TODO: Change weekview icon to a better one

extension NavigationDestinationItemsExtension on NavigationDestinationItems {
  IconData get icon {
    switch (this) {
      case NavigationDestinationItems.home:
        return Icons.home;
      case NavigationDestinationItems.weekview:
        return Icons.calendar_view_week;
      case NavigationDestinationItems.settings:
        return Icons.settings;
    }
  }

  IconData get outlineIcon {
    switch (this) {
      case NavigationDestinationItems.home:
        return Icons.home_outlined;
      case NavigationDestinationItems.weekview:
        return Icons.calendar_view_week_outlined;
      case NavigationDestinationItems.settings:
        return Icons.settings_outlined;
    }
  }

  String get label {
    switch (this) {
      case NavigationDestinationItems.home:
        return 'Home';
      case NavigationDestinationItems.weekview:
        return 'Week View';
      case NavigationDestinationItems.settings:
        return 'Settings';
    }
  }

  NavigationDestination get destination {
    return NavigationDestination(
      icon: Icon(outlineIcon),
      selectedIcon: Icon(icon),
      label: label,
    );
  }
}
