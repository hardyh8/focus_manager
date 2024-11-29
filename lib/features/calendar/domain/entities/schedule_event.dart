class ScheduleEventEntity {
  final String subject;
  final String note;
  final DateTime fromTime;
  final DateTime toTime;

  ScheduleEventEntity({
    this.subject = '',
    this.note = '',
    required this.fromTime,
    required this.toTime,
  });

  ScheduleEventEntity copyWith({
    String? subject,
    String? note,
    DateTime? fromTime,
    DateTime? toTime,
  }) {
    return ScheduleEventEntity(
      subject: subject ?? this.subject,
      note: note ?? this.note,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }
}
