import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/task_edit_app_bar.dart';
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
            // TODO
            // context.read<TasksCubit>().createTask(

            //     );
          }

          _closeScreen(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context)
                  .extension<CustomAppColors>()!
                  .backSecondary!,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                ),
              ],
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              controller: _textEditingController,
              minLines: 4,
              maxLines: 10,
            ),
          ),
          ListTile(
            title: const Text('Важность'),
            subtitle: DropdownButton<Priority>(
              value: _prioritySelected,
              onChanged: (Priority? newValue) {
                setState(
                  () {
                    _prioritySelected = newValue ?? _prioritySelected;
                  },
                );
              },
              items: Priority.values.map((Priority value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text('Сделать до'),
            subtitle: Text(_deadline?.toString() ?? ''),
            trailing: Switch(
              value: _deadline != null,
              onChanged: (newValue) async {
                if (_deadline == null) {
                  _deadline = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                } else {
                  _deadline = null;
                }
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Удалить'),
            onTap: () => _closeScreen(context),
          )
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
