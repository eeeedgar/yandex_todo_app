import 'package:flutter/material.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/tasks_app_bar.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/tasks_view.dart';

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
    return SafeArea(
      child: Material(
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
              const TasksView(),
            ],
          ),
        ),
      ),
    );
  }
}
