import 'package:drift/drift.dart';

class ScheduleTaskModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get subject => text()();
  TextColumn get notes => text()();
  DateTimeColumn get fromTime => dateTime()();
  DateTimeColumn get toTime => dateTime()();
  BoolColumn get isCompleted => boolean()();
  BoolColumn get isFailed => boolean()();
}

class ScheduleEventModel {
  final int id;
  final String subject;
  final String note;
  final DateTime fromTime;
  final DateTime toTime;
  final bool isCompleted;
  final bool isFailed;
  ScheduleEventModel({
    this.id = 0,
    this.subject = '',
    this.note = '',
    required this.fromTime,
    required this.toTime,
    this.isCompleted = false,
    this.isFailed = false,
  });
  

  ScheduleEventModel copyWith({
    int? id,
    String? subject,
    String? note,
    DateTime? fromTime,
    DateTime? toTime,
    bool? isCompleted,
    bool? isFailed,
  }) {
    return ScheduleEventModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      note: note ?? this.note,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isCompleted: isCompleted ?? this.isCompleted,
      isFailed: isFailed ?? this.isFailed,
    );
  }

  @override
  String toString() {
    return 'ScheduleEventModel(id: $id, subject: $subject, note: $note, fromTime: $fromTime, toTime: $toTime, isCompleted: $isCompleted, isFailed: $isFailed)';
  }
}
