import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
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
          return Icon(
            showDoneTasks
                ? Icons.remove_red_eye
                : Icons.remove_red_eye_outlined,
            color: Theme.of(context).extension<CustomAppColors>()!.blue,
          );
        },
      ),
    );
  }
}
