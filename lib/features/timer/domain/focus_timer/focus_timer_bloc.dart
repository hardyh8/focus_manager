import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/get_it/get_it_instance.dart';
import '../../data/api/focus_time_db.dart';
import '../../data/models/focus_time_model.dart';
import '../ticker.dart';

part 'focus_timer_event.dart';
part 'focus_timer_state.dart';

class FocusTimerBloc extends Bloc<FocusTimerEvent, FocusTimerState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;
  int _duration = 60;

  FocusTimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const FocusTimerInitial(60)) {
    on<TimerStartEvent>(_onStart);
    on<TimerStopEvent>(_onStop);
    on<TimerPauseEvent>(_onPause);
    on<TimerResumeEvent>(_onResume);
    on<TimerSetDurationEvent>(_onSetDuration);

    on<TimerTickEvent>(_onTick);
  }

  void _onStart(TimerStartEvent event, Emitter<FocusTimerState> emit) async {
    emit(FocusTimerStarted(_duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((dur) => add(TimerTickEvent(dur, _duration)));
  }

  void _onStop(TimerStopEvent event, Emitter<FocusTimerState> emit) {
    _tickerSubscription?.cancel();
    emit(FocusTimerInitial(_duration));
  }

  void _onPause(TimerPauseEvent event, Emitter<FocusTimerState> emit) {
    if (state is FocusTimerRunning) {
      _tickerSubscription?.pause();
      var running = (state as FocusTimerRunning);
      emit(FocusTimerPaused(running.remainingTime, _duration));
    }
  }

  void _onResume(TimerResumeEvent event, Emitter<FocusTimerState> emit) {
    if (state is FocusTimerPaused) {
      _tickerSubscription?.resume();
      var paused = (state as FocusTimerPaused);
      emit(FocusTimerRunning(paused.leftTime, _duration));
    }
  }

  void _onTick(TimerTickEvent event, Emitter<FocusTimerState> emit) {
    if (event.duration > 0) {
      emit(FocusTimerRunning(event.duration, event.totalTime));
    } else {
      FocusTimeSessionModel model = FocusTimeSessionModel(
        completedSecond: event.totalTime,
        completionDateTime: DateTime.now(),
      );
      getIt.get<FocusTimeDb>().insert(model);
      emit(FocusTimerCompleted(event.totalTime));
    }
  }

  void _onSetDuration(
      TimerSetDurationEvent event, Emitter<FocusTimerState> emit) {
    _duration = event.duration;
    if (state is FocusTimerPaused || state is FocusTimerRunning) {
      add(TimerStopEvent());
    }
    emit(FocusTimerDurationUpdated(_duration));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
