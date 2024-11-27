import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ticker.dart';

part 'focus_timer_event.dart';
part 'focus_timer_state.dart';

class FocusTimerBloc extends Bloc<FocusTimerEvent, FocusTimerState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  FocusTimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(FocusTimerInitial()) {
    on<TimerStartEvent>(_onStart);
    on<TimerStopEvent>(_onStop);
    on<TimerPauseEvent>(_onPause);
    on<TimerResumeEvent>(_onResume);

    on<TimerTickEvent>(_onTick);
  }

  void _onStart(TimerStartEvent event, Emitter<FocusTimerState> emit) async {
    emit(FocusTimerStarted(event.duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTickEvent(duration, event.duration)));
  }

  void _onStop(TimerStopEvent event, Emitter<FocusTimerState> emit) {
    _tickerSubscription?.cancel();
    emit(FocusTimerInitial());
  }

  void _onPause(TimerPauseEvent event, Emitter<FocusTimerState> emit) {
    if (state is FocusTimerRunning) {
      _tickerSubscription?.pause();
      var running = (state as FocusTimerRunning);
      emit(FocusTimerPaused(running.remainingTime, running.totalTime));
    }
  }

  void _onResume(TimerResumeEvent event, Emitter<FocusTimerState> emit) {
    if (state is FocusTimerPaused) {
      _tickerSubscription?.resume();
      var paused = (state as FocusTimerPaused);
      emit(FocusTimerRunning(paused.leftTime, paused.totalTime));
    }
  }

  void _onTick(TimerTickEvent event, Emitter<FocusTimerState> emit) {
    emit(
      event.duration > 0
          ? FocusTimerRunning(event.duration, event.totalTime)
          : FocusTimerCompleted(),
    );
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
