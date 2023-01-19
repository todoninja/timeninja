import 'package:flutter/material.dart';
import 'package:timeninja/keys.dart';
import 'package:timeninja/l10n/l10n.dart';

class WeekViewPage extends StatefulWidget {
  const WeekViewPage({super.key});

  @override
  State<WeekViewPage> createState() => _WeekViewPageState();
}

class _WeekViewPageState extends State<WeekViewPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navBarWeekView),
      ),
      body: ListView(
        children: [
          const Card(
            margin: EdgeInsets.all(mediumSpacing),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(mediumSpacing),
              child: ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(value: 0.8),
                ),
                title: Text('This week'),
                subtitle: Text('30h / 38h'),
                trailing: Text('8h left'),
              ),
            ),
          ),
          const Divider(),
          // List of time entries
          const Padding(padding: EdgeInsets.all(smallSpacing)),
          Text(
            'Monday, 2. January 2023',
            style: theme.textTheme.caption,
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(smallSpacing)),

          const ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('Time entry 1'),
            subtitle: Text('10:00 - 11:00'),
            trailing: Text('1h'),
          ),
          const ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('Time entry 2'),
            subtitle: Text('11:30 - 12:30'),
            trailing: Text('1h'),
          ),
          const ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('Time entry 3'),
            subtitle: Text('13:00 - 14:00'),
            trailing: Text('1h'),
          ),
        ],
      ),
    );
  }
}
