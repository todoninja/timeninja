import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                mini: true,
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
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.play_arrow),
              ),
            ],
          ),
          body: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: largeSpacing,
              //     right: largeSpacing,
              //   ),
              //   child: Text(
              //     "🌤️ Today isn't a work day. Enjoy your free time!",
              //     textAlign: TextAlign.start,
              //     style: theme.textTheme.headlineMedium
              //         ?.copyWith(fontWeight: FontWeight.bold),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(mediumSpacing),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          '📝 Writing a blog post',
                        ),
                        subtitle: Text(
                          'Started 10:00am',
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: theme.colorScheme.secondary),
                        ),
                        trailing: const Text(
                          '1h 30m',
                        ),
                      ),
                      const LinearProgressIndicator(
                        value: 1,
                      ),
                    ],
                  ),
                ),
              ),

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
  return ListTile(
    title: Text(itemTask.note),
    subtitle: Text(itemTask.start.toString() + itemTask.end.toString()),
    trailing: IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () {},
    ),
  );
}
