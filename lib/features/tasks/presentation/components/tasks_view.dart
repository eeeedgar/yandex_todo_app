import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/app/presentation/app_fonts.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/task_edit/presentation/task_edit_screen.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_dismissable_tile.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_notifier.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return ValueListenableBuilder<bool>(
          valueListenable: TaskViewModeNotifier.of(context),
          builder: (context, showDoneTasks, _) {
            final tasks = showDoneTasks
                ? state.tasks
                    .where((e) => e.completeStatus == CompleteStatus.active)
                    .toList()
                : state.tasks
                    .where((e) => e.completeStatus != CompleteStatus.deleted)
                    .toList();
            return DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context)
                    .extension<CustomAppColors>()!
                    .backElevated,
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
              sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                sliver: SliverMainAxisGroup(slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: tasks.length,
                      (_, index) {
                        final task = tasks[index];
                        return TaskDismissableTile(task: task);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TaskEditScreen(),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 64),
                        child: Text(
                          'Новое',
                          style: AppFonts.b1.copyWith(
                            color: Theme.of(context)
                                .extension<CustomAppColors>()!
                                .labelTertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        );
      },
    );
  }
}
