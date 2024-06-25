import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/task_edit_screen.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/task_entity.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';
import 'package:yandex_todo_app/logger/app_logger.dart';

class TaskDismissableTile extends StatelessWidget {
  const TaskDismissableTile({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final tasksCubit = context.read<TasksCubit>();
    return Dismissible(
      key: ObjectKey(task),
      direction: task.completeStatus == CompleteStatus.active
          ? DismissDirection.horizontal
          : DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).extension<CustomAppColors>()!.green,
      ),
      secondaryBackground: Container(
        color: Theme.of(context).extension<CustomAppColors>()!.red,
      ),
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            {
              AppLogger.log('${task.id}: swipe to right');
              _markAsDone(tasksCubit);
              break;
            }
          case DismissDirection.endToStart:
            {
              AppLogger.log('${task.id}: swipe to left');
              _delete(tasksCubit);
              break;
            }
          default:
            {}
        }
      },
      child: ListTile(
        leading: Checkbox(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Theme.of(context).extension<CustomAppColors>()!.green;
            }
            if (task.priority == Priority.high) {
              return Theme.of(context)
                  .extension<CustomAppColors>()!
                  .red!
                  .withOpacity(.16);
            }
            return null;
          }),
          side: BorderSide(
            color: (task.priority == Priority.high)
                ? Theme.of(context).extension<CustomAppColors>()!.red!
                : Theme.of(context)
                    .extension<CustomAppColors>()!
                    .supportSeparator!,
            width: 2,
          ),
          value: task.completeStatus == CompleteStatus.done,
          onChanged: (bool? value) {
            AppLogger.log('${task.id}: checkbox mark as done');
            _markAsDone(tasksCubit);
          },
        ),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.info_outline,
            color:
                Theme.of(context).extension<CustomAppColors>()!.labelTertiary,
          ),
          onTap: () {
            AppLogger.log('${task.id}: info tap');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskEditScreen(task: task),
              ),
            );
          },
        ),
        title: Row(
          children: [
            if (task.priority == Priority.low) ...[
              Icon(
                Icons.arrow_downward,
                color: Theme.of(context)
                    .extension<CustomAppColors>()!
                    .labelTertiary,
              ),
              const SizedBox(width: 4),
            ],
            if (task.priority == Priority.high) ...[
              Icon(
                Icons.warning_amber,
                color: Theme.of(context).extension<CustomAppColors>()!.red,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              task.title,
              style: task.completeStatus == CompleteStatus.done
                  ? AppFonts.b1.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: Theme.of(context)
                          .extension<CustomAppColors>()!
                          .labelTertiary,
                      decorationColor: Theme.of(context)
                          .extension<CustomAppColors>()!
                          .labelTertiary,
                    )
                  : AppFonts.b1.copyWith(
                      color: Theme.of(context)
                          .extension<CustomAppColors>()!
                          .labelPrimary,
                      decorationColor: Theme.of(context)
                          .extension<CustomAppColors>()!
                          .labelPrimary,
                    ),
            ),
          ],
        ),
        subtitle: (task.deadline != null)
            ? Text(
                task.deadline.toString(),
              )
            : null,
        subtitleTextStyle: AppFonts.caption1.copyWith(
            color:
                Theme.of(context).extension<CustomAppColors>()!.labelTertiary),
      ),
    );
  }

  void _markAsDone(TasksCubit cubit) {
    cubit.setTaskStatus(
      task.id,
      CompleteStatus.done,
    );
  }

  void _delete(TasksCubit cubit) {
    cubit.setTaskStatus(
      task.id,
      CompleteStatus.deleted,
    );
  }
}
