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

  bool include(PeriodOfTime p2) {
    return (p2.start.isAfter(start) || p2.start.isAtSameMomentAs(start)) &&
        (p2.end.isBefore(end) || p2.end.isAtSameMomentAs(end));
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() => 'PeriodOfTime(start: $start, end: $end)';
}
