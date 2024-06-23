import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/deadline_select_button.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/delete_task_button.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/priority_select_button.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/task_edit_app_bar.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/task_title_text_field.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/task_entity.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({
    super.key,
    this.task,
  });

  final TaskEntity? task;

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  Priority _prioritySelected = Priority.normal;
  DateTime? _deadline;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.task?.title ?? '',
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomAppColors>()!.backPrimary,
      appBar: TaskEditAppBar(
        onActionPressed: () {
          if (widget.task != null) {
            // удаление
            context.read<TasksCubit>().updateTask(
                  widget.task!.copyWith(
                    title: _textEditingController.text,
                    priority: _prioritySelected,
                    deadline: _deadline,
                  ),
                );
          } else {
            // TODO: task creation
            // context.read<TasksCubit>().createTask(

            //     );
          }

          _closeScreen(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskTitleTextField(
            textEditingController: _textEditingController,
          ),
          const SizedBox(
            height: 12,
          ),
          PrioritySelectButton(
            prioritySelected: _prioritySelected,
            onChanged: (Priority? newValue) {
              setState(
                () {
                  _prioritySelected = newValue ?? _prioritySelected;
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Theme.of(context)
                  .extension<CustomAppColors>()!
                  .supportSeparator,
            ),
          ),
          DeadlineSelectButton(
            selectedDeadline: _deadline,
            onSelect: (value) => setState(() => _deadline = value),
            onClear: () => setState(() => _deadline = null),
          ),
          Divider(
            color: Theme.of(context)
                .extension<CustomAppColors>()!
                .supportSeparator,
          ),
          DeleteTaskButton(
              onTap:
                  (widget.task != null) ? () => _closeScreen(context) : null),
        ],
      ),
    );
  }

  void _closeScreen(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
