import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/task_entity.dart';
import 'package:yandex_todo_app/features/tasks/domain/state/tasks_cubit.dart';
import 'package:yandex_todo_app/features/tasks/presentation/tasks_screen.dart';

Random _rnd = Random();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  List<TaskEntity> _generateTasks() {
    return List.generate(20, (index) {
      return TaskEntity(
        id: index,
        title: 'title-$index',
        description: index.isEven ? 'description-$index' : '',
        priority: Priority.values[_rnd.nextInt(3)],
        completeStatus: CompleteStatus.values[_rnd.nextInt(3)],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(
        TasksState(
          tasks: _generateTasks(),
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
