import 'package:flutter/material.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';

class TaskViewModeToggleButton extends StatelessWidget {
  const TaskViewModeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => TaskViewModeNotifier.of(context).value =
          !TaskViewModeNotifier.of(context).value,
      child: ValueListenableBuilder<bool>(
        valueListenable: TaskViewModeNotifier.of(context),
        builder: (context, showDoneTasks, _) {
          if (showDoneTasks) {
            return const Icon(Icons.remove_red_eye);
          } else {
            return const Icon(Icons.abc);
          }
        },
      ),
    );
  }
}
