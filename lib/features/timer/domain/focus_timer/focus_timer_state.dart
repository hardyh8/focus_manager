part of 'focus_timer_bloc.dart';

@immutable
abstract class FocusTimerState extends Equatable {
  final int duration;
  const FocusTimerState(this.duration);
  @override
  List<Object?> get props => [duration];
}

final class FocusTimerInitial extends FocusTimerState {
  const FocusTimerInitial(super.duration);
}

final class FocusTimerStarted extends FocusTimerState {
  const FocusTimerStarted(super.duration);
}

final class FocusTimerRunning extends FocusTimerState {
  final int remainingTime;

  const FocusTimerRunning(this.remainingTime, super.duration);

  @override
  List<Object?> get props => [remainingTime, super.duration];
}

final class FocusTimerPaused extends FocusTimerState {
  final int leftTime;

  const FocusTimerPaused(this.leftTime, super.duration);

  @override
  List<Object?> get props => [leftTime, super.duration];
}

final class FocusTimerCompleted extends FocusTimerState {
  const FocusTimerCompleted(super.duration);
}

final class FocusTimerDurationUpdated extends FocusTimerState {
  const FocusTimerDurationUpdated(super.duration);
}
