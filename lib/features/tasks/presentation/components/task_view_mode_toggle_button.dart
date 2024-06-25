import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';
import 'package:yandex_todo_app/gen/assets.gen.dart';

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
          final icon =
              showDoneTasks ? Assets.icons.eye : Assets.icons.eyeStroke;
          return icon.svg(
            colorFilter: ColorFilter.mode(
              Theme.of(context).extension<CustomAppColors>()!.blue!,
              BlendMode.srcIn,
            ),
          );
        },
      ),
    );
  }
}
