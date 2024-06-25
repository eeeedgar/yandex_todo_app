part of 'tasks_cubit.dart';

class TasksState extends Equatable {
  const TasksState({required this.tasks});

  final List<TaskEntity> tasks;

  @override
  List<Object> get props => [tasks];

  TasksState copyWith({List<TaskEntity>? tasks}) {
    return TasksState(tasks: tasks ?? this.tasks);
  }
}
