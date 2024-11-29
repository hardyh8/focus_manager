part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class ScheduleCreateEvent extends ScheduleEvent {
  final ScheduleEventEntity task;

  const ScheduleCreateEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class ScheduleCompletedEvent extends ScheduleEvent {}

class ScheduleFailedEvent extends ScheduleEvent {}

class ScheduleEditEvent extends ScheduleEvent {}
