import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/logger/app_logger.dart';

class DeadlineSelectButton extends StatelessWidget {
  const DeadlineSelectButton({
    super.key,
    required this.selectedDeadline,
    required this.onSelect,
    required this.onClear,
  });

  final DateTime? selectedDeadline;

  final Function(DateTime?) onSelect;

  final Function() onClear;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Сделать до',
        style: AppFonts.b2,
      ),
      subtitle: Text(
        selectedDeadline?.toString() ?? '',
        style: AppFonts.caption2.copyWith(
          color: Theme.of(context).extension<CustomAppColors>()!.blue,
        ),
      ),
      trailing: Switch(
        activeColor: Theme.of(context).extension<CustomAppColors>()!.blue,
        value: selectedDeadline != null,
        onChanged: (newValue) async {
          if (selectedDeadline == null) {
            final newDateTime = await showDatePicker(
              context: context,
              // TODO: real dates
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (newDateTime != null) {
              onSelect(newDateTime);
              AppLogger.log('deadline selected: $newDateTime');
            }
          } else {
            onClear();
            AppLogger.log('deadline cleared');
          }
        },
      ),
    );
  }
}
