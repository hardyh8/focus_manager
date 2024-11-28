import 'package:drift/drift.dart';

class FocusTimeModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get completedSecond => integer()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class FocusTimeSessionModel {
  final int id;
  final int completedSecond;
  final DateTime? completionDateTime;
  FocusTimeSessionModel({
    this.id = 0,
    this.completedSecond = 0,
    this.completionDateTime,
  });

  FocusTimeSessionModel copyWith({
    int? id,
    int? completedSecond,
    DateTime? completionDateTime,
  }) {
    return FocusTimeSessionModel(
      id: id ?? this.id,
      completedSecond: completedSecond ?? this.completedSecond,
      completionDateTime: completionDateTime ?? this.completionDateTime,
    );
  }

  @override
  String toString() =>
      'FocusTimeSessionModel(id: $id, completedSecond: $completedSecond, completionDateTime: $completionDateTime)';
}
