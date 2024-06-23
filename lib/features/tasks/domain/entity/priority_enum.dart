enum Priority {
  normal,
  low,
  high;

  String toStringValue() {
    switch (this) {
      case (Priority.high):
        return '!! Высокий';
      case Priority.normal:
        return 'Нет';
      case Priority.low:
        return 'Низкий';
    }
  }
}
