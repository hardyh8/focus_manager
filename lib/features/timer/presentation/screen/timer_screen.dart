import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/buttons/icon_button.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/buttons/secondary_button.dart';
import '../../domain/focus_timer/focus_timer_bloc.dart';
import '../../domain/ticker.dart';
import '../widgets/time_picker_dialog.dart';

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
            var bloc = context.read<FocusTimerBloc>();
            // print(state);
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
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is FocusTimerInitial || state is FocusTimerCompleted
                        ? PrimaryButton(
                            onPressed: () {
                              handleBtnClickByState(state, context);
                            },
                            data: actionByState(state),
                          )
                        : SecondaryButton(
                            onPressed: () {
                              handleBtnClickByState(state, context);
                            },
                            data: actionByState(state),
                          ),
                    state is FocusTimerStarted ||
                            state is FocusTimerRunning ||
                            state is FocusTimerPaused
                        ? Row(
                            children: [
                              const SizedBox(width: 15),
                              CustomIconButton(
                                size: 20,
                                icon: Icons.undo,
                                onPressed: () {
                                  bloc.add(TimerStopEvent());
                                },
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      secondsToMinute(state.duration),
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SecondaryButton(
                      data: 'Set Timer',
                      onPressed: () async {
                        await onClickSetTimer(context, bloc);
                      },
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

  Future<void> onClickSetTimer(
      BuildContext context, FocusTimerBloc bloc) async {
    List<int>? time = await showDialog<List<int>>(
      context: context,
      builder: (ctx) => TimeSelectionDialog(
        initialSecond: bloc.state.duration,
      ),
    );
    if (time != null && time.length >= 2) {
      int totalSec = (time[0] * 3600) + (time[1] * 60);
      bloc.add(TimerSetDurationEvent(totalSec));
    }
  }

  void handleBtnClickByState(FocusTimerState state, BuildContext context) {
    if (state is FocusTimerInitial ||
        state is FocusTimerCompleted ||
        state is FocusTimerDurationUpdated) {
      //START
      context.read<FocusTimerBloc>().add(TimerStartEvent());
    } else if (state is FocusTimerStarted || state is FocusTimerRunning) {
      //PAUSE
      context.read<FocusTimerBloc>().add(TimerPauseEvent());
    } else if (state is FocusTimerPaused) {
      //RESUME
      context.read<FocusTimerBloc>().add(TimerResumeEvent());
    }
  }

  String actionByState(FocusTimerState state) {
    if (state is FocusTimerInitial ||
        state is FocusTimerCompleted ||
        state is FocusTimerDurationUpdated) {
      return 'START';
    }
    if (state is FocusTimerStarted || state is FocusTimerRunning) {
      return 'PAUSE';
    }
    if (state is FocusTimerPaused) return 'RESUME';

    return 'START';
  }

  double percentByState(FocusTimerState state) {
    if (state is FocusTimerInitial ||
        state is FocusTimerDurationUpdated ||
        state is FocusTimerCompleted) return 0.0;
    if (state is FocusTimerStarted) return 1.0;
    if (state is FocusTimerRunning) {
      return state.remainingTime.toDouble() / state.duration.toDouble();
    }
    if (state is FocusTimerPaused) {
      return state.leftTime.toDouble() / state.duration.toDouble();
    }

    return 1.0;
  }

  String timerByState(FocusTimerState state) {
    if (state is FocusTimerInitial ||
        state is FocusTimerDurationUpdated ||
        state is FocusTimerCompleted) return '00:00';
    if (state is FocusTimerStarted) return secondsToMinute(state.duration);
    if (state is FocusTimerRunning) return secondsToMinute(state.remainingTime);
    if (state is FocusTimerPaused) return secondsToMinute(state.leftTime);

    return '00:00';
  }

  String secondsToMinute(int timeInSecond) {
    int hours = timeInSecond ~/ 3600;
    int remainingSeconds = timeInSecond % 3600;
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;

    String hour = hours.toString().length <= 1 ? '0$hours' : '$hours';
    String minute = minutes.toString().length <= 1 ? '0$minutes' : '$minutes';
    String second = seconds.toString().length <= 1 ? '0$seconds' : '$seconds';
    return '$hour:$minute:$second';
  }
}
