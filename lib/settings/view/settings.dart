import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timeninja/keys.dart';
import 'package:timeninja/settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// TODO(jonasrichardrichter): #1 Add real settings https://github.com/todoninja/timeninja/issues/1
class _SettingsPageState extends State<SettingsPage> {
  int _hoursPerWeek = 0;
  bool _taskMode = false;

  Future<void> _loadSettings() async {
    _hoursPerWeek = await Settings.getHoursPerWeek();
    _taskMode = await Settings.getTaskMode();
    setState(() {});
  }

  Future<void> _saveSettings() async {
    await Settings.setHoursPerWeek(_hoursPerWeek);
    await Settings.setTaskMode(taskMode: _taskMode);
    setState(() {});
  }

  @override
  void initState() {
    _loadSettings();
    super.initState();
  }

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
          SwitchListTile(
            value: true,
            onChanged: (value) {},
            title: const Text('Goal mode'),
            subtitle: const Text('Set a goal for your work week'),
          ),
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('Hours per week'),
            trailing: Text('${_hoursPerWeek}h'),
          ),
          const ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('Work days'),
            trailing: Text('Mon - Fri'),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Task mode'),
            subtitle: const Text('Add a task to each time entry'),
            value: _taskMode,
            onChanged: (value) {
              setState(() {
                _taskMode = value;
              });
              _saveSettings();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('About this app'),
            onTap: () {},
          ),
          const Padding(padding: EdgeInsets.all(mediumSpacing)),
          FutureBuilder(
            future: packageInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Version ${snapshot.data!.version} (${snapshot.data!.buildNumber})',
                  style: theme.textTheme.bodySmall,
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
