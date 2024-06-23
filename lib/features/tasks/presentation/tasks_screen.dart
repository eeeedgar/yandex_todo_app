import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/task_edit_screen.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/tasks_app_bar.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/tasks_view.dart';
import 'package:yandex_todo_app/logger/app_logger.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late final ValueNotifier<bool> _showDoneTasksNotifier;

  @override
  void initState() {
    super.initState();
    _showDoneTasksNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    _showDoneTasksNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomAppColors>()!.backPrimary,
      body: SafeArea(
        bottom: false,
        child: TaskViewModeNotifier(
          notifier: _showDoneTasksNotifier,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: TasksSliverAppBar(
                  expandedHeight: 134,
                  collapsedHeight: 56,
                ),
                pinned: true,
              ),
              const SliverPadding(
                sliver: TasksView(),
                padding:
                    EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 64),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).extension<CustomAppColors>()!.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          AppLogger.log('task creation: fab');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TaskEditScreen(),
            ),
          );
        },
      ),
    );
  }
}
