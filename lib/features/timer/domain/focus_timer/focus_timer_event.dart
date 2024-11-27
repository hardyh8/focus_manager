part of 'focus_timer_bloc.dart';

@immutable
abstract class FocusTimerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimerStartEvent extends FocusTimerEvent {
  final int duration;
  TimerStartEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerStopEvent extends FocusTimerEvent {}

class TimerTickEvent extends FocusTimerEvent {
  final int totalTime;
  final int duration;
  TimerTickEvent(this.duration, this.totalTime);
}

class TimerPauseEvent extends FocusTimerEvent {}

class TimerResumeEvent extends FocusTimerEvent {}
