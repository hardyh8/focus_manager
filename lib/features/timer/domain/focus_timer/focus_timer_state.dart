part of 'focus_timer_bloc.dart';

@immutable
abstract class FocusTimerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FocusTimerInitial extends FocusTimerState {}

final class FocusTimerStarted extends FocusTimerState {
  final int duration;

  FocusTimerStarted(this.duration);

  @override
  List<Object?> get props => [duration];
}

final class FocusTimerRunning extends FocusTimerState {
  final int remainingTime;
  final int totalTime;

  FocusTimerRunning(this.remainingTime, this.totalTime);

  @override
  List<Object?> get props => [remainingTime, totalTime];
}

final class FocusTimerPaused extends FocusTimerState {
  final int leftTime;
  final int totalTime;

  FocusTimerPaused(this.leftTime, this.totalTime);

  @override
  List<Object?> get props => [leftTime, totalTime];
}

final class FocusTimerCompleted extends FocusTimerState {}
