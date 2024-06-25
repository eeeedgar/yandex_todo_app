import 'package:flutter/material.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({
    super.key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).extension<CustomAppColors>()!.backSecondary!,
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
        style: AppFonts.b1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Что надо сделать...',
          hintStyle: AppFonts.b2.copyWith(
            color:
                Theme.of(context).extension<CustomAppColors>()!.labelTertiary,
          ),
        ),
        controller: _textEditingController,
        minLines: 4,
        maxLines: 10,
      ),
    );
  }
}
