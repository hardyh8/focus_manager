part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  final List<ScheduleEventEntity> taskList;
  final ScheduleEventEntity? upcomingTask;

  const ScheduleState({
    required this.taskList,
    this.upcomingTask,
  });

  @override
  List<Object> get props => [taskList];
}

final class ScheduleLoading extends ScheduleState {
  const ScheduleLoading({required super.taskList, super.upcomingTask});
}

final class ScheduleInitial extends ScheduleState {
  const ScheduleInitial({required super.taskList, super.upcomingTask});
}

final class ScheduleCreated extends ScheduleState {
  final ScheduleEventEntity task;

  const ScheduleCreated(
      {required this.task, required super.taskList, super.upcomingTask});

  @override
  List<Object> get props => [task, super.taskList];
}

final class ScheduleCompleted extends ScheduleState {
  const ScheduleCompleted({required super.taskList, super.upcomingTask});
}

final class ScheduleFailed extends ScheduleState {
  const ScheduleFailed({required super.taskList, super.upcomingTask});
}

final class ScheduleEdited extends ScheduleState {
  const ScheduleEdited({required super.taskList, super.upcomingTask});
}
