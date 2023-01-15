import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeninja/data/database.dart';
import 'package:provider/provider.dart';

class CreateTrackingPage extends StatelessWidget {
  const CreateTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      // The single instance of AppDatabase
      create: (_) => AppDb(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Tracking')),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final db = Provider.of<AppDb>(context, listen: false);

              final timeblock = await db.into(db.timeblock).insert(
                    TimeblockCompanion(
                      start: Value(DateTime.now()),
                      end: Value(DateTime.now()),
                      note: const Value('Test'),
                    ),
                  );
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: _buildTimeblockList(context),
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
  return Text(itemTask.note);
}
