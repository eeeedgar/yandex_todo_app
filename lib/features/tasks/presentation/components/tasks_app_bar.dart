import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/app/presentation/custom_app_colors.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';
import 'package:yandex_todo_app/features/tasks/presentation/components/task_view_mode_toggle_button.dart';

class TasksSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  TasksSliverAppBar({
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).extension<CustomAppColors>()!.backPrimary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 10,
            color: Color.fromRGBO(
                0, 0, 0, 0.2 * _countShrinkCoefficientLinear(shrinkOffset)),
          ),
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 5,
            color: Color.fromRGBO(
                0, 0, 0, 0.12 * _countShrinkCoefficientLinear(shrinkOffset)),
          ),
        ],
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: 60 - 44 * _countShrinkCoefficientLinear(shrinkOffset),
              right: 24,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppBarTitle(
                  maxExtent: maxExtent,
                  minExtent: minExtent,
                  shrinkOffset: shrinkOffset,
                ),
                const TaskViewModeToggleButton(),
              ],
            ),
          )),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  double _countShrinkCoefficientLinear(double shrinkOffset) {
    return math.min(shrinkOffset, maxExtent - minExtent) /
        (maxExtent - minExtent);
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.maxExtent,
    required this.minExtent,
    required this.shrinkOffset,
  });

  final double maxExtent;
  final double minExtent;
  final double shrinkOffset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Мои дела',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32 - 12 * _countShrinkCoefficientLinear(shrinkOffset),
            height: (37.5 / 32),
          ),
        ),
        BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            return Text(
              'Выполнено — ${state.tasks.where((e) => e.completeStatus == CompleteStatus.done).length}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize:
                    16 * (1 - _countShrinkCoefficientLinear(shrinkOffset)),
                height: 20 / 16,
              ),
            );
          },
        ),
      ],
    );
  }

  double _countShrinkCoefficientLinear(double shrinkOffset) {
    return math.min(shrinkOffset, maxExtent - minExtent) /
        (maxExtent - minExtent);
  }
}
