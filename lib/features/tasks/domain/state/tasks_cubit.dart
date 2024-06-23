import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/task_entity.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(super.initialState);

  void addTask(TaskEntity task) {
    emit(state.copyWith(tasks: state.tasks..add(task)));
  }

  void setTaskStatus(int taskId, CompleteStatus status) {
    final updatedTasks = state.tasks
        .map((e) => e.id == taskId ? e.copyWith(completeStatus: status) : e)
        .toList();

    emit(state.copyWith(tasks: updatedTasks));
  }

  void createTask(String title, Priority priority, DateTime deadline) {
    // emit(state.copyWith(tasks: state.tasks..add(TaskEntity(id: , title: title, description: description, priority: priority, completeStatus: completeStatus, createdAt: createdAt, updatedAt: updatedAt))));
  }

  void updateTask(TaskEntity task) {
    final updatedTasks =
        state.tasks.map((e) => e.id == task.id ? task : e).toList();

    emit(state.copyWith(tasks: updatedTasks));
  }
}
