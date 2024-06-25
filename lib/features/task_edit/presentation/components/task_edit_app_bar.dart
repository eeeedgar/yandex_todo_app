import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';

class TaskEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskEditAppBar({
    super.key,
    this.height = kToolbarHeight,
    required this.onActionPressed,
  });

  final double height;
  final VoidCallback onActionPressed;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 10,
      backgroundColor:
          Theme.of(context).extension<CustomAppColors>()!.backPrimary,
      surfaceTintColor:
          Theme.of(context).extension<CustomAppColors>()!.backPrimary,
      shadowColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Theme.of(context).extension<CustomAppColors>()!.labelPrimary,
        ),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: TextButton(
            onPressed: onActionPressed,
            child: Text(
              'Сохранить',
              style: TextStyle(
                  color: Theme.of(context).extension<CustomAppColors>()!.blue),
            ),
          ),
        ),
      ],
    );
  }
}
