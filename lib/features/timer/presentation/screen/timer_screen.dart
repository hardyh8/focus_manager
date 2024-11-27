import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/focus_timer/focus_timer_bloc.dart';
import '../../domain/ticker.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FocusTimerBloc(ticker: const Ticker()),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<FocusTimerBloc, FocusTimerState>(
          listener: (context, state) {
            if (state is FocusTimerCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Timer Completed!')),
              );
            }
          },
          builder: (BuildContext context, FocusTimerState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Let\'s focus for',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: CircularProgressIndicator(
                        strokeWidth: 18,
                        strokeCap: StrokeCap.round,
                        backgroundColor: AppColors.chartBgColor,
                        value: percentByState(state),
                        color: AppColors.primaryPinkColor,
                      ),
                    ),
                    Text(
                      timerByState(state),
                      style: GoogleFonts.jost(
                        color: AppColors.whiteColor,
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleBtnClickByState(state, context);
                      },
                      child: Text(actionByState(state)),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void handleBtnClickByState(FocusTimerState state, BuildContext context) {
    if (state is FocusTimerInitial || state is FocusTimerCompleted) {
      //START
      context.read<FocusTimerBloc>().add(TimerStartEvent(60));
    } else if (state is FocusTimerStarted || state is FocusTimerRunning) {
      //PAUSE
      context.read<FocusTimerBloc>().add(TimerPauseEvent());
    } else if (state is FocusTimerPaused) {
      //RESUME
      context.read<FocusTimerBloc>().add(TimerResumeEvent());
    }
  }

  String actionByState(FocusTimerState state) {
    if (state is FocusTimerInitial || state is FocusTimerCompleted) {
      return 'START';
    }
    if (state is FocusTimerStarted || state is FocusTimerRunning) {
      return 'PAUSE';
    }
    if (state is FocusTimerPaused) return 'RESUME';

    return 'START';
  }

  double percentByState(FocusTimerState state) {
    if (state is FocusTimerInitial) return 0.0;
    if (state is FocusTimerStarted) return 1.0;
    if (state is FocusTimerRunning) {
      return state.remainingTime.toDouble() / state.totalTime.toDouble();
    }
    if (state is FocusTimerPaused) {
      return state.leftTime.toDouble() / state.totalTime.toDouble();
    }
    if (state is FocusTimerCompleted) return 1.0;

    return 1.0;
  }

  String timerByState(FocusTimerState state) {
    if (state is FocusTimerInitial) return '00:00';
    if (state is FocusTimerStarted) return secondsToMinute(state.duration);
    if (state is FocusTimerRunning) return secondsToMinute(state.remainingTime);
    if (state is FocusTimerPaused) return secondsToMinute(state.leftTime);
    if (state is FocusTimerCompleted) return '00:00';

    return '00:00';
  }

  String secondsToMinute(int timeInSecond) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? '0$min' : '$min';
    String second = sec.toString().length <= 1 ? '0$sec' : '$sec';
    return '$minute:$second';
  }
}
