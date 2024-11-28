part of 'focus_timer_bloc.dart';

@immutable
abstract class FocusTimerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimerStartEvent extends FocusTimerEvent {}

class TimerStopEvent extends FocusTimerEvent {}

class TimerTickEvent extends FocusTimerEvent {
  final int totalTime;
  final int duration;
  TimerTickEvent(this.duration, this.totalTime);
}

class TimerPauseEvent extends FocusTimerEvent {}

class TimerResumeEvent extends FocusTimerEvent {}

class TimerSetDurationEvent extends FocusTimerEvent {
  final int duration;
  TimerSetDurationEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}
