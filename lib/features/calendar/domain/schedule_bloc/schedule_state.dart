part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {}

final class ScheduleCreated extends ScheduleState {
  final ScheduleEventEntity task;

  const ScheduleCreated({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

final class ScheduleCompleted extends ScheduleState {}

final class ScheduleFailed extends ScheduleState {}

final class ScheduleEdited extends ScheduleState {}
