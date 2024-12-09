part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  final ScheduleEventEntity task;

  const ScheduleEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class ScheduleInitializeEvent extends ScheduleEvent {
  const ScheduleInitializeEvent({required super.task});
}

class ScheduleCreateEvent extends ScheduleEvent {
  const ScheduleCreateEvent({required super.task});
}

class ScheduleCompletedEvent extends ScheduleEvent {
  const ScheduleCompletedEvent({required super.task});
}

class ScheduleFailedEvent extends ScheduleEvent {
  const ScheduleFailedEvent({required super.task});
}

class ScheduleEditEvent extends ScheduleEvent {
  const ScheduleEditEvent({required super.task});
}
