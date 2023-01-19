import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timeninja/keys.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// TODO(jonasrichardrichter): #1 Add real settings https://github.com/todoninja/timeninja/issues/1
class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final packageInfo = PackageInfo.fromPlatform();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('Hours per week'),
            trailing: Text('38h'),
          ),
          const ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('Work days'),
            trailing: Text('Mon - Fri'),
          ),
          const Divider(),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Task mode'),
                Text(
                  'Add a task to each time entry',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('About this app'),
            onTap: () {
              print('tapped');
            },
          ),
          const Padding(padding: EdgeInsets.all(mediumSpacing)),
          FutureBuilder(
            future: packageInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Version ${snapshot.data!.version} (${snapshot.data!.buildNumber})',
                  style: theme.textTheme.caption,
                  textAlign: TextAlign.center,
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
