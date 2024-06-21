import 'package:equatable/equatable.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/complete_status_enum.dart';
import 'package:yandex_todo_app/features/tasks/domain/entity/priority_enum.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.completeStatus,
    required this.createdAt,
    required this.updatedAt,
    this.deadline,
  });

  final int id;
  final String title;
  final String description;
  final Priority priority;
  final CompleteStatus completeStatus;
  final DateTime? deadline;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        completeStatus,
        title,
        description,
        priority,
        createdAt,
        updatedAt,
        deadline,
      ];

  TaskEntity copyWith({
    String? title,
    String? description,
    Priority? priority,
    CompleteStatus? completeStatus,
    DateTime? deadline,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TaskEntity(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      completeStatus: completeStatus ?? this.completeStatus,
      deadline: deadline ?? this.deadline,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
