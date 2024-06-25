import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';

class DeleteTaskButton extends StatelessWidget {
  const DeleteTaskButton({super.key, required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: (onTap != null)
                  ? Theme.of(context).extension<CustomAppColors>()!.red
                  : Theme.of(context)
                      .extension<CustomAppColors>()!
                      .labelDisable,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'Удалить',
              style: AppFonts.b1.copyWith(
                color: (onTap != null)
                    ? Theme.of(context).extension<CustomAppColors>()!.red
                    : Theme.of(context)
                        .extension<CustomAppColors>()!
                        .labelDisable,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
