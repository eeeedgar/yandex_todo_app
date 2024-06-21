import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_dismissable_tile.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return ValueListenableBuilder<bool>(
          valueListenable: TaskViewModeNotifier.of(context),
          builder: (context, showDoneTasks, _) {
            final tasks = showDoneTasks
                ? state.tasks
                    .where((e) => e.completeStatus == CompleteStatus.active)
                    .toList()
                : state.tasks
                    .where((e) => e.completeStatus != CompleteStatus.deleted)
                    .toList();
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: tasks.length,
                (_, index) {
                  final task = tasks[index];
                  return TaskDismissableTile(task: task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
