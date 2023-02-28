import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeninja/create_tracking/components/active_tracking_card.dart';
import 'package:timeninja/data/database.dart';
import 'package:timeninja/keys.dart';
import 'package:timeninja/l10n/l10n.dart';

class CreateTrackingPage extends StatelessWidget {
  const CreateTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Provider(
      // The single instance of AppDatabase
      create: (_) => AppDb(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.navBarHome),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: theme.colorScheme.tertiaryContainer,
                onPressed: () async {
                  final db = Provider.of<AppDb>(context, listen: false);

                  await db.into(db.timeblock).insert(
                        TimeblockCompanion(
                          start: drift.Value(DateTime.now()),
                          end: drift.Value(DateTime.now()),
                          note: const drift.Value('Test'),
                        ),
                      );
                },
                child: const Icon(Icons.add),
              ),
              const Padding(padding: EdgeInsets.only(top: largeSpacing)),
              SizedBox(
                height: 96,
                width: 96,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () async {
                      final db = Provider.of<AppDb>(context, listen: false);

                      await db.into(db.timeblock).insert(
                            TimeblockCompanion(
                              start: drift.Value(DateTime.now()),
                              note: const drift.Value('Test'),
                            ),
                          );
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const ActiveTrackingCard(),
              Expanded(child: _buildTimeblockList(context)),
            ],
          ),
        );
      },
    );
  }
}

StreamBuilder<List<TimeblockData>> _buildTimeblockList(BuildContext context) {
  final database = Provider.of<AppDb>(context);
  return StreamBuilder(
    stream: database.watchAllTimeblocks(),
    builder: (context, AsyncSnapshot<List<TimeblockData>> snapshot) {
      final tasks = snapshot.data ?? [];

      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          final itemTask = tasks[index];
          return _buildListItem(itemTask, database);
        },
      );
    },
  );
}

Widget _buildListItem(TimeblockData itemTask, AppDb database) {
  final dateFormat = DateFormat.Hm();

  return ListTile(
    title: Text(itemTask.note),
    subtitle: Text(
      '${dateFormat.format(itemTask.start)} - '
      '${dateFormat.format(itemTask.end)}',
    ),
    trailing: Text(
      '${itemTask.end.difference(itemTask.start).inMinutes}m',
    ),
  );
}
