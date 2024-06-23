import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
// ignore: unused_import
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/components/priority_dropdown_menu_item.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';

class PrioritySelectButton extends StatelessWidget {
  const PrioritySelectButton({
    super.key,
    required this.prioritySelected,
    required this.onChanged,
  });

  final Priority prioritySelected;

  final Function(Priority?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Важность',
            style: AppFonts.b2,
          ),
          DropdownButton<Priority>(
            isDense: true,
            style: AppFonts.caption2.copyWith(
              color:
                  Theme.of(context).extension<CustomAppColors>()!.labelTertiary,
            ),
            iconSize: 0.0,
            underline: const SizedBox.shrink(),
            value: prioritySelected,
            onChanged: onChanged,
            items: Priority.values.map((Priority value) {
              return DropdownMenuItem(
                value: value,
                child: PriorityDropdownMenuItemText(
                  priority: value,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
