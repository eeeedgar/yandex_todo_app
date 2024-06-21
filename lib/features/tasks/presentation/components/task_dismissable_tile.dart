import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/task_entity.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';

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
      background: Container(
        color: Colors.green,
      ),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            {
              _markAsDone(tasksCubit);
              break;
            }
          case DismissDirection.endToStart:
            {
              _delete(tasksCubit);
              break;
            }
          default:
            {}
        }
      },
      child: ListTile(
        leading: Checkbox(
          value: task.completeStatus == CompleteStatus.done,
          onChanged: (bool? value) {
            _markAsDone(tasksCubit);
          },
        ),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.edit),
          onTap: () {},
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.completeStatus == CompleteStatus.done
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: task.description.isNotEmpty ? Text(task.description) : null,
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
