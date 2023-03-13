import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum NavigationDestinationItems { home, weekview, settings }

extension NavigationDestinationItemsExtension on NavigationDestinationItems {
  IconData get icon {
    switch (this) {
      case NavigationDestinationItems.home:
        return Icons.home;
      case NavigationDestinationItems.weekview:
        return Icons.view_week;
      case NavigationDestinationItems.settings:
        return Icons.settings;
    }
  }

  IconData get outlineIcon {
    switch (this) {
      case NavigationDestinationItems.home:
        return Icons.home_outlined;
      case NavigationDestinationItems.weekview:
        return Icons.view_week_outlined;
      case NavigationDestinationItems.settings:
        return Icons.settings_outlined;
    }
  }

  String _label(AppLocalizations l10n) {
    switch (this) {
      case NavigationDestinationItems.home:
        return l10n.navBarHome;
      case NavigationDestinationItems.weekview:
        return l10n.navBarWeekView;
      case NavigationDestinationItems.settings:
        return l10n.navBarSettings;
    }
  }

  NavigationDestination buildDestination(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NavigationDestination(
      icon: Icon(outlineIcon),
      selectedIcon: Icon(icon),
      label: _label(l10n),
    );
  }
}
