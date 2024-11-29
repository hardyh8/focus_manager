import 'package:equatable/equatable.dart';

class FocusTimeSessionEntity extends Equatable {
  final int completedSecond;
  final String completionDateTime;
  final String completionDay;

  const FocusTimeSessionEntity({
    this.completedSecond = 0,
    this.completionDateTime = '',
    this.completionDay = '',
  });

  @override
  List<Object?> get props =>
      [completedSecond, completionDateTime, completionDay];

  FocusTimeSessionEntity copyWith({
    int? completedSecond,
    String? completionDateTime,
    String? completionDay,
  }) {
    return FocusTimeSessionEntity(
      completedSecond: completedSecond ?? this.completedSecond,
      completionDateTime: completionDateTime ?? this.completionDateTime,
      completionDay: completionDay ?? this.completionDay,
    );
  }
}
