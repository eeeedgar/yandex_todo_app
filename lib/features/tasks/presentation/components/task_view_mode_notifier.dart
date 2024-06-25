import 'package:flutter/material.dart';

class TaskViewModeInfo extends ChangeNotifier {
  TaskViewModeInfo();

  bool get value => _value;
  bool _value = false;
  set value(bool value) {
    if (value != _value) {
      _value = value;
      notifyListeners();
    }
  }
}

class TaskViewModeNotifier extends InheritedNotifier<ValueNotifier<bool>> {
  const TaskViewModeNotifier({
    super.key,
    required ValueNotifier<bool> super.notifier,
    required super.child,
  });

  static ValueNotifier<bool> of(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<TaskViewModeNotifier>()!
        .notifier!;
  }

  @override
  bool updateShouldNotify(
      covariant InheritedNotifier<ValueNotifier> oldWidget) {
    return notifier?.value != oldWidget.notifier?.value;
  }
}
