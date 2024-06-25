import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';

class PriorityDropdownMenuItemText extends StatelessWidget {
  const PriorityDropdownMenuItemText({super.key, required this.priority});

  final Priority priority;

  @override
  Widget build(BuildContext context) {
    return Text(
      priority.toStringValue(),
      style: AppFonts.b3.copyWith(
        color: (priority == Priority.high)
            ? Theme.of(context).extension<CustomAppColors>()!.red
            : null,
      ),
    );
  }
}
