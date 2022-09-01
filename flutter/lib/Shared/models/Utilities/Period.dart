class PeriodOfTime {
  DateTime start;
  DateTime end;
  PeriodOfTime({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PeriodOfTime &&
        other.start.year == start.year &&
        other.start.month == start.month &&
        other.start.day == start.day &&
        other.start.hour == start.hour &&
        other.start.minute == start.minute &&
        other.end.year == end.year &&
        other.end.month == end.month &&
        other.end.day == end.day &&
        other.end.hour == end.hour &&
        other.end.minute == end.minute;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
