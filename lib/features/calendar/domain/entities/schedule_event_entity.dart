class ScheduleEventEntity {
  final int id;
  final String subject;
  final String note;
  final DateTime fromTime;
  final DateTime toTime;
  final bool isCompleted;
  final bool isFailed;
  
  ScheduleEventEntity({
    this.id = 0,
    this.subject = '',
    this.note = '',
    required this.fromTime,
    required this.toTime,
    this.isCompleted = false,
    this.isFailed = false,
  });
  

  ScheduleEventEntity copyWith({
    int? id,
    String? subject,
    String? note,
    DateTime? fromTime,
    DateTime? toTime,
    bool? isCompleted,
    bool? isFailed,
  }) {
    return ScheduleEventEntity(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      note: note ?? this.note,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isCompleted: isCompleted ?? this.isCompleted,
      isFailed: isFailed ?? this.isFailed,
    );
  }
}
